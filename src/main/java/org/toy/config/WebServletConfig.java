package org.toy.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/*
 * <annotation-driven />
 */
@EnableWebMvc
@ComponentScan(basePackages= {"org.toy.web"})
public class WebServletConfig implements WebMvcConfigurer {
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		/*
			<!-- Re solves views selected for rendering by @Controllers to .jsp resources in the /WEB-INF/views directory -->
			<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
				<beans:property name="prefix" value="/WEB-INF/views/" />
				<beans:property name="suffix" value=".jsp" />
			</beans:bean>
		*/
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		bean.setOrder(2);
		registry.viewResolver(bean);
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		/*
		 * <!-- Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory -->
		 * <resources mapping="/resources/**" location="/resources/" />
		 */
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
}