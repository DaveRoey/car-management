package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.RenterDao;
import com.mapper.RenterMapper;
import com.pojo.Page;
import com.pojo.RentPort;
import com.pojo.Renter;
import com.service.RenterService;
@Service
public class RenterServiceImpl implements RenterService {
    @Resource(name="renterMapper")
	private RenterMapper rentMapper;
    @Resource(name="renterDao")
    private RenterDao renterDao;
	@Override
	public void addRenter(Renter renter) {
		// TODO Auto-generated method stub
		rentMapper.insertRenter(renter);
		
	}

	@Override
	public int removeRenter(Renter renter) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Renter findRenterByRenterId(int renterId) {
		// TODO Auto-generated method stub
		return null;
	}

    /**
     * 这个方法不知是谁写的  不实现接口 update by Dave 2017/8/24
     *
     * @param renterId （租客id）
     * @param page     分页信息
     * @return
     */
    @Override
    public List<RentPort> findTransHistory(int renterId, Page<Integer> page) {
        return null;
    }


	@Override
	public int modifyRenter(Renter renter) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public Renter findRenterByUserNameAndPassword(String userName, String Password) {
		// TODO Auto-generated method stub
	Renter renter=	renterDao.findByUserNameAndPassword(userName, Password);
		return renter;
	}



	@Override
	public void updateLetter(Renter renter) {
		// TODO Auto-generated method stub
		rentMapper.updateRenter(renter);
	}

	/**
	 * 验证renter用户名是否存在（黄赛）
	 */
	@Override
	public Renter regexRenterUserName(String regexUserName) {
		// TODO Auto-generated method stub
		return renterDao.findRenterByUserName(regexUserName);
	}

}
