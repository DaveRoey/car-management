package com.service;

import java.util.List;

import com.pojo.Manage;

public interface InforOfManageService {
	Manage findEmpIdAndPasswordAndPhone(int empId);
	
	Manage findEmpIdAndPassword(int empId,String password);
	
	void updateManege(Manage manage);
}
