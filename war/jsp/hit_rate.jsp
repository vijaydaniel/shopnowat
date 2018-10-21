<%@ page import="org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils,org.sunshine.hitrate.HitRateService" %>
<%
ApplicationContext ctx = RequestContextUtils.getWebApplicationContext(request);
HitRateService a = (HitRateService) ctx.getBean("hitRateService");
a.setHitRate();
%>