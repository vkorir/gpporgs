package edu.berkeley.gpporgs.security.oauth2;

import edu.berkeley.gpporgs.exception.OAuth2AuthenticationProcessingException;
import edu.berkeley.gpporgs.model.User;
import edu.berkeley.gpporgs.repository.UserRepository;
import edu.berkeley.gpporgs.security.UserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Optional;

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

    private OAuth2User processOAuth2User(OAuth2User oAuth2User) {
        OAuth2UserInfo oAuth2UserInfo = new OAuth2UserInfo(oAuth2User.getAttributes());
        if(StringUtils.isEmpty(oAuth2UserInfo.getEmail())) {
            throw new OAuth2AuthenticationProcessingException("Email not found from OAuth2 provider");
        }
        Optional<User> userOptional = userRepository.findById(OAuth2UserInfo.getCalNetId(oAuth2UserInfo.getEmail()));
        User user;
        if(userOptional.isPresent()) {
            user = userOptional.get();
            user = updateAndSaveUser(user, oAuth2UserInfo);
        } else {
            user = registerNewUser(oAuth2UserInfo);
        }

        return UserPrincipal.create(user, oAuth2User.getAttributes());
    }

    private User registerNewUser(OAuth2UserInfo oAuth2UserInfo) {
        User user = new User();
        user.setIsAdmin(false);
        Date now = new Date();
        user.setCreationTime(now.getTime());
        user.setNumberOfLogin(0);
        return updateAndSaveUser(user, oAuth2UserInfo);
    }

    private User updateAndSaveUser(User user, OAuth2UserInfo oAuth2UserInfo) {
        user.setId(OAuth2UserInfo.getCalNetId(oAuth2UserInfo.getEmail()));
        user.setFirstName(oAuth2UserInfo.getFirstName());
        user.setLastName(oAuth2UserInfo.getLastName());
        Date now = new Date();
        user.setLastLogin(now.getTime());
        user.setNumberOfLogin(user.getNumberOfLogin() + 1);
        return userRepository.save(user);
    }
}
