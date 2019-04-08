package com.qyy.hrma.service.Impl;


import com.qyy.hrma.dao.EmployeeDao;
import com.qyy.hrma.dao.UserDao;
import com.qyy.hrma.domain.Employee;
import com.qyy.hrma.domain.User;
import com.qyy.hrma.service.HrmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Transactional(propagation= Propagation.REQUIRED,isolation= Isolation.DEFAULT)
@Service("hrmService")
@SuppressWarnings("all")
public class HrmServiceImpl implements HrmService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private EmployeeDao employeeDao;

    @Cacheable(cacheNames="hrmse")
    @Override
    public User findByNamePwd(Map<String, Object> param) {
        return userDao.getByNamePwd(param);
    }

    @Cacheable(cacheNames="hrmse")
    @Override
    public List<Employee> selectAllEmps(Map<String, Object> param) {
        return employeeDao.getAll(param);
    }

    @Cacheable
    @Override
    public Integer getCount(Map<String, Object> param) {
        return employeeDao.getCount(param);
    }

    @Override
    public List<Employee> aheadByAddress(Map<String, Object> param) {
        return employeeDao.aheadByAddress(param);
    }


}
