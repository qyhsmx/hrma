package com.qyy.hrma.dao;


import com.qyy.hrma.domain.Job;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface JobDao {

    @Select("select * from job where id = #{id}")
    Job selectjobById(Integer id);
}
