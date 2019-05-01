package com.xg.pojo;

import java.util.Date;

public class SensorDesc {
    private Long id;

    private Long sid;

    private String status;

    private String olddata;

    private String newdata;

    private Date time;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getOlddata() {
        return olddata;
    }

    public void setOlddata(String olddata) {
        this.olddata = olddata == null ? null : olddata.trim();
    }

    public String getNewdata() {
        return newdata;
    }

    public void setNewdata(String newdata) {
        this.newdata = newdata == null ? null : newdata.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}