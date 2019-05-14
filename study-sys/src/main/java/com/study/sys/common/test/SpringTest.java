package com.study.sys.common.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class SpringTest {

    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(MyConfig.class, F.class, OneDao.class, OneService.class, OneController.class);
        System.out.println(context.getBean(MyBean.class));
        //System.out.println(context.getBean("mybean"));

        System.out.println(context.getBean(RunnableFactoryBean.class));

        System.out.println(context.getBean(A.class));

        System.out.println(context.getBean(B.class));

        System.out.println(context.getBean(C.class));

        System.out.println(context.getBean(D.class));

        System.out.println(context.getBean(E.class));

        System.out.println(context.getBean(F.class));

        System.out.println(context.getBeansOfType(F.class));

        System.out.println(context.getBeansOfType(OneDao.class));
        System.out.println(context.getBeansOfType(OneService.class));
        System.out.println(context.getBeansOfType(OneController.class));

        OneController controller = context.getBean(OneController.class);
        controller.show();
        context.close();
    }
}
