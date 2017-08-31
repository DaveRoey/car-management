package com.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "manager")
public class Manage implements Serializable {

    @Id
    @GeneratedValue
    @Column
    private int managerId;//管理员编号id

    @Column
    private int empId;  //工号Id

    @Column
    private String password;//密码

    @Column
    private String userName;//"姓名"

    @Column
    private String phone;//电话号码

    @Column
    private String role;//'权限 用数字代表  多个用逗号分隔'

    @Column
    private int flag;//是否是管理员

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public Manage() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Manage(int managerId, int empId, String password, String userName,
                  String phone, String role) {
        super();
        this.managerId = managerId;
        this.empId = empId;
        this.password = password;
        this.userName = userName;
        this.phone = phone;
        this.role = role;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Manage [managerId=" + managerId + ", empId=" + empId
                + ", password=" + password + ", userName=" + userName
                + ", phone=" + phone + ", role=" + role + "]";
    }


}
