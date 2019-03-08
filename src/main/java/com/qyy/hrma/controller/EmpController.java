package com.qyy.hrma.controller;

import com.qyy.hrma.dao.EmployeeDao;
import com.qyy.hrma.domain.Employee;
import com.qyy.hrma.domain.GridModel;
import com.qyy.hrma.service.HrmService;
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

    @Autowired
    private StringRedisTemplate redisTemplate;
    @Autowired
    private HrmService hrmService;

    @GetMapping("/toEmpIndex")
    public String toEmpIndex(HttpServletRequest request){

        String active_user = redisTemplate.opsForValue().get("active_user");

        System.out.println("当前session中的值是………………………………"+request.getSession().getAttribute("login_user"));
        if(active_user!=null){
            return "employee/employee";
        }else {
            return "index";
        }
    }

    @PostMapping("/getByad")
    @ResponseBody
    public Object aheadAd(@RequestParam Map<String,Object> param){


        System.out.println("联想的条件是-------"+param);

        List<Employee> list = hrmService.aheadByAddress(param);


        return list;
    }
    @PostMapping("/getAll")
    @ResponseBody
    public GridModel getAll(@RequestParam Map<String,Object> param){
        System.out.println(param);
        int count = hrmService.getCount(param);
        System.out.println("查询的条数是-------"+count);
        List<Employee> employees = hrmService.selectAllEmps(param);
        System.out.println("查到的数据是-------"+employees);
        return new GridModel<Employee>("true","查询数据成功",employees,count);
    }
}
