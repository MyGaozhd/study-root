package com.gaozhd.study.common.util;

import com.gaozhd.ssm.common.util.json.JsonUtil;

public class LogUtil {

	public static void logJson(Object object) {
		System.out.println(JsonUtil.toJson(object));
	}

	public static void log(Object object) {
		System.out.println(object.toString());
	}
}
