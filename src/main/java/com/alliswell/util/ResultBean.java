package com.alliswell.util;

import java.util.List;

/**
 * @Author: All is well
 */
public class ResultBean {
    private int code;
    private String msg;
    private int count;
    private List<Object> data;

    public static final String SUCCESS = "success";
    public static final String FAILURE = "FAILURE";

    public ResultBean() {
        this(0,"",0,null);
    }

    public ResultBean(String msg) {
        this(0,msg,0,null);
    }


    public ResultBean(int code, String msg, int count, List<Object> data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }
}
