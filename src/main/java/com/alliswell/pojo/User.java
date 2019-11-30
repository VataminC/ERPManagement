package com.alliswell.pojo;

import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class User {
    private Integer uId;
    private String uName;
    private String uPwd;

    public User() {
    }

    public User(Integer uId, String uName, String uPwd) {
        this.uId = uId;
        this.uName = uName;
        this.uPwd = uPwd;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return uId.equals(user.uId) &&
                uName.equals(user.uName) &&
                uPwd.equals(user.uPwd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uId, uName, uPwd);
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", uPwd='" + uPwd + '\'' +
                '}';
    }
}
