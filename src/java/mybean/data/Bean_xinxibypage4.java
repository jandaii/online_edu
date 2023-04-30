/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mybean.data;

import javax.ejb.Stateless;
import com.sun.rowset.*;

public class Bean_xinxibypage4 {

    CachedRowSetImpl rowSet = null;         //存储表中全部记录的行集对象
    int pageSize = 1;                      //每页显示的记录数
    int totalPages = 1;                     //分页后的总页数
    int currentPage = 1;                 //当前显示页 
    String backNews = "";

    public void setRowSet(CachedRowSetImpl set) {
        rowSet = set;
    }

    public CachedRowSetImpl getRowSet() {
        return rowSet;
    }

    public void setPageSize(int size) {
        pageSize = size;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int n) {
        totalPages = n;
    }

    public void setCurrentPage(int n) {
        currentPage = n;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public String getBackNews() {
        return backNews;
    }
}