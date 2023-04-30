<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>签到成功</title>
    </head>
    <body>
    <center>
        <h2>签到成功</h2>
        <form action="qd_qiandao.jsp" method="post" name = form>
            <br><input type="submit" value="返回签到页面" ><br>
        </form>
        <% Integer count = (Integer) application.getAttribute("count");
            if (count == null) { 
                count = 0;
            }
            count = count + 1;//每访问一次累加1
            application.setAttribute("count", count);
        %>
        <br>
        <h2>你是第<%= count%>个签到成功的。<h2>
    </body>
</html>
