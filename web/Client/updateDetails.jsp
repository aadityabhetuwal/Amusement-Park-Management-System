<%@page import="java.sql.*, java.text.*, java.io.*"%>

<%!static Integer toInteger(String str){
    if (str == null || str.equals(""))
        return java.sql.Types.NULL;
    else{
        return Integer.parseInt(str);
    }
}
%>

<%!static void setIntegerorNull(PreparedStatement ps,
            Integer ind, Integer val){
        
        try{
            if(val == null){
                ps.setNull(ind, java.sql.Types.INTEGER);
            }else{
                ps.setInt(ind, val);
            }
        }catch(SQLException e){
            // TODO handle exception
//            out.println(e.getMessage());
        }
    }
%>

<%!static void setStringOrNull(PreparedStatement ps,
            Integer ind, String val){
        
        try{
            if(val == null){
                ps.setNull(ind, java.sql.Types.VARCHAR);
            }else{
                ps.setString(ind, val);
            }
        }catch(SQLException e){
            // TODO handle exception
//            out.println(e.getMessage());
        }
    }
%>

<%
    
    String userId = (String) session.getAttribute("userid"); 

    if( userId == null ){
        response.sendRedirect("index.jsp");
    }
    
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", 
            "c##aadi", "aadi");
    Statement statement = connection.createStatement();
    ResultSet rs = statement.executeQuery("Select customer_id from Customer");
    
    Integer customerId = Integer.parseInt(userId);
    
    boolean accepted = false;

    while ( rs.next() ){
        if (rs.getInt("customer_id") == customerId )
        {
            accepted = true; 
            break;
        }
    }

    if (!accepted){
        out.println("<script> alert('Customer does not exist');"
           +" window.location='updateCustomer.jsp'; </script>");
    
    }else{
        String DOB = request.getParameter("DOB");
        Integer weight = toInteger(request.getParameter("weight"));
        Integer height = toInteger(request.getParameter("height"));
//        Integer age = toInteger(request.getParameter("age"));
        String special = request.getParameter("special");
        Integer bloodPressure = toInteger(request.getParameter("bloodPressure"));
        String phone1 = request.getParameter("phone1");
        String phone2 = request.getParameter("phone2");
        String state1 = request.getParameter("state1");
        String city1 = request.getParameter("city1");
        Integer street1 = toInteger(request.getParameter("street1"));
        String state2 = request.getParameter("state2");
        String city2 = request.getParameter("city2");
        Integer street2 = toInteger(request.getParameter("street2"));
        
        java.sql.Date convDob = java.sql.Date.valueOf(DOB);
        
        try{
            PreparedStatement ps = connection.prepareStatement("update customer " 
                +" set date_of_birth = ?, weight = ?, height = ?, special = ?,"
                + " blood_pressure = ? where customer_id = ?");

            ps.setDate(1, convDob);
            setIntegerorNull(ps, 2, weight);
            setIntegerorNull(ps, 3, height);
            ps.setString(4, special);
            setIntegerorNull(ps, 5, bloodPressure);
            ps.setInt(6, customerId);

            ps.execute();


            Statement st = connection.createStatement();

            st.execute("update customer set age = round((sysdate - to_date('" + DOB + "', 'yyyy-mm-dd'))/365.25)" + 
                " where customer_id = " + customerId);

            // it is easier to delete and add than check and update
            PreparedStatement delAddr = connection.prepareStatement(
                    "delete from address where address.customer_id = ?");
            delAddr.setInt(1, customerId);

            delAddr.execute();

            delAddr.close();

            ps = connection.prepareStatement("insert into address values (? ,? ,? ,?)");

            if( (state1 != null && city1 != null && street1 != null) && 
                ( !state1.equals("") && !city1.equals("") && !street1.equals("")) ){

                ps.setString(1, state1);
                ps.setString(2, city1);
                setIntegerorNull(ps, 3, street1);
                setIntegerorNull(ps, 4, customerId);

                ps.execute();
            }

            if( (state2 != null && city2 != null && street2 != null) &&
                (!state2.equals("") && !city2.equals("") && !street2.equals("")) ){

                ps.setString(1, state2);
                ps.setString(2, city2);
                setIntegerorNull(ps, 3, street2);
                setIntegerorNull(ps, 4, customerId);

                ps.execute();
            }

            PreparedStatement delNum = connection.prepareStatement(
                    "delete from phone where phone.customer_id = ?");
            delNum.setInt(1, customerId);
            delNum.execute();
            delNum.close();

            ps = connection.prepareStatement("insert into phone values (?, ?)");

            if( phone1 != null && !phone1.equals("") ){
                setStringOrNull(ps, 1, phone1);
                setIntegerorNull(ps, 2, customerId);
                ps.execute();
            }

            if( phone2 != null && !phone2.equals("") ){
                setStringOrNull(ps, 1, phone2);
                setIntegerorNull(ps, 2, customerId);
                ps.execute();
            }

            out.println("<script>alert(\"Customer details Updated\");" +
                "window.location=\"updateCustomer.jsp\"</script>");

        }catch(Exception e){
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    }

%>
