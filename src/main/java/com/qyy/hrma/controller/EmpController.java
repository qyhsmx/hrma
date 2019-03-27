package com.qyy.hrma.controller;

import com.qyy.hrma.dao.EmployeeDao;
import com.qyy.hrma.domain.Employee;
import com.qyy.hrma.domain.GridModel;
import com.qyy.hrma.interceptor.SessionFilter;
import com.qyy.hrma.service.HrmService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/employee")
public class EmpController {

    private Logger logger = LogManager.getLogger(SessionFilter.class);

    @Autowired
    private StringRedisTemplate redisTemplate;
    @Autowired
    private HrmService hrmService;

    @GetMapping("/toEmpIndex")
    public String toEmpIndex(HttpServletRequest request){

        String active_user = redisTemplate.opsForValue().get("active_user");
        logger.info("当前session中的值是………………………………"+request.getSession().getAttribute("login_user"));
        if(active_user!=null){
            return "employee/employee";
        }else {
            return "index";
        }
    }

    @PostMapping("/getByad")
    @ResponseBody
    public Object aheadAd(@RequestParam Map<String,Object> param){

        logger.info("联想的条件是-------"+param);
        List<Employee> list = hrmService.aheadByAddress(param);


        return list;
    }
    @PostMapping("/getAll")
    @ResponseBody
    public GridModel getAll(@RequestParam Map<String,Object> param){
        int count = hrmService.getCount(param);
        logger.info("查询的条数是-------"+count);
        List<Employee> employees = hrmService.selectAllEmps(param);
        logger.info("查到的数据是-------"+employees);
        return new GridModel<Employee>("true","查询数据成功",employees,count);
    }


    @RequestMapping("/toMain")
    public String toMain(){
        return "main";
    }
}
