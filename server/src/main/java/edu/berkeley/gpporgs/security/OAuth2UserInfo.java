package edu.berkeley.gpporgs.security;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Map;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Getter
@AllArgsConstructor
public class OAuth2UserInfo {

    protected Map<String, Object> attributes;

    public String getFirstName() {
        return (String) attributes.get("given_name");
    }

    public String getLastName() {
        return (String) attributes.get("family_name");
    }

    public String getEmail() {
        return (String) attributes.get("email");
    }
}
