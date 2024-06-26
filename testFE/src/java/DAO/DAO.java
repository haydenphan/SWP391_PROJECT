package DAO;

import java.util.ArrayList;
import org.apache.tomcat.jakartaee.commons.lang3.tuple.Pair;

public abstract class DAO<T> {

    public ArrayList<T> data = new ArrayList<>();

//    public abstract ArrayList<T> selectAll();
//
//    public abstract T selectById(String id);

    public abstract int insert(T t);

//    public abstract int insertAll(ArrayList<T> arr);
//
//    public abstract int delete(T t);
//
//    public abstract int deleteAll(ArrayList<T> arr);
//
//    public abstract int update(T t);
}
