package com.alliswell.pojo;

import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class User {
    private Integer id;
    private String name;
    private String pwd;

    public User() {
    }

    public User(Integer id, String name, String pwd) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {return true;}
        if (!(o instanceof User)) {return false;}
        User user = (User) o;
        return Objects.equals(id, user.id) &&
                Objects.equals(name, user.name) &&
                Objects.equals(pwd, user.pwd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, pwd);
    }
}
