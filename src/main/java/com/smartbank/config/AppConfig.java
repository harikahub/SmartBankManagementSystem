package com.smartbank.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@EnableJpaRepositories("com.smartbank.repository")
@ComponentScan("com.smartbank")
@PropertySource("classpath:application.properties")
public class AppConfig implements WebMvcConfigurer {

    // =========================
    // DATABASE PROPERTIES
    // =========================

    @Value("${db.driver}")
    private String dbDriver;

    @Value("${db.url}")
    private String dbUrl;

    @Value("${db.username}")
    private String dbUsername;

    @Value("${db.password}")
    private String dbPassword;


    // =========================
    // EMAIL PROPERTIES
    // =========================

    @Value("${mail.host}")
    private String mailHost;

    @Value("${mail.port}")
    private int mailPort;

    @Value("${mail.username}")
    private String mailUsername;

    @Value("${mail.password}")
    private String mailPassword;


    // =========================
    // DATASOURCE
    // =========================

    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource dataSource =
                new DriverManagerDataSource();

        dataSource.setDriverClassName(dbDriver);
        dataSource.setUrl(dbUrl);
        dataSource.setUsername(dbUsername);
        dataSource.setPassword(dbPassword);

        return dataSource;
    }


    // =========================
    // ENTITY MANAGER FACTORY
    // =========================

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(
            DataSource dataSource) {

        LocalContainerEntityManagerFactoryBean emf =
                new LocalContainerEntityManagerFactoryBean();

        emf.setDataSource(dataSource);

        emf.setPackagesToScan("com.smartbank.entity");

        HibernateJpaVendorAdapter vendorAdapter =
                new HibernateJpaVendorAdapter();

        emf.setJpaVendorAdapter(vendorAdapter);

        Properties properties = new Properties();

        properties.put(
                "hibernate.dialect",
                "org.hibernate.dialect.MySQLDialect"
        );

        properties.put(
                "hibernate.hbm2ddl.auto",
                "update"
        );

        properties.put(
                "hibernate.show_sql",
                "true"
        );

        emf.setJpaProperties(properties);

        return emf;
    }


    // =========================
    // TRANSACTION MANAGER
    // =========================

    @Bean
    public JpaTransactionManager transactionManager(
            LocalContainerEntityManagerFactoryBean entityManagerFactory) {

        JpaTransactionManager transactionManager =
                new JpaTransactionManager();

        transactionManager.setEntityManagerFactory(
                entityManagerFactory.getObject()
        );

        return transactionManager;
    }


    // =========================
    // EMAIL CONFIGURATION
    // =========================

    @Bean
    public JavaMailSender javaMailSender() {

        JavaMailSenderImpl mailSender =
                new JavaMailSenderImpl();

        mailSender.setHost(mailHost);
        mailSender.setPort(mailPort);
        mailSender.setUsername(mailUsername);
        mailSender.setPassword(mailPassword);

        Properties props = mailSender.getJavaMailProperties();

        props.put(
                "mail.transport.protocol",
                "smtp"
        );

        props.put(
                "mail.smtp.auth",
                "true"
        );

        props.put(
                "mail.smtp.starttls.enable",
                "true"
        );

        props.put(
                "mail.debug",
                "true"
        );

        return mailSender;
    }


    // =========================
    // JSP VIEW RESOLVER
    // =========================

    @Bean
    public InternalResourceViewResolver viewResolver() {

        InternalResourceViewResolver resolver =
                new InternalResourceViewResolver();

        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");

        return resolver;
    }


    // =========================
    // STATIC CSS / JS / IMAGES
    // =========================

    @Override
    public void addResourceHandlers(
            ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/css/**")
                .addResourceLocations("/css/");

        registry.addResourceHandler("/js/**")
                .addResourceLocations("/js/");

        registry.addResourceHandler("/images/**")
                .addResourceLocations("/images/");
    }
}