package com.qyy.hrma.dao;

import com.qyy.hrma.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

@Mapper
public interface UserDao {


    @Select("select * from user where loginname=#{loginname} and password=#{password}")
    @ResultType(User.class)
    User getByNamePwd(Map<String, Object> param);

}
