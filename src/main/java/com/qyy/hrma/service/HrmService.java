package com.qyy.hrma.service;


import com.qyy.hrma.domain.Employee;
import com.qyy.hrma.domain.User;

import java.util.List;
import java.util.Map;

public interface HrmService {

    User findByNamePwd(Map<String,Object> param);

    List<Employee> selectAllEmps(Map<String, Object> param);

    Integer getCount(Map<String,Object> param);

    /*List<Employee> selectByCondition(Map<String,Object> param);*/
}
