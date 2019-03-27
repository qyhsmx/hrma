package com.qyy.hrma.interceptor;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 自定义过滤器
 * 注册在dbconfig中
 * @author QinYong
 */
public class SessionFilter implements Filter {

    private Logger logger = LogManager.getLogger(SessionFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        logger.info("过滤器生效了！！！！！！！！");
        filterChain.doFilter(new RemoteSession((HttpServletRequest) servletRequest),servletResponse);
    }

    @Override
    public void destroy() {

    }
}
