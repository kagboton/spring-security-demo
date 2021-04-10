package io.kagboton.springsecurity.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
       auth.inMemoryAuthentication()
               .withUser("john")
               .password(passwordEncoder().encode("john")).roles("EMPLOYEE")
               .and()
               .withUser("mary")
               .password(passwordEncoder().encode("mary")).roles("MANAGER", "EMPLOYEE")
               .and()
               .withUser("admin")
               .password(passwordEncoder().encode("admin")).roles("ADMIN","EMPLOYEE");
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/css/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/showLoginForm")
                .loginProcessingUrl("/authenticateUser")
                .permitAll()
                .and()
                .logout().permitAll();
    }
}
