package com.kangyonggan.interceptor;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 权限验证
 *
 * @author kangyonggan
 * @since 16/4/29
 */
public class LoginValidator extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();

        if (url.indexOf("/dashboard") != -1 || url.indexOf("/admin") != -1) {
            HttpSession session = request.getSession();
            if (session.getAttribute("token") == null) {
                throw new UnauthorizedException("权限不足");
            }
        }
        return super.preHandle(request, response, handler);
    }
}
