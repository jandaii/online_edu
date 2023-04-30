/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet.control;

import java.io.File;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mybean.data.Bean_chengji;
import jxl.SheetSettings;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import java.util.ArrayList;
import java.util.List;

public class toexcel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String name=req.getParameter("name");
       List<Bean_chengji> list = new ArrayList<Bean_chengji>();
       list=(List<Bean_chengji>)req.getSession().getAttribute("list");
        String fileName = name + ".xls";
        resp.setContentType("application/x-excel");
        resp.setCharacterEncoding("UTF-8");
        resp.addHeader("Content-Disposition", "attachment;filename="
                + fileName);// excel文件名
        try {
            // 1.创建excel文件
            WritableWorkbook book = Workbook.createWorkbook(resp
                    .getOutputStream());
            // 居中
            WritableCellFormat wf = new WritableCellFormat();
            wf.setAlignment(Alignment.CENTRE);

            WritableSheet sheet = null;
            SheetSettings settings = null;
            for (int i = 0; i < list.size(); i++) {
                // 2.创建sheet并设置冻结前两行
                sheet = book.createSheet(list.get(i).getClass_name(), i);
                settings = sheet.getSettings();
                settings.setVerticalFreeze(1);
                // 3.添加第一行及第二行标题数据
                sheet.addCell(new Label(0, 0, "学生姓名", wf));
                sheet.addCell(new Label(1, 0, "学生学号", wf));
                sheet.addCell(new Label(2, 0, "学院", wf));
                sheet.addCell(new Label(3, 0, "专业", wf));
                sheet.addCell(new Label(4, 0, "班级", wf));
                sheet.addCell(new Label(5, 0, "科目", wf));
             
                 sheet.addCell(new Label(6, 0, "总分", wf));
                for (int j = 0; j < list.size(); j++) {
                    sheet.addCell(new Label(0, j + 1, list.get(j)
                            .getStudent_name()+ "", wf));
                    sheet.addCell(new Label(1, j + 1, list.get(j)
                            .getStudent_no()+ "", wf));
                    sheet.addCell(new Label(2, j + 1, list.get(j)
                            .getCollege()+ "", wf));
                    sheet.addCell(new Label(3, j + 1, list.get(j)
                            .getMajor()+ "", wf));
                    sheet.addCell(new Label(4, j + 1, list.get(j)
                            .getClass_name()+ "", wf));
                    sheet.addCell(new Label(5, j + 1, list.get(j)
                            .getCourse_name()+ "", wf));
                    sheet.addCell(new Label(6, j + 1, list.get(j)
                            .getAll_score()+ "", wf));
                }

            }

            book.write();
            book.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}