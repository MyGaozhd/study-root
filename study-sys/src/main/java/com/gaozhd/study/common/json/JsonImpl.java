package com.gaozhd.study.common.json;

import com.google.gson.Gson;

import java.lang.reflect.Type;

public class JsonImpl implements IJson {
    private Gson gson;

    public JsonImpl() {
        gson = new Gson();
    }

    @Override
    public String toJson(Object obj) {
        return gson.toJson(obj);
    }

    @Override
    public <T> T fromJson(String jsonString, Type type) {
        return gson.fromJson(jsonString,type);
    }
}
