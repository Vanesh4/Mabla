package com.example.BDMabla;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.SecurityFilterChain;


@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http.oauth2Login()
                .and().build();
    }
}

/*@Configuration
@PropertySource("application.yml")
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    *//*@Value("${auth0.issuer}")
    private String issuer;*//*

    @Value("${auth0.client-id}")
    private String clientId;

    @Value("${auth0.client-secret}")
    private String clientSecret;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/", "/public/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .oauth2Login()
                .loginPage("/IniciarSesion") // Ruta de tu página de inicio de sesión personalizada
                .userInfoEndpoint()
                .oidcUserService(oidcUserService());
    }

    @Bean
    public CustomOidcUserService oidcUserService() {
        return new CustomOidcUserService(clientId, clientSecret);
    }
}*/

