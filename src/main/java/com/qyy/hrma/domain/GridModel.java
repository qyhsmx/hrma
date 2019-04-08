package com.qyy.hrma.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 后台统一封装模型
 * @author QinYong
 * @param <T>
 */
public class GridModel<T> implements Serializable {

    private String status;
    private String msg;
    private List<T> rows;
    private int total;

    public GridModel(String status, String msg, List<T> rows, int total) {
        this.status = status;
        this.msg = msg;
        this.rows = rows;
        this.total = total;
    }

    public GridModel() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public int gettotal() {
        return total;
    }

    public void settotal(int total) {
        this.total = total;
    }
}
