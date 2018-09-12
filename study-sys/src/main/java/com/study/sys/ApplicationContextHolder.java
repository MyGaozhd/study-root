package com.study.sys;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Hello world!
 *
 */
public class ApplicationContextHolder implements ApplicationContextAware {
	private static ApplicationContext applicationContext;

	/**
	 * 获取Spring容器中的ApplicationContext类型的实例对象，它由Spring IOC容器负责注入。
	 * 
	 * @return ApplicationContext类型的实例对象。
	 */
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		ApplicationContextHolder.applicationContext = applicationContext;
	}

	/**
	 * 从ApplicationContext中取得指定名称的Bean的实例对象, 并自动转型为泛型参数对应的类型。
	 * 
	 * @param beanName
	 *            Bean的名称，和Bean的Id相同。
	 * @return 指定名称的Bean的实例对象。
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(String beanName) {
		checkApplicationContextIsExist();
		return (T) applicationContext.getBean(beanName);
	}

	/**
	 * 从ApplicationContext中取得指定类型的Bean的实例对象, 并自动转型为泛型参数对应的类型。
	 * 如果有多个Bean的实例对象符合泛型参数指定的Class类型, 则返回第一个。
	 * 
	 * @param beanType
	 *            Bean的Class类型。
	 * @return 指定Class类型的Bean的实例对象。
	 */
	public static <T> T getBean(Class<T> beanType) {
		checkApplicationContextIsExist();
		return applicationContext.getBean(beanType);
	}

	/**
	 * 销毁ApplicationContext类型的实例对象。
	 */
	public static void destroyApplicationContext() {
		applicationContext = null;
	}

	/**
	 * 检查ApplicationContext类型的实例对象是否存在。
	 */
	private static void checkApplicationContextIsExist() {
		if (applicationContext == null) {
			throw new IllegalStateException(
					"ApplicationContext实例对象未注入,请在Spring的应用上下文配置文件中定义ApplicationContextHolder类型的bean。");
		}
	}
}
