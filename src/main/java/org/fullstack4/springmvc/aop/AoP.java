package org.fullstack4.springmvc.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AoP {

    //다른 메소드 시작 전 수행 될 AOP 메소드
    @Before("within(org.fullstack4.springmvc..*)")
    public void beforeMethod(){
        System.out.println("메소드 시작전");

    }

    @After("within(org.fullstack4.springmvc..*)")
    public void afterMethod(){
        System.out.println("메소드 시작 후");
    }

    public void springAop(JoinPoint jpt){
        Signature signature = jpt.getSignature();
        System.out.println("joinPoint information: " + jpt);
        System.out.println("joinPoint information 타입: " + signature.getDeclaringType());
        System.out.println("joinPoint information 타입이름: " + signature.getDeclaringTypeName());

    }

}
