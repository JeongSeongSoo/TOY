package org.toy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.toy.security.WebAuthenticationProvider;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	public WebAuthenticationProvider webAuthenticationProvider;
	
	@Autowired
	public AuthenticationSuccessHandler authenticationSuccessHandler;
 
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	/*
        auth.inMemoryAuthentication()
	        .passwordEncoder(passwordEncoder)
	        	.withUser("user").password(passwordEncoder.encode("123456")).roles("USER")
	        .and()
	        	.withUser("admin").password(passwordEncoder.encode("123456")).roles("USER", "ADMIN");
    	 */
    }
    
    @Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
    
    @Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.authorizeRequests()
				.antMatchers("/login/login").permitAll()
				.antMatchers("/login/join/**").permitAll()
				.anyRequest().authenticated()
			.and()
			.formLogin()
				.loginPage("/login/login")
				.loginProcessingUrl("/login/check")
				.successHandler(authenticationSuccessHandler)
			.and()
			.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/login/logout"))
				.logoutSuccessUrl("/login/login")
				.deleteCookies("JSESSIONID")
			.and()
			.authenticationProvider(webAuthenticationProvider);
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
	}
    
}