package com.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "outtreaty")
public class OutTreaty implements Serializable {
    @javax.persistence.Id
    @GeneratedValue
    @Column
    private int treatyId;
    @Column
    private String treatyNumber;
    @Column
    private String startDate;
    @Column
    private String endDate;
    @Column
    private String company;
    @Column
    private String contact;
    @Column
    private String phone;
    @Column
    private String treatyImg;
    @Column
    private int count;
    @Column
    private int treatyState;

    public int getTreatyState() {
        return treatyState;
    }

    public void setTreatyState(int treatyState) {
        this.treatyState = treatyState;
    }

    public int getTreatyId() {
        return treatyId;
    }

    public void setTreatyId(int treatyId) {
        this.treatyId = treatyId;
    }

    public String getTreatyNumber() {
        return treatyNumber;
    }

    public void setTreatyNumber(String treatyNumber) {
        this.treatyNumber = treatyNumber;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTreatyImg() {
        return treatyImg;
    }

    public void setTreatyImg(String treatyImg) {
        this.treatyImg = treatyImg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
