package com.xuyuan.j2ee.jms.post;

// 前台受理快件，发送到后台：仓库
public interface FrontDesk {
    public void sendMail(Mail mail);
}
