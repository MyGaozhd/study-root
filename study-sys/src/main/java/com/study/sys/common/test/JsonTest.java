package com.study.sys.common.test;

import com.study.sys.common.json.IJson;
import com.study.sys.common.json.JsonUtil;

import java.util.HashMap;
import java.util.Map;

public class JsonTest {

    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        map.put("keypath", "pro22.pfx");
        map.put("appid", "commontesterCB");
        map.put("keypwd", "password");

        System.out.print(  JsonUtil.toJson(map));
    }
}
