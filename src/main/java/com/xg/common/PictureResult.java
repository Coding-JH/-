package com.xg.common;

import java.io.Serializable;

/**
 * Created by Mr.Hou on 2019/4/29.
 */
public class PictureResult implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 上传图片返回值，成功：0 失败：1 */
    private Integer error;

    /** 回显图片使用的url */
    private String url;

    /** 错误时的错误消息 */
    private String message;

    public PictureResult() {
    }

    public PictureResult(Integer error, String url, String message) {
        this.error = error;
        this.url = url;
        this.message = message;
    }

    public Integer getError() {
        return error;
    }

    public PictureResult setError(Integer error) {
        this.error = error;
        return this;
    }

    public String getUrl() {
        return url;
    }

    public PictureResult setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public PictureResult setMessage(String message) {
        this.message = message;
        return this;
    }

}
