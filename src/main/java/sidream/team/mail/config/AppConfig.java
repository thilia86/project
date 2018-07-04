package sidream.team.mail.config;


import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@EnableWebMvc
@ComponentScan(basePackages="sidream.team.mail.*")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfig  {
	
	// set up variable to hold the properties
	
		@Autowired
		private Environment env;


	//define a bean for the ViewResolver
	@Bean
	public ViewResolver viewResolver() {

		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public DataSource securityDataSource() {
		
		// create connection pool
		ComboPooledDataSource securityDataSource
									= new ComboPooledDataSource();
				
		// set the jdbc driver class
		
		try {
			securityDataSource.setDriverClass(env.getProperty("hibernate.connection.driver_class"));
		} catch (PropertyVetoException exc) {
			throw new RuntimeException(exc);
		}
		
		// set database connection props
		
				securityDataSource.setJdbcUrl(env.getProperty("hibernate.connection.url"));
				securityDataSource.setUser(env.getProperty("hibernate.connection.username"));
				securityDataSource.setPassword(env.getProperty("hibernate.connection.password"));
				
				// set connection pool props
				
				securityDataSource.setInitialPoolSize(
						getIntProperty("connection.pool.initialPoolSize"));

				securityDataSource.setMinPoolSize(
						getIntProperty("connection.pool.minPoolSize"));

				securityDataSource.setMaxPoolSize(
						getIntProperty("connection.pool.maxPoolSize"));

				securityDataSource.setMaxIdleTime(
						getIntProperty("connection.pool.maxIdleTime"));
				
				return securityDataSource;
			}
			
	 @Bean
	    public LocalSessionFactoryBean sessionFactory() {
	        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	        sessionFactory.setDataSource(securityDataSource());
	        sessionFactory.setPackagesToScan(new String[] { "sidream.team.mail.entity" });
	        sessionFactory.setHibernateProperties(hibernateProperties());
	        return sessionFactory;
	     }
		
	    
	 @Bean
	    public Properties hibernateProperties() {
	        Properties properties = new Properties();
	        properties.put("hibernate.connection.driver_class", env.getRequiredProperty("hibernate.connection.driver_class"));
	        properties.put("hibernate.connection.url", env.getRequiredProperty("hibernate.connection.url"));
	        properties.put("hibernate.connection.username", env.getRequiredProperty("hibernate.connection.username"));
	        properties.put("hibernate.connection.password", env.getRequiredProperty("hibernate.connection.password"));
	        properties.put("hibernate.dialect", env.getRequiredProperty("hibernate.dialect"));
	        properties.put("hibernate.show_sql", env.getRequiredProperty("hibernate.show_sql"));
	        properties.put("hibernate.format_sql", env.getRequiredProperty("hibernate.format_sql"));
	        return properties;        
	    }
	    
		@Bean
	    public HibernateTransactionManager transactionManager(SessionFactory s) {
	       HibernateTransactionManager txManager = new HibernateTransactionManager();
	       txManager.setSessionFactory(s);
	       return txManager;
	    }
	
	
	
	
			// need a helper method 
			// read environment property and convert to int
			
			private int getIntProperty(String propName) {
				
				String propVal = env.getProperty(propName);
				
				// now convert to int
				int intPropVal = Integer.parseInt(propVal);
				
				return intPropVal;
			}
			
		}
