package com.study.sys.common.test;


import javax.net.ssl.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

public class HttpsTest1 {

    public static void main(String[] args) {

        SSLContext sslcontext = null;
        try {
            sslcontext = SSLContext.getInstance("SSL", "SunJSSE");
            sslcontext.init(null, new TrustManager[]{new TestX509TrustManager()}, new java.security.SecureRandom());
            URL url = new URL("https://www.baidu.com");

            HostnameVerifier ignoreHostnameVerifier = new HostnameVerifier() {
                public boolean verify(String s, SSLSession sslsession) {
                    System.out.println("WARNING: Hostname is not matched for cert.");
                    return true;
                }
            };
            HttpsURLConnection.setDefaultHostnameVerifier(ignoreHostnameVerifier);
            HttpsURLConnection.setDefaultSSLSocketFactory(sslcontext.getSocketFactory());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (KeyManagementException e) {
            e.printStackTrace();
        }

        HttpURLConnection conn = null;
        try {

            File file = new File("E:\\file");
            if (!file.exists()) {
                file.mkdirs();
            }
            File newFile = new File(file.getPath(), System.currentTimeMillis() + ".jpg");

//            URL serverUrl = new URL("https://10.16.1.7:8443/TIMS-Server/softController/beforeOpenSoft?res=NC");
            URL serverUrl = new URL("https://10.16.1.7:8443/TIMS-Server/cMImageController/getImageByNologin.action?file_id=80401201903270000000030804000030&amp;ext=jpg");
            conn = (HttpURLConnection) serverUrl.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            //必须设置false，否则会自动redirect到重定向后的地址
            conn.setInstanceFollowRedirects(false);
            conn.connect();
            InputStream inputStream = conn.getInputStream();
            FileOutputStream fileOutputStream = new FileOutputStream(newFile.getPath());
            byte[] bytes = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(bytes)) != -1) {
                fileOutputStream.write(bytes);
            }
            inputStream.close();
            fileOutputStream.close();
            conn.disconnect();
//            String result = getReturn(conn);
//            System.out.print(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getReturn(HttpURLConnection connection) throws IOException {
        StringBuffer buffer = new StringBuffer();
        //将返回的输入流转换成字符串
        try (InputStream inputStream = connection.getInputStream();
             InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
             BufferedReader bufferedReader = new BufferedReader(inputStreamReader);) {
            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            String result = buffer.toString();
            return result;
        }
    }
}
