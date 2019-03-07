package com.qyy.hrma.dao;


import com.qyy.hrma.domain.Employee;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;
import java.util.Map;

@Mapper
public interface EmployeeDao {


    List<Employee> getAll(Map<String, Object> param);

    Integer getCount(Map<String, Object> param);

}
