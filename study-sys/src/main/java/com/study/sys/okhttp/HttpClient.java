package com.study.sys.okhttp;

import com.study.sys.common.util.LogUtil;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Response;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class HttpClient {
    private static OkHttpClient INSTANCE = null;

    public static void main(String[] args) throws IOException {
        doPost();
    }

    public static OkHttpClient getInstance() {
        if (INSTANCE == null) {
            synchronized (INSTANCE) {
                if (INSTANCE == null) {
                    INSTANCE = new OkHttpClient().newBuilder()
                            .connectTimeout(10, TimeUnit.SECONDS)
                            .readTimeout(10, TimeUnit.SECONDS)
                            .writeTimeout(10, TimeUnit.SECONDS)
                            .build();
                    ;
                }
            }
        }
        return INSTANCE;
    }

    public static void doPost() throws IOException {
        String param = "{    \"userid\":\"x1\",    \"pk_org\":\"001\",    \"orgCode\":\"NC\",    \"nsrsbh\":\"91110000600001760P\",    \"datasource\":\"design\",    \"factorycode\":\"tchzt2\",    \"data\":[            {                \"fpDm\":\"1100154320\",                \"fpHm\":\"25045336\",                \"kprq\":\"20161010\",                \"hjje\":\"100\",                \"jshj\":\"106\",                \"jym\":\"10221376566424011310\",                \"verifyToken\":\"查验token\",                \"billid\":\"单据pk\",                \"billtype\":\"单据类型\"            },            {                \"fpDm\":\"1100154320\",                \"fpHm\":\"25045336\",                \"kprq\":\"20161010\",                \"hjje\":\"100\",                \"jshj\":\"106\",                \"jym\":\"10221376566424011310\",                \"verifyToken\":\"查验token\",                \"billid\":\"单据pk\",                \"billtype\":\"单据类型\"            }        ]   }";
        Response response = OkHttpUtils
                .postString()
                .url("http://10.11.117.16:8080/nccloud/api/imag/invoice/verify/verify")
                .addHeader("uap_usercode", "gzd01")
                .addHeader("uap_dataSource", "design")
                .addHeader("uap_token", "63757272656e7420746f6b656e20636865636b206973206f666621")
                .content(param)
                .mediaType(MediaType.parse("application/json; charset=utf-8"))
                .build()
                .connTimeOut(100)
                .execute();
        String string = response.body().string();
        LogUtil.log(string);
    }
}
