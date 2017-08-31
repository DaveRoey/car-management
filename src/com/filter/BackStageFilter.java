package com.filter;

import com.pojo.Manage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URI;

/**
 * Created by Dave on 2017/8/22
 * Describes 后台权限过滤器
 */
@WebFilter(filterName = "BackStageFilter", urlPatterns = "/*", dispatcherTypes = {DispatcherType.FORWARD,
        DispatcherType.INCLUDE, DispatcherType.REQUEST})
public class BackStageFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //强转
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String reqUri = request.getRequestURI().toLowerCase();
        HttpSession session = request.getSession();
        Manage manage = (Manage) session.getAttribute("manage");

        if (reqUri.contains("backstage/login.html")) {
            if (manage != null) {//session为空去主页面
                response.sendRedirect("/backstage/main.jsp");
            }
        }
        /*公共资源*/
        if (reqUri.contains("backstage/home.html") || reqUri.contains("xinxiguanli") || reqUri.contains("backstage/main.jsp")) {
            if (reqUri.contains("managerlogin.do")) {//登录
                filterChain.doFilter(request, response);
                return;
            }
            if (manage != null) {
                filterChain.doFilter(request, response);
                return;
            } else {
                response.sendRedirect("/backstage/login.html");
            }
        }

        //用户管理
        if (reqUri.contains("baozupoguanli") || reqUri.contains("qiyeguanli")) {
            if (manage != null) {
                if (manage.getRole().contains("1")) {
                    filterChain.doFilter(request, response);
                }
                return;
            } else {
                response.sendRedirect("/backstage/login.html");
            }
        }
        //车位管理
        if (reqUri.contains("cheweiguanli")) {
            if (manage != null) {
                if (manage.getRole().contains("4")) {
                    filterChain.doFilter(request, response);
                }
                return;
            } else {
                response.sendRedirect("/backstage/login.html");
            }
        }
        //权限管理 管理员才有权限
        if (reqUri.contains("cheweiguanli")) {
            if (manage != null) {
                if (manage.getFlag() == 1) {
                    filterChain.doFilter(request, response);
                }
                return;
            } else {
                response.sendRedirect("/backstage/login.html");
            }
        }

        //投诉管理
        if (reqUri.contains("tousuguanli")) {
            if (manage != null) {
                if (manage.getRole().contains("3")) {
                    filterChain.doFilter(request, response);
                }
                return;
            } else {
                response.sendRedirect("/backstage/login.html");
            }
        }

        //外部合约
        if (reqUri.contains("waibuheyue") || reqUri.contains("zuhuheyue")) {
            if (manage != null) {
                if (manage.getRole().contains("2")) {
                    filterChain.doFilter(request, response);
                }
                return;
            } else {
                response.sendRedirect("/backstage/login.html");
            }
        }
        filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }
}
