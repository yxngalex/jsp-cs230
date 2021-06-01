package com.example.app.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class UrlUtil {
    public static String getUrlBase(String url) {
    String[] parts = url.split("/");
    return parts[parts.length - 1];
    }

    public static String encodedValue(String value) {
        try {
            return URLEncoder.encode(value, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
            return "";
        }
    }

    public static String decodeValue(String value) {
        try {
            return URLDecoder.decode(value, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex.getCause());
        }
    }
}
