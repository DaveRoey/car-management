package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dao.EnterpriseDao;
import com.mapper.EnterpriseMapper;
import com.pojo.Enterprise;
import com.pojo.Page;
import com.service.EnterpriseService;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {

	@Resource
	private EnterpriseMapper enterpriseMapper;
	@Resource
	private EnterpriseDao enterpriseDao;
	
	@Override
	public void addEnterprise(Enterprise enterprise) {
		enterpriseMapper.insertEnterprise(enterprise);
	}

	@Override
	public boolean removeEnterprise(int etpId) {
		if(enterpriseMapper.deleteEnterprise(etpId)>0) {
			return true;
		}else {
			return false;
		}

	}

	@Override
	public boolean modifyEnterprise(Enterprise enterprise) {
		// TODO Auto-generated method stub
		//先查再改
		Enterprise temp= enterpriseDao.findOne(enterprise.getEtpId());
		//修改对应的字段
		if(enterprise.getContact()!=null){
			temp.setContact(enterprise.getContact());
		}
		if(enterprise.getEtpName()!=null){
			temp.setEtpName(enterprise.getEtpName());
		}
		if(enterprise.getLocation()!=null){
			temp.setLocation(enterprise.getLocation());
		}
		if(enterprise.getPhone()!=null){
			temp.setPhone(enterprise.getPhone());
		}
		enterpriseDao.save(temp);
		return true;
		
	}

	@Override
	public Enterprise findEnterpriseByEtpId(int etpId) {
		// TODO Auto-generated method stub
		return enterpriseDao.findEnterpriseByEtpId(etpId);
	}

	@Override
	public Enterprise findEnterpriseByUserName(String userName) {
		// TODO Auto-generated method stub
		return enterpriseDao.findEnterpriseByUserName(userName);
	}

	@Override
	public List<Enterprise> findEnterprisesByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(String location,
			String etpName, String contact, String phone, Page<Enterprise> page) {
		PageRequest request=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		return enterpriseDao.findEnterprisesByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike("%"+location+"%", "%"+etpName+"%", "%"+contact+"%", "%"+phone+"%", request);
	}

	@Override
	public int getTotalCountByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(String location, String etpName,
			String contact, String phone) {
		// TODO Auto-generated method stub
		return enterpriseDao.countByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike("%"+location+"%", "%"+etpName+"%", "%"+contact+"%", "%"+phone+"%");
	}

	@Override
	public boolean changePwd(int userId, String newpwd,String oldpwd) {
		// TODO Auto-generated method stub
		//先根据id得到该用户的信息
		Enterprise enterprise=enterpriseDao.findOne(userId);
		
		String oldtemp=DigestUtils.md5Hex(oldpwd);
		
		if(enterprise.getPassword().equals(oldtemp)){
			//旧密码验证成功
			String s=DigestUtils.md5Hex(newpwd);
			//对新密码进行加密处理
			enterprise.setPassword(s);
			enterpriseDao.save(enterprise);
			return true;
		}else{
			return false;
		}
		
		
		
		
		
	}

	@Override
	public Enterprise login(String userName, String password) {
		// TODO Auto-generated method stub
		
		return enterpriseDao.findEnterpriseByUserNameAndPassword(userName, password);
	}

}
