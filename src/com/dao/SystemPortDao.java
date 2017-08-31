package com.dao;

import com.pojo.SystemPort;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes 系统车位dao
 */
public interface SystemPortDao extends JpaRepository<SystemPort,Integer> {

    /**
     * 根据id查找车位
     *
     * @param portId
     * @return
     */
    SystemPort findSystemPortByPortId(int portId);


    /**
     * 根据车位状态获取车位
     *
     * @param portState
     * @return
     */
    List<SystemPort> findSystemPortsByPortStateAndPortAdressLike(int portState,String address, Pageable pageable);

       long count();
       int countByPortStateAndPortAdressLike(int portState,String address);

    List<SystemPort> findSystemPortsByPortAdressAndPortNumber(String address,String PortNumber);
       
    List<SystemPort> findSystemPortsByPortState(int portState, Pageable pageable);

    /**
     * 查询所有的车位 并根据地址去重
     *
     * @return
     * @author Dave 2017/8/23
     */
    @Query("select distinct s.portAdress from SystemPort s")
    List<SystemPort> findDistinctAddress();

    /**
     * 根据地址获取车位信息
     *
     * @param address
     * @return
     * @author Dave 2017/8/23
     */
    List<SystemPort> findSystemPortsByPortAdress(String address);
    
    /**
     * 根据状态查询系统车位数量（杨光）
     * @param portState
     * @return
     */
    public int countByPortState(Integer portState);


}
