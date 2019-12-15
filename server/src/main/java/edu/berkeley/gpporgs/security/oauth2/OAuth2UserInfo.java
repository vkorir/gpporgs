package edu.berkeley.gpporgs.security.oauth2;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Map;

@Getter
@AllArgsConstructor
public class OAuth2UserInfo {

    protected Map<String, Object> attributes;

    public String getFirstName() {
        return capitalizeFirst((String) attributes.get("given_name"));
    }

    public String getLastName() {
        return capitalizeFirst((String) attributes.get("family_name"));
    }

    public String getEmail() {
        return (String) attributes.get("email");
    }

    private String capitalizeFirst(String string) {
        if (string.length() == 0) {
            return null;
        }
        String firstChar = string.substring(0, 1).toUpperCase();
        return firstChar + string.substring(1).toLowerCase();
    }
}
