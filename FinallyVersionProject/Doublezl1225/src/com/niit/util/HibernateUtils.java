package com.niit.util;
import org.hibernate.Session;
//import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
public class HibernateUtils{

//    private static final SessionFactory sessionFactory;
//    
//    static {
//        try {
//            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
//        } catch (Throwable ex) {
//            // Log the exception. 
//            System.err.println("Initial SessionFactory creation failed." + ex);
//            throw new ExceptionInInitializerError(ex);
//        }
//    }
//    
//    public static SessionFactory getSessionFactory() {
//        return sessionFactory;
//    }
//    public static Session getSession(){
//        return sessionFactory.openSession();
//    }
//    
//    public static void close(Session session){
//       if(null!=session&&session.isOpen())
//           session.close();
//    }
}
