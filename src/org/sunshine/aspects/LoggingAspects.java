package org.sunshine.aspects;

import org.aspectj.lang.JoinPoint;

public class LoggingAspects {
	
	public void logMethodEntryAdvice(JoinPoint joinPoint){
		System.out.println("Entering the method:"+joinPoint.getSignature());
	}
	
	public void logMethodExitAdvice(JoinPoint joinPoint){
		System.out.println("Exiting the method:"+joinPoint.getSignature());
	}
	
	public void logMethodExitWithExceptionAdvice(JoinPoint joinPoint,Exception ex){
		System.out.println("Exiting the method "+ joinPoint.getSignature() + "\nwith Exception:"+ex.getMessage());
	}

}
