package edu.berkeley.gpporgs.security.oauth2.user;

import java.util.Map;

public class OAuth2UserInfoFactory {

    public static OAuth2UserInfo getOAuth2UserInfo(Map<String, Object> attributes) {
        return new OAuth2UserInfo(attributes);
    }
}
