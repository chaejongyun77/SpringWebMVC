package org.fullstack4.springmvc.util;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CookieUtil {

    public Cookie getCookie(String name, String value, String path, int time) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath(path);
        cookie.setMaxAge(time);
        return cookie;
    }

    public String readCookie(HttpServletRequest req) {

        Cookie[] cookies = req.getCookies();
        String cookieId= "";

        for(Cookie c : cookies){
            String name =c.getName();
            String value = c.getValue();
            if(name.equals("user_id")){
                cookieId = value;
            }
        }

        return cookieId;
    }
    public void deleteCookie(HttpServletResponse res){
        Cookie cookie = new Cookie("user_id", null); // 삭제할 쿠키에 대한 값을 null로 지정
        cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
        cookie.setPath("/");
        res.addCookie(cookie); // 응답에 추가해서 없어지도록 함
    }


}

