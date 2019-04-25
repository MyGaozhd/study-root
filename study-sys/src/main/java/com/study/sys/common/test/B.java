package com.study.sys.common.test;

import com.study.sys.common.util.LogUtil;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class B implements InitializingBean, DisposableBean {
    private String c;
    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

    @Override
    public void destroy() throws Exception {
        LogUtil.log("destroy");
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        LogUtil.log("s：" + getC());
    }
}
