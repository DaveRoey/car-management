package com.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rentport")
public class RentPort {
	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	@Id

	@GeneratedValue
	@Column
	private int rentId;
	@Column
	private String describes;//订单描述
	@Column
	private String message;//强租客留言
	@Column
	private String answer;//包租婆回复
	@Column
	private int rentState;//0 预定车位（默认） 1  同意出租  2包租婆拒绝（丑拒）3交易完成',
	@Column
	private String startDate;//订单生成日期（租客租期）
	@Column
	private String endDate;//订单结束日期（当租客还车位时生效）
	
	@ManyToOne
	@JoinColumn(name = "renter_id")
	private Renter renter; //租客
	@ManyToOne
	@JoinColumn(name = "port_id")
	private CarPort carPort; //车位
	
	
	


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

	public int getRentId() {
		return rentId;
	}

	public void setRentId(int rentId) {
		this.rentId = rentId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getRentState() {
		return rentState;
	}

	public void setRentState(int rentState) {
		this.rentState = rentState;
	}

	public Renter getRenter() {
		return renter;
	}

	public void setRenter(Renter renter) {
		this.renter = renter;
	}

	public CarPort getCarPort() {
		return carPort;
	}

	public void setCarPort(CarPort carPort) {
		this.carPort = carPort;
	}
}
