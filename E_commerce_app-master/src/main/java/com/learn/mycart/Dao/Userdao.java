
package com.learn.mycart.Dao;

import com.learn.mycart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Userdao {
    private SessionFactory factory;

    public Userdao(SessionFactory factory) {
        this.factory = factory;
    }

  // get user email and password 
    public User getuserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try 
        {
            String query="from User where userEmail=: e and userPassword=: p ";
            Session session= this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            user=(User)q.uniqueResult();
            session.close();
            
            
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        
        
        return user;
    }
}
