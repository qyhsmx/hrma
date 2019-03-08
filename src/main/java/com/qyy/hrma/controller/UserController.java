package com.qyy.hrma.controller;



import com.alibaba.fastjson.JSON;
import com.qyy.hrma.domain.User;
import com.qyy.hrma.service.HrmService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class UserController {

    private final Logger logger = LogManager.getLogger(UserController.class);

    @Autowired
    private HrmService hrmService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @GetMapping("/")
    public String index(){

        return "index";
    }

    /**
     * 处理登陆逻辑
     * @param param
     * @return
     */
    @RequestMapping("/user/login")
    public ModelAndView login(@RequestParam Map<String,Object> param, HttpServletRequest request){

        logger.info("传递的用户名和密码是--"+param);
        ModelAndView mv  = new ModelAndView();
        mv.setViewName("index");


        if(param.get("loginname")!=null && param.get("password")!=null){

            User user = hrmService.findByNamePwd(param);

            if(user!=null){
                request.getSession().setAttribute("login_user",user);
                redisTemplate.opsForValue().set("active_user", JSON.toJSONString(user));
                redisTemplate.expire("active_user",60*30, TimeUnit.SECONDS);
                logger.info("放入redis的值是"+JSON.toJSONString(user));
                mv.setViewName("main");
                mv.addObject("user",user);
                return mv;
            }else {
                mv.addObject("msg","密码或者用户名错误");
                return mv;
            }
        }else{
            mv.addObject("msg","密码或者用户名格式有问题");
            return mv;
        }
    }

}
