package org.toy.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@MapperScan("org.toy.web.**.mapper")
@EnableTransactionManagement
@Configuration
public class WebDatabaseConfig {
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		//dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
		//dataSource.setUrl("jdbc:mariadb://localhost:3306/toy");
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3606/toy?useSSL=false&serverTimezone=UTC");
		dataSource.setUsername("root");
		dataSource.setPassword("root");

		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFatory(DataSource datasource) throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(datasource);
		sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/**/*.xml"));
		sqlSessionFactory.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
		
		return (SqlSessionFactory) sqlSessionFactory.getObject();
	}
	
    @Bean
    public DataSourceTransactionManager txManager(DataSource datasource) {
        DataSourceTransactionManager manager = new DataSourceTransactionManager(datasource);
        
        return manager;
    }

}
