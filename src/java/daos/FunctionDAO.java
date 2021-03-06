/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author BINTANG
 */
public class FunctionDAO implements InterfaceDAO{

    private SessionFactory factory;
    private Session session;
    private Transaction transaction;

    public FunctionDAO() {
    }

    public FunctionDAO(SessionFactory factory) {
        this.factory = factory;
    }
    
    @Override
    public boolean insertOrUpdate(Object object) {
        boolean flag = false;
        try {
            this.session = this.factory.openSession();
            this.transaction = this.session.beginTransaction();
            this.session.saveOrUpdate(object);
            this.transaction.commit();
            flag = true;
        } catch (HibernateException e) {
            e.printStackTrace();
            if (this.transaction != null) {
                this.transaction.rollback();
            }
        } finally {
            this.session.close();
        }
        return flag;
    }

    @Override
    public List<Object> get(String query) {
        List<Object> datas = new ArrayList<>();
        try {
            this.session = this.factory.openSession();
            this.transaction = this.session.beginTransaction();
            datas = this.session.createQuery(query).list();
            this.transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (this.transaction != null) {
                this.transaction.rollback();
            }
        } finally {
            this.session.close();
        }
        return datas;    
    }

    @Override
    public Object getById(String query) {
        Object data = new Object();
        try {
            this.session = this.factory.openSession();
            this.transaction = this.session.beginTransaction();
            data = this.session.createQuery(query)
                    .uniqueResult();
            this.transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (this.transaction != null) {
                this.transaction.rollback();
            }
        } finally {
            this.session.close();
        }
        return data;
    }

    
    
}
