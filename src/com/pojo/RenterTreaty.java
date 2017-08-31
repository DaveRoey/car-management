package com.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Dave on 2017/8/10 Describes 企业租赁合约
 */
@Entity
@Table(name = "rentertreaty")
public class RenterTreaty {

    @Id
    @GeneratedValue
    @Column
    private int treatyId;
    @Column
    private String treatyNumber;
    @Column
    private String startDate;
    @Column
    private String endDate;

    public int getTreatyState() {
        return treatyState;
    }

    public void setTreatyState(int treatyState) {
        this.treatyState = treatyState;
    }

    @Column
    private int treatyState;
    @ManyToOne
    @JoinColumn(name = "etp_id")
    private Enterprise enterprise;

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

    public Enterprise getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise) {
        this.enterprise = enterprise;
    }
}
