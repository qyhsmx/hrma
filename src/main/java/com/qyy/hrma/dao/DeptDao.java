package com.qyy.hrma.dao;


import com.qyy.hrma.domain.Dept;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

@Mapper
public interface DeptDao {
    @Select("select * from dept where id=#{id}")
    Dept selectdeptById(Integer id);
}
