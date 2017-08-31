package com.mapper;

import org.apache.ibatis.annotations.Insert;

import com.pojo.SystemPort;

/**
 * Created by Dave on 2017/8/10
 * Describes 系统车位mapper
 */
public interface SystemPortMapper {

    /**
     * 添加车位
     * @param port
     */
	@Insert("insert into SystemPort values(default,#{portAdress},#{portNumber},0)")
    void insertSystemPort(SystemPort port);

    /**
     * 删除系统车位
     * @param portId
     * @return
     */
    int deleteSystemPort(int portId);

    /**
     * 修改系统车位
     * @param port
     * @return
     */
    int updateSystemPort(SystemPort port);
    

}
