package com.gaozhd.study.common.json;

import java.lang.reflect.Type;

public class JsonUtil {
    private static IJson json = new JsonImpl();

    public static String toJson(Object obj) {
        return json.toJson(obj);
    }

    public <T> T fromJson(String jsonString, Type type) {
        return json.fromJson(jsonString, type);
    }
}
