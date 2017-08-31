package com.pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Dave on 2017/8/22
 * Describes 企业租赁
 */
@Entity
@Table(name = "etprent")
public class EtpRent implements Serializable {
    @Id
    @GeneratedValue
    @Column
    private int rentId;
    @ManyToOne
    @JoinColumn(name = "treaty_id")
    private RenterTreaty renterTreaty;
    @ManyToOne
    @JoinColumn(name = "port_id")
    private SystemPort port;

    public int getRentId() {
        return rentId;
    }

    public void setRentId(int rentId) {
        this.rentId = rentId;
    }

    public RenterTreaty getRenterTreaty() {
        return renterTreaty;
    }

    public void setRenterTreaty(RenterTreaty renterTreaty) {
        this.renterTreaty = renterTreaty;
    }

    public SystemPort getPort() {
        return port;
    }

    public void setPort(SystemPort port) {
        this.port = port;
    }
}
