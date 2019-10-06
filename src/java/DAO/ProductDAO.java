package DAO;

import entity.Products;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

public class ProductDAO {

    public static List<Products> getListProducts(String tensp) {
        List<Products> list = null;

        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String sql = "from Products";
        if (!tensp.equals("")) {
            sql += " where tensp like '%" + tensp + "%'";
        }
        Query query = session.createQuery(sql);
        list = query.list();
        session.close();
        return list;
    }

    public static Products getInfoProduct(String masp) {
        //openSession need open - close session manually
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();

        Products product = (Products) session.get(Products.class, masp);

        session.close();

        return product;
    }

    public static boolean insertProduct(Products product) {
        //check exist product
        if (getInfoProduct(product.getMasp()) != null) {
            return false;
        }
        //openSession need open - close session manually
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            session.save(product);
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

    public static boolean updateProduct(Products product) {
        if (getInfoProduct(product.getMasp()) == null) {
            return false;
        }
        //CurrentSession auto open - close session
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            session.update(product);
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

    public static boolean deleteProduct(String masp) {
        Products product = getInfoProduct(masp);
        if (product == null) {
            return false;
        }
        //CurrentSession auto open - close session
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            session.delete(product);
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

}
