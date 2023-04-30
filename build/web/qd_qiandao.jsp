<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>签到页面</title>       
        <script type="text/javascript">
            function upload(obj) {
                document.getElementById(obj).disabled = true;
            }
        </script>
    </head>
    <!--<form action="qd_chenggong.jsp" method="post" name = form>-->  
    <table width="100%" height="100%" align="center">          
        <td>                 
        <center>              
            <font size="8" color="950827">点击进行签到</font><br>
            <div> 
                <input type="button" id="bt" value="点击签到" onclick="upload('bt')" style="width:100;height:50" colspan=20/> 
                <script type="text/javascript">
                    function $(id) {
                        return document.getElementById(id)
                    }
                    $('bt').onclick = function () {
                        alert('签到成功')
                    }
                </script>
            </div>    
        </center>
    </td> 
</table> 
</form>

</body>
</html>
