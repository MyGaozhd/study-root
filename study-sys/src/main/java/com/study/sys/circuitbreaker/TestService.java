package com.study.sys.circuitbreaker;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestService {
    private static final Logger logger = LoggerFactory.getLogger(TestService.class);
    int j = 0;

    public String checkUser(int i) throws Exception {

        j = j + 1;
        logger.info(" j = " + j);
        //模拟服务异常
        if (i % 2 == 0) {
            throw new Exception("ERROR：" + i);
        }
        //模拟服务调用时间
        Thread.sleep(200);

        logger.info(" 服务正常  ......：" + i);
        return "Hello";
    }
}
