 <%@page import="java.sql.*, java.util.*, java.io.*"%> 

<%
    String userId = (String)session.getAttribute("userid");
    if( userId == null ){
//        response.sendRedirect("index.jsp");
    }

    // fetch data from userId
    
    try{
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "c##aadi", "aadi");
    Statement statement = connection.createStatement();

    ResultSet basicInfo = statement.executeQuery(
        String.format("select * from customer where customer_id = %d", Integer.parseInt(userId))
    );
    
    String outMsg = "";

    while( basicInfo.next() ){
        String name = basicInfo.getString("name");
        java.sql.Date DOB = basicInfo.getDate("date_of_birth");
        Integer weight = basicInfo.getInt("weight");
        Integer height = basicInfo.getInt("height");
        Integer age = basicInfo.getInt("age");
        String special = basicInfo.getString("special");
        String bp = basicInfo.getString("blood_pressure");
        
        outMsg += 
            String.format("Name:%s, CustomerId:%s, DOB:%s, Weight:%d, Height:%d, Age:%d, Special:%s, BP:%s",
                name, userId, DOB, weight, height, age, special, bp);
        
    }  
    
    PreparedStatement ps = connection.prepareStatement(
        "select * from phone where customer_id = ?");
    ps.setInt(1, Integer.parseInt(userId));
    
    ResultSet nums = ps.executeQuery();
    
    int c = 0;
    String[] tmp = new String[2];
    tmp[0] = "";
    tmp[1] = "";
    
    while( nums.next() ){
        tmp[c] = nums.getBigDecimal(1).toString();
        c++;
    }
    
    outMsg += String.format(", Phone1:%s", tmp[0]);
    outMsg += String.format(", Phone2:%s", tmp[1]);

    
    ps = connection.prepareStatement(
        "select * from address where customer_id = ?");
    ps.setInt(1, Integer.parseInt(userId));
    
    ResultSet addr = ps.executeQuery();
    
    c = 0;
    String[][] vals = new String[2][3];
    
    for(String[] row : vals){
        Arrays.fill(row, "");
    }
    
    while( addr.next() ){
        vals[c][0] = addr.getString(1);
        vals[c][1] = addr.getString(2);
        vals[c][2] = Integer.toString(addr.getInt(3));
       
        c++;
    }
    
    outMsg += String.format(", State1:%s, City1:%s, Street1:%s",
        vals[0][0], vals[0][1], vals[0][2]);
    
    outMsg += String.format(", State2:%s, City2:%s, Street2:%s",
        vals[1][0], vals[1][1], vals[1][2]);
        
    
    out.println(outMsg);
    
//    ResultSet res = phone.executeQuery(String.f)
    }catch(Exception e){
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>


