package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dao.SystemPortDao;
import com.mapper.SystemPortMapper;
import com.pojo.Page;
import com.pojo.SystemPort;
import com.service.SystemPortService;

@Service
public class SystemPortServiceImpl implements SystemPortService {
    @Resource(name = "systemPortDao")
    private SystemPortDao sPortDao;
    @Resource(name = "systemPortMapper")
    private SystemPortMapper sMapper;

    @Override
    public void addSystemPort(SystemPort port) {
        // TODO Auto-generated method stub
        sMapper.insertSystemPort(port);
    }

    @Override
    public boolean removeSystemPort(int portId) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean modifySystemPort(SystemPort port) {
        // TODO Auto-generated method stub
        return false;
    }

    // 得到条目的数量
    @Override
    public long findTheNumberOfSystemPort() {
        // TODO Auto-generated method stub
        long theNum = sPortDao.count();
        return theNum;
    }

    //模糊查询得到条目的数量
    private int findNumberOfSystemPort(int portState, String address) {
        return sPortDao.countByPortStateAndPortAdressLike(portState, "%" + address + "%");
    }

    @Override
    public Page findTheSystemPorts(int currentPage) {
        // TODO Auto-generated method stub
        Page page = new Page();
        page.setTotalRecord((int) findTheNumberOfSystemPort());
        page.setCurrentPage(currentPage);

        PageRequest request = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        System.out.println(page.getStartIndex());
        page.setList(findAllPorts(request));

        return page;
    }

    private List<SystemPort> findAllPorts(Pageable request) {
        return sPortDao.findAll(request).getContent();
    }


    private List<SystemPort> findPortsByInfo(int rentState, String info, Pageable request) {
        return sPortDao.findSystemPortsByPortStateAndPortAdressLike(rentState, info, request);


    }

    @Override
    public Page findSystemPortsByInfos(int rentState, String info, int currentPage) {
        // TODO Auto-generated method stub
        Page page = new Page();
        page.setTotalRecord(findNumberOfSystemPort(rentState, info));
        page.setCurrentPage(currentPage);
        PageRequest request = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        page.setList(findPortsByInfo(rentState, "%" + info + "%", request));
        return page;

    }

    @Override
    public List<SystemPort> findPortsByPortAddressAndPortNumber(String portAddress, String portNumber) {
        // TODO Auto-generated method stub

        List<SystemPort> ports = sPortDao.findSystemPortsByPortAdressAndPortNumber(portAddress, portNumber);
        return ports;

}

@Override
public int getCountByState(int state) {
	// TODO Auto-generated method stub
	//查询空闲车位数量 0为未出租
	;

	return sPortDao.countByPortState(0);
}

@Override
public List<SystemPort> getSystemPortsBystate(int state, Page page) {
	// TODO Auto-generated method stub
	//state为0：空闲车位
	Pageable pageable=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
	return sPortDao.findSystemPortsByPortState(0, pageable) ;
}



}
