package org.fullstack4.springmvc.controller.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.Arrays;

@Log4j2
@ControllerAdvice
public class CommonException {

/*    @ResponseBody
    @ExceptionHandler(NumberFormatException.class)
    public String exceptNumber(NumberFormatException numberFormatException){

        System.out.println("errmsg : " +numberFormatException.getMessage());

        return "NUMBER FORMAT EXCEPTION";


    }*/
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public String except(Exception e){

        StringBuilder sb = new StringBuilder("<ul>");
        sb.append("<li>" + e.getMessage() + "</li>");
        Arrays.stream(e.getStackTrace()).forEach(stackTraceElement -> {
            sb.append("<li>" + stackTraceElement + "</li>");

        });
        sb.append("</ul>");
        return sb.toString();
    }
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String notFound(){
        return "404";
    }
}
