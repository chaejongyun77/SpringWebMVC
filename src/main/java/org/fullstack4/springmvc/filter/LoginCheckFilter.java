package org.fullstack4.springmvc.filter;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter(urlPatterns = {"/bbs/*", "/member/*"})
public class LoginCheckFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);

                
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res= (HttpServletResponse) response;
        String path = req.getRequestURI();


        HttpSession session = req.getSession();
        if(path.equals("/member/join")) {
            chain.doFilter(request, response); // 필터 체인을 계속 진행
            return;
        }

        if(session.getAttribute("memberDTO") == null) {

            res.sendRedirect("/login/login");

            return;

        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
