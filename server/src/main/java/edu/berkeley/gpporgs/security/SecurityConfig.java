package edu.berkeley.gpporgs.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.config.BeanIds;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, jsr250Enabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private JwtTokenFilter jwtTokenFilter;
    
    @Autowired
    private OAuth2UserService userService;

    @Autowired
    private OAuth2SuccessHandler oAuth2SuccessHandler;

    @Autowired
    private OAuth2FailureHandler oAuth2FailureHandler;

    @Autowired
    private JwtTokenEntryPoint jwtAuthenticationEntryPoint;

    @Autowired
    HttpCookieRequestRepository httpCookieRepository;

    @Bean(BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // enable CORS and disable CSRF
        http.cors().and().csrf().disable()
        // disable form and httpBasic login
        .formLogin().disable().httpBasic().disable()
        // set session management
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
        // set unauthorized requests exception handler
        .exceptionHandling().authenticationEntryPoint(jwtAuthenticationEntryPoint).and()
        // set permissions on endpoints
        .authorizeRequests()
        .antMatchers("/", "/login", "/admin", "/auth/**", "/oauth/**", "/oauth2/**", "/graphql","/graphiql").permitAll()
        .antMatchers("/favicon.ico", "/**/*.html", "/**/*.js", "/**/*.css", "/**/*.map").permitAll()
        .anyRequest().authenticated().and()
        // configure custom UserService
        .oauth2Login()
        .authorizationEndpoint()
        .authorizationRequestRepository(httpCookieRepository).and()
        .userInfoEndpoint()
        .userService(userService).and()
        // set error/success handlers
        .successHandler(oAuth2SuccessHandler)
        .failureHandler(oAuth2FailureHandler).and()
        // add JWT token filter
        .addFilterBefore(jwtTokenFilter, UsernamePasswordAuthenticationFilter.class);
    }
}
