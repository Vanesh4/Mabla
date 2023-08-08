/*
package com.example.BDMabla.Servicios;

import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;

@Service
public class CustomOidcUserService extends OidcUserService {
//    private final String issuer;
    private final String clientId;
    private final String clientSecret;

    public CustomOidcUserService(String clientId, String clientSecret) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
    }

    @Override
    public OidcUser loadUser(OidcUserRequest userRequest) throws OAuth2AuthenticationException {
        // Personaliza la carga del usuario según tus necesidades
        // Puede incluir verificación de tokens JWT, asignación de roles, etc.
        return super.loadUser(userRequest);
    }
}
*/
