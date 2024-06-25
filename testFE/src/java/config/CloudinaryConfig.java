package config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import java.util.Map;

public class CloudinaryConfig {
    private static Cloudinary cloudinary;

    static {
        cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dieoz2rgk",
            "api_key", "412984353849189",
            "api_secret", "3qpF-tkZa8l1h3P-XPfeyVvbcrI"));
    }

    public static Cloudinary getCloudinary() {
        return cloudinary;
    }
}