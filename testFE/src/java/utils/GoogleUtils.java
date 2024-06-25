//package utils;
//
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
//import jakarta.security.auth.message.callback.SecretKeyCallback.Request;
//import org.apache.http.client.fluent.Request;
//import org.apache.http.client.fluent.Response;
//
//import java.io.IOException;
//import java.text.Normalizer.Form;
//import java.time.LocalDateTime;
//import model.Constants;
//import model.GsonProvider;
//import model.User;
//import org.apache.coyote.Response;
//import org.apache.http.client.fluent.Form;
//import org.apache.tomcat.util.net.Constants;
//
//public class GoogleUtils {
//
//    private static final Gson gson = GsonProvider.getGson();
//
//    public static String getToken(String code) throws IOException {
//        Response response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
//            .bodyForm(Form.form().add("code", code)
//                .add("client_id", Constants.GOOGLE_CLIENT_ID)
//                .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
//                .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
//                .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
//            .execute();
//
//        String responseBody = response.returnContent().asString();
//        System.out.println("Token Response: " + responseBody);
//
//        JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);
//        return jsonObject.get("access_token").getAsString();
//    }
//
//    public static User getUserInfo(final String accessToken) throws IOException {
//        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        Response response = Request.Get(link)
//            .addHeader("Authorization", "Bearer " + accessToken)
//            .execute();
//        
//        String responseBody = response.returnContent().asString();
//        System.out.println("User Info Response: " + responseBody);
//        
//        JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);
//        System.out.println("JSON response: " + jsonObject.toString());
//        // Extract additional user information
//
//        String email = jsonObject.get("email").getAsString();
//        String name = jsonObject.has("name") ? jsonObject.get("name").getAsString() : null;
//        String givenName = jsonObject.has("given_name") ? jsonObject.get("given_name").getAsString() : null;
//        String familyName = jsonObject.has("family_name") ? jsonObject.get("family_name").getAsString() : null;
//        String picture = jsonObject.get("picture").getAsString();
//        
//        User user = new User();
//        System.out.println(name);
//        // Set properties
//        user.setEmail(email);
//        user.setUserName(name);
//        user.setFirstName(givenName);
//        user.setLastName(familyName);
//        user.setRole(1);
//        user.setRegistrationDate(LocalDateTime.now());
//        user.setIsActive(true);
//        user.setBio("Default bio");
//        user.setAvatar(picture);
//
//        return user;
//    }
//}