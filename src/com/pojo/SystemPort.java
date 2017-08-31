package com.pojo;

import javax.persistence.*;

/**
 * Created by Dave on 2017/8/10 Describes 系统车位类
 */
@Entity
@Table(name = "systemport")
public class SystemPort {
    @Id
    @GeneratedValue
    @Column
    private int portId;
    @Column
    private String portAdress;
    @Column
    private String portNumber;
    @Column
    private int portState;

    public int getPortId() {
        return portId;
    }

    public void setPortId(int portId) {
        this.portId = portId;
    }

    public String getPortAdress() {
        return portAdress;
    }

    public void setPortAdress(String portAdress) {
        this.portAdress = portAdress;
    }

    public String getPortNumber() {
        return portNumber;
    }

    public void setPortNumber(String portNumber) {
        this.portNumber = portNumber;
    }

    public int getPortState() {
        return portState;
    }

    public void setPortState(int portState) {
        this.portState = portState;
    }
}
