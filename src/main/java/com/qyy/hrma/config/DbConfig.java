package com.qyy.hrma.config;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Configuration
@MapperScan(basePackages = DbConfig.basePackage)
public class DbConfig {

    /**
     * 扫描mapper注解
     */
    static final String basePackage = "com.qyy.hrma.dao";

    @Bean
    @ConfigurationProperties("spring.datasource.druid.one")
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        return dataSource;
    }
    //配置Druid的监控
    //配置一个管理后台的Servlet
    @Bean
    public ServletRegistrationBean statViewServlet() {
        ServletRegistrationBean registrationBean = new ServletRegistrationBean(new StatViewServlet(),"/druid/*");
        Map<String, String> initParams = new HashMap<>();
        initParams.put("loginUsername","admin");    //登录名
        initParams.put("loginPassword","admin");    //登录密码
        initParams.put("allow","");//默认就是允许所有访问
        //initParams.put("deny","127.0.0.1");       //拒接访问
        registrationBean.setInitParameters(initParams);
        return registrationBean;
    }
    //配置一个web监控的filter
    @Bean
    public FilterRegistrationBean webStatFilter(){
        FilterRegistrationBean bean = new FilterRegistrationBean();
        bean.setFilter(new WebStatFilter());
        Map<String,String> initParams = new HashMap<>();
        initParams.put("exclusions","*.js,*.css,/druid/*");
        bean.setInitParameters(initParams);
        bean.setUrlPatterns(Arrays.asList("/*"));
        return  bean;
    }
}