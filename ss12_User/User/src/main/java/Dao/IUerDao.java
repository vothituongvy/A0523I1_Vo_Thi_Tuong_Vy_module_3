package Dao;

import Model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUerDao {
    void insertUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> findAll();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> findByCountry(String country);

    List<User> sortByName();
}
