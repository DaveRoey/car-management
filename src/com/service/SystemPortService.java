package com.service;

import java.util.List;

import com.pojo.Page;
import com.pojo.SystemPort;

/**
 * Created by Dave on 2017/8/10
 * Describes    企业车位service
 */
public interface SystemPortService {
    /**
     * 添加车位
     *
     * @param port
     */
    void addSystemPort(SystemPort port);

    /**
     * 删除系统车位
     *
     * @param portId
     * @return
     */
    boolean removeSystemPort(int portId);

    /**
     * 修改系统车位
     *
     * @param port
     * @return
     */
    boolean modifySystemPort(SystemPort port);

     long findTheNumberOfSystemPort();
  
     Page findTheSystemPorts(int currentPage);
    
     Page findSystemPortsByInfos(int rentState,String info,int currentPage);
     
     List<SystemPort> findPortsByPortAddressAndPortNumber(String portAddress,String portNumber);
     /**
      * 根据状态查询系统车位数量(杨光)
      * @param state
      * @return
      */
     public int getCountByState(int state);
     /**
      * 根据状态来查询系统车位信息（带分页，杨光）
      * @param state
      * @param page
      * @return
      */
     public List<SystemPort> getSystemPortsBystate(int state,Page page);
     
     
}
