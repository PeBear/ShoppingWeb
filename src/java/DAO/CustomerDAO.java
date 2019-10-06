package DAO;

import entity.Customers;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

public class CustomerDAO {

    public static boolean checkLogin(String username, String password) {
        List<Customers> list = null;

        //CurrentSession auto open - close session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

        session.beginTransaction();
        String sql = "from Customers where username = '" + username + "' and password = '" + password + "'";
        Query query = session.createQuery(sql);
        list = query.list();
        if (list.size() > 0) {
            return true;
        }
        return false;
    }

    public static List<Customers> getListCustomers(String hoten) {
        List<Customers> list = null;

        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String sql = "from Customers";
        if (hoten.trim() != null) {
            sql += " where hoten like '%" + hoten + "%'";
        }
        Query query = session.createQuery(sql);
        list = query.list();
        session.close();
        return list;
    }

    public static Customers getInfoCustomer(int code) {
        //openSession need open - close session manually
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();

        Customers cus = (Customers) session.get(Customers.class, code);

        session.close();

        return cus;
    }

    public static boolean insertCustomer(Customers cus) {
        //check exist customer
        if (getInfoCustomer(cus.getCode()) != null) {
            return false;
        }

        //openSession need open - close session manually
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(cus);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }

    }

    public static boolean updateCustomer(Customers cus) {
        if (getInfoCustomer(cus.getCode()) == null) {
            return false;
        }

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            session.update(cus);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static boolean deleteCustomer(int code) {
        Customers cus = getInfoCustomer(code);

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete(cus);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
            return false;
        } finally{
            session.close();
        }

    }
}
