package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pojo.Manage;

public interface InforOfManagerDao extends JpaRepository<Manage, Integer> {

    Manage findManageByEmpIdAndPassword(int empId, String password);

    Manage findManageByEmpId(int empId);
}
