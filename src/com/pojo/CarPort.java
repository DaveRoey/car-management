package com.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "carport")  
public class CarPort implements Serializable {
	@Id
	@GeneratedValue
	@Column
	private int portId;
	@Column
	private String propNumber;//产权证编号
	@Column
	private String location;//小区位置
	@Column
	private String portNumber;//车位编号
	@Column
	private String propImage;//车位照片
	@Column
	private String startTime;//开始租赁事件
	@Column
	private String endTime;//结束租赁时间
	@Column
	private BigDecimal price;//出租价格
	@Column
	private int portState;//车位状态（）
	@ManyToOne
	@JoinColumn(name = "letter_id")
	private Letter letter;// 包租婆

	public int getPortId() {
		return portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
	}

	public String getPropNumber() {
		return propNumber;
	}

	public void setPropNumber(String propNumber) {
		this.propNumber = propNumber;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPortNumber() {
		return portNumber;
	}

	public void setPortNumber(String portNumber) {
		this.portNumber = portNumber;
	}

	public String getPropImage() {
		return propImage;
	}

	public void setPropImage(String propImage) {
		this.propImage = propImage;
	}

	

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getPortState() {
		return portState;
	}

	public void setPortState(int portState) {
		this.portState = portState;
	}

	public Letter getLetter() {
		return letter;
	}

	public void setLetter(Letter letter) {
		this.letter = letter;
	}

	@Override
	public String toString() {
		return "CarPort [portId=" + portId + ", propNumber=" + propNumber
				+ ", location=" + location + ", portNumber=" + portNumber
				+ ", propImage=" + propImage + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", price=" + price + ", portState="
				+ portState + ", letter=" + letter + "]";
	}
	
	
}
