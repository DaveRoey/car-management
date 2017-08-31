package com.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Dave on 2017/8/10 Describes 抢租客投诉类
 */
@Entity
@Table(name = "rentercomplain")
public class RenterComplain {
    @Id
    @GeneratedValue
    @Column
    private int comId;
    @Column
    private String reason;//投诉理由
    @Column
    private int comState;//投诉状态 0未受理（默认） 1受理（生效） 2不接受（无效） 3（暂缓处理)'
    @ManyToOne
    @JoinColumn(name = "rent_id")
    private RentPort rentPort;
    @Column
    private String comDate;


    public int getComId() {
        return comId;
    }

    public void setComId(int comId) {
        this.comId = comId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getComState() {
        return comState;
    }

    public void setComState(int comState) {
        this.comState = comState;
    }

    public RentPort getRentPort() {
        return rentPort;
    }

    public void setRentPort(RentPort rentPort) {
        this.rentPort = rentPort;
    }

    public String getComDate() {
        return comDate;
    }

    public void setComDate(String comDate) {
        this.comDate = comDate;
    }
}
