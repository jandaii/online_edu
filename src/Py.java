
import java.io.DataInputStream;
import java.io.InputStream;
import static java.lang.Math.log;


public class Py {
     public String executePython(String sentencespoint) {
     
        String success = "500";
        String exe = "python";
        //要执行python文件的位置
        String command = "D:\\Study\\fifth\\实训\\NetBeans\\score.py";
        //fromPath, toPath, picPath, fileName -->传递给python的参数
        String[] cmdArr = new String[]{exe, command,sentencespoint};
        Process process = null;
        try {
            process = Runtime.getRuntime().exec(cmdArr);
            InputStream is = process.getInputStream();
            DataInputStream dis = new DataInputStream(is);
            //视频处理完成 返回1
            String result = dis.readLine();
            //log.info("python返回结果：" + result);
            System.out.print(result);
            process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
 
}
