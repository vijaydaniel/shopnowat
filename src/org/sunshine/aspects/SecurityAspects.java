package org.sunshine.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect 
public class SecurityAspects {
	
	@Before("loggingPointCut()")
	public void logMethodEntryAdvice(JoinPoint joinPoint){
		System.out.println("Security log:"+joinPoint.getSignature());
	}
	
	@Pointcut("within(org.sunshine..*Controller)")
	public void loggingPointCut(){
		
	}
	
}
