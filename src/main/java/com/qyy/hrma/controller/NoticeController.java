package com.qyy.hrma.controller;

import com.alibaba.fastjson.JSON;
import com.qyy.hrma.domain.Notice;
import com.qyy.hrma.domain.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private StringRedisTemplate redisTemplate;

    private Logger log = LogManager.getLogger(NoticeController.class);

    @RequestMapping("/addNotice")
    public String addNotice(@RequestParam Map<String,Object> param, HttpServletRequest request){

        String user = redisTemplate.opsForValue().get("active_user");
        User parseObject = JSON.parseObject(user, User.class);
        log.info("从redis中取出的内容是----"+user+"转成对象是"+parseObject);
        request.setAttribute("user",parseObject);

        return "/notice/notice";
    }

    @PostMapping("/releaseNotice")
    public String insertNotice(@RequestParam Map<String,Object> param){

        log.info("提交文章的内容是*****"+param);
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        if(param!=null){
            Notice notice = new Notice();
            int u_id = Integer.parseInt((String) param.get("u_id"));
            String content = (String) param.get("editormd-html-textarea");
            Date date = new Date(System.currentTimeMillis());
            String submitPerson = (String) param.get("submitPerson");
            //讲公告放入redis,保存24个小时
            //如果多个通知如何
            Map<String,String> map = new HashMap<>();
            map.put("submitPerson",submitPerson);
            map.put("article",content);
            map.put("date",sdf.format(date));

            redisTemplate.opsForValue().set("notice",JSON.toJSONString(map),60*60*24, TimeUnit.SECONDS);

            //将公告放入mysql存档
            notice.setContent(content);
            notice.setCreateDate(date);
            notice.setuId(u_id);

            return "main";


        }else{

            return "/notice/notice";
        }
    }

    @RequestMapping("/getNotice")
    @ResponseBody
    public String getNotice(){


        String notice = redisTemplate.opsForValue().get("notice");
        log.info("开始获取公告"+notice);

        return notice;
    }
}
