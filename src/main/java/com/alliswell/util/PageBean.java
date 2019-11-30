package com.alliswell.util;

import java.util.List;

public class PageBean<T> {

    /**
     * 当前页
     */
    private int pageNumber = 1;

    /**
     * 总页数
     */
    private int totalPage;

    /**
     * 总记录数
     */
    private int totalCount;

    /**
     * 每页显示的记录条数
     */
    private int pageSize;

    /**
     * 每页显示的记录条数
     */
    private List<T> beanList;

    /**
     * 默认每页显示8条数据
     */
    private final int DEFAULT_PAGESIZE=8;

    public PageBean(int pageNumber,int totalCount,int pageSize){
        this.pageNumber = (pageNumber <=0) ? 1:pageNumber;
        this.totalCount = totalCount;
        if(pageSize>0) {
            this.pageSize = pageSize;
        }else{
            this.pageSize = DEFAULT_PAGESIZE;
        }
        this.totalPage = ((this.totalCount/this.pageSize) < 1) ? 1:(this.totalCount%this.pageSize) ==0 ? (this.totalCount/this.pageSize):(this.totalCount/this.pageSize)+1;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        if(pageNumber>totalPage){
            this.pageNumber = totalPage;
        }else if(pageNumber<=1){
            this.pageNumber = 1;
        }else{
            this.pageNumber = pageNumber;
        }
    }

    public int getTotalPage() {
        return totalPage;
    }

    private void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getBeanList() {
        return beanList;
    }

    public void setBeanList(List<T> beanList) {
        this.beanList = beanList;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageNumber=" + pageNumber +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                ", beanList=" + beanList +
                '}';
    }
}
