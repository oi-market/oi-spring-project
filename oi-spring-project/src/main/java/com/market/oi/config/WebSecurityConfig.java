package com.market.oi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		// Security를 무시(제외)
		web.ignoring()
		   .antMatchers("/resources/**")	
		   .antMatchers("/img/**")
		   .antMatchers("/css/**")
		   .antMatchers("/js/**")
		   .antMatchers("/vendor/**")
		   .antMatchers("/favicon/**")
		   .antMatchers("/node/**")
		   ;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// URL에 따른 로그인, 권한 설정
		http
			//권한 에러 발생(403)
			//사용하지 않으면 기본 제공 에러 처리 방법 사용
			.exceptionHandling()
//				.accessDeniedPage("/member/error") //error page URL
//				.accessDeniedHandler(new SecurityException())//error 처리 class
				.and()
			.cors().and()
			.csrf().disable()
			.authorizeRequests()
				.antMatchers("/").permitAll()
				.antMatchers("/notice/list", "/notice/select").permitAll()
				.antMatchers("/notice/**").permitAll()
//				.antMatchers("/notice/**").hasRole("ADMIN")
				.antMatchers("/qna/qnaList").permitAll()
				.antMatchers("/qna/qnaSelect").permitAll()
				.antMatchers("/qna/**").permitAll()
//				.antMatchers("/qna/**").hasRole("ADMIN")
				.antMatchers("/member/memberProfile").hasAnyRole("ADMIN", "MEMBER")
				.antMatchers("/member/join").permitAll()
				.antMatchers("/member/**").permitAll()
//				.antMatchers("/member/**").hasAnyRole("ADMIN", "MEMBER")
				.anyRequest().authenticated()
				.and()
			.formLogin()
//				.usernameParameter("email")
//				.passwordParameter("pw")
				//로그인페이지를 따로 만들지 않아도 기본 내장된 폼으로 이동
				//개발자가 만든 로그인폼을 사용하려면 다음과 같이 작성
				.loginPage("/member/sign-in")
				.defaultSuccessUrl("/member/memberLoginResult")
				//Login 실패 처리
				.failureUrl("/member/loginFail")
//				.failureHandler(new LoginFail())
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/member/memberLogout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.permitAll()
				;
		
		
	}
	
}
