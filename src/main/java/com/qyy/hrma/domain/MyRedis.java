package com.qyy.hrma.domain;

import redis.clients.jedis.Jedis;

public class MyRedis {

    public static Jedis getJedis(){
        Jedis jedis = new Jedis("106.14.184.37",6379);
        jedis.auth("123456");
        return jedis;
    }
}
