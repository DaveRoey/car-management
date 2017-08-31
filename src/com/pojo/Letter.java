package com.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "letter")
public class Letter implements Serializable {
	@Id
	@GeneratedValue
	@Column
	private int letterId;
	@Column
	private String userName;
	@Column
	private String password;
	@Column
	private String realName;
	@Column
	private String address;
	@Column
	private String indentNumber;
	@Column
	private String phone;
	@Column
	private String profession;
	@Column
	private String email;
	@Column
	private int complain;
	@Column
	private int count;
	@Column
	private int state;//1.显示类别：已审核、未审核、全部；2.姓名查询
	@JsonIgnore
	@OneToMany(cascade=CascadeType.ALL,mappedBy = "letter",fetch=FetchType.EAGER)
	private List<CarPort> carPorts=new ArrayList<CarPort>();

	public int getLetterId() {
		return letterId;
	}

	public void setLetterId(int letterId) {
		this.letterId = letterId;
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

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIndentNumber() {
		return indentNumber;
	}

	public void setIndentNumber(String indentNumber) {
		this.indentNumber = indentNumber;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getComplain() {
		return complain;
	}

	public void setComplain(int complain) {
		this.complain = complain;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public List<CarPort> getCarPorts() {
		return carPorts;
	}

	public void setCarPorts(List<CarPort> carPorts) {
		this.carPorts = carPorts;
	}
}
