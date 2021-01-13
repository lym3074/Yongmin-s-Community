package kr.co.controller;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class Test {
    @Autowired
    private DataSource ds;       
    @Autowired
    private SqlSessionFactory sqlFactory;

    @org.junit.Test
    public void connectionTest() throws Exception{
        try(Connection conn = ds.getConnection()){
            System.out.println("JDBC Connection test Result : "+conn);
        } catch(Exception e){
            e.printStackTrace();
        }
    }
  
    @org.junit.Test
    public void factoryTest() {
        System.out.println("sqlFactory test Result : " + sqlFactory);
      
    }
  
    @org.junit.Test
    public void sessionTest() throws Exception{
      
        try(SqlSession session = sqlFactory.openSession()) {
            System.out.println("sqlSession test Result : " + session);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}