package com.pojo;

import javax.persistence.*;


/**
 * 外部合约续约类
 */
@Entity
@Table(name = "renewtreaty")
public class Renewtreaty {
    @Id
    @GeneratedValue
    @Column
    private int treatyId;
    @Column
    private String newNumber;
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
    @OneToOne
    @JoinColumn(name = "treaty_id")
    private OutTreaty treaty;

    public int getTreatyId() {
        return treatyId;
    }

    public void setTreatyId(int treatyId) {
        this.treatyId = treatyId;
    }

    public String getNewNumber() {
        return newNumber;
    }

    public void setNewNumber(String newNumber) {
        this.newNumber = newNumber;
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

    public OutTreaty getTreaty() {
        return treaty;
    }

    public void setTreaty(OutTreaty treaty) {
        this.treaty = treaty;
    }
}
