package com.pojo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Dave on 2017/8/10 Describes 包租婆投诉类
 */
@Entity
@Table(name = "lettercomplain")
public class LetterComplain {
  @Id
  @GeneratedValue
  @Column
  private int comId;
  @Column
  private String reason;
  @Column
  private int comState;
  @ManyToOne
  @JoinColumn(name = "rent_id")
  private RentPort rentPort;//投诉的订单
  @Column(name="comDate")
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
