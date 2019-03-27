package com.qyy.hrma.interceptor;

import com.alibaba.fastjson.JSON;
import com.qyy.hrma.domain.MyRedis;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class RemoteSession extends HttpServletRequestWrapper {

    public RemoteSession(HttpServletRequest request) {
        super(request);
    }

    @Override
    public HttpSession getSession() {
        return RemoteSessionHandler.getInstance(super.getSession());
    }

}
//配置代理类
class RemoteSessionHandler implements InvocationHandler{

    private Logger logger = LogManager.getLogger(SessionFilter.class);

    @Autowired
    private RedisTemplate redisTemplate;

    private HttpSession session;

    public RemoteSessionHandler(HttpSession session) {
        this.session = session;
    }

    public static HttpSession getInstance(HttpSession session){
            RemoteSessionHandler remoteSessionHandler = new RemoteSessionHandler(session);
            return (HttpSession) Proxy.newProxyInstance(session.getClass().getClassLoader(),session.getClass().getInterfaces(),remoteSessionHandler);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

        String userKey = args[0]+"-"+session.getId();

        if("setAttribute".equals(method.getName())){
            System.out.println(args);
            Jedis jedis = MyRedis.getJedis();
            jedis.set(userKey, JSON.toJSONString(args[1]));
            jedis.expire(userKey,30*60);
            logger.info("存入代理session的键是"+userKey+"---value是"+args[1]);

        }else if("getAttribute".equals(method.getName())){
            Jedis jedis = MyRedis.getJedis();
            String s = jedis.get(userKey);
            return s;
        }
        return method.invoke(session,args);
    }
}
