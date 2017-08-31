/*
  Created by dave
  describes 企业实体类
 */
package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "enterprise")
public class Enterprise {

  @Id
  @GeneratedValue
  @Column
  private int etpId;
  @Column
  private String userName;
  @Column
  private String password;
  @Column
  private String etpName;
  @Column
  private String location;
  @Column
  private String contact;
  @Column
  private String phone;

  public int getEtpId() {
    return etpId;
  }

  public void setEtpId(int etpId) {
    this.etpId = etpId;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEtpName() {
    return etpName;
  }

  public void setEtpName(String etpName) {
    this.etpName = etpName;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
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
}
