package org.toy.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		/*
		 * <!-- The definition of the Root Spring Container shared by all Servlets and
		 * Filters --> <context-param> <param-name>contextConfigLocation</param-name>
		 * <param-value>/WEB-INF/spring/root-context.xml</param-value> </context-param>
		 */
		return new Class[] { WebRootConfig.class, WebSecurityConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		/*
		 * <!-- Processes application requests --> <servlet>
		 * <servlet-name>appServlet</servlet-name>
		 * <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-
		 * class> <init-param> <param-name>contextConfigLocation</param-name>
		 * <param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
		 * </init-param> <load-on-startup>1</load-on-startup> </servlet>
		 */
		return new Class[] { WebServletConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		/*
		 * <servlet-mapping> <servlet-name>appServlet</servlet-name>
		 * <url-pattern>/</url-pattern> </servlet-mapping>
		 */
		return new String[] { "/" };
	}
	
}