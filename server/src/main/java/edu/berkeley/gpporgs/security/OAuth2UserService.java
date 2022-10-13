package edu.berkeley.gpporgs.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.UserRepository;

import java.util.Date;
import java.util.TimeZone;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @author Victor Korir
 * @Date 10/01/2020
 */

@Service
public class OAuth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Override
    public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(oAuth2UserRequest);
        try {
            return processOAuth2User(oAuth2User);
        } catch (AuthenticationException ex) {
            throw ex;
        } catch (Exception ex) {
            // Throwing an instance of AuthenticationException will trigger the OAuth2AuthenticationFailureHandler
            throw new InternalAuthenticationServiceException(ex.getMessage(), ex.getCause());
        }
    }

    private OAuth2User processOAuth2User(OAuth2User oAuth2User) throws Exception {
        OAuth2UserInfo oAuth2UserInfo = new OAuth2UserInfo(oAuth2User.getAttributes());
        if(oAuth2UserInfo.getEmail().isEmpty()) {
            throw new Exception("Email not found from OAuth2 provider");
        }
        User user = userRepository.findByEmail(oAuth2UserInfo.getEmail()).orElse(null);
        if (user == null || !user.getHasAccess()) {
            throw new Exception("You are not authorized to access this site.");
        }
        user = updateAndSaveUser(user, oAuth2UserInfo);
        return UserPrincipal.create(user, oAuth2User.getAttributes());
    }

    private User updateAndSaveUser(User user, OAuth2UserInfo oAuth2UserInfo) {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
        dateFormat.setTimeZone(timeZone);
        user.setFirstName(oAuth2UserInfo.getFirstName());
        user.setLastName(oAuth2UserInfo.getLastName());
        user.setLastLogin(dateFormat.format(new Date()));
        user.setNumberOfLogin(user.getNumberOfLogin() + 1);
        return userRepository.save(user);
    }
}
