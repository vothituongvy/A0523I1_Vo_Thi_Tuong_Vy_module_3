package Dao;

import Model.User;
import com.mysql.cj.jdbc.DatabaseMetaData;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.sql.DriverManager.getConnection;

public class UserDao implements IUerDao {

//    create database user;
//    use user;
//
//    create table users (
//    id  int(3) NOT NULL AUTO_INCREMENT,
//    name varchar(120) NOT NULL,
//    email varchar(220) NOT NULL,
//    country varchar(120),
//    PRIMARY KEY (id)
//);
//
//    insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
//    insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
//    insert into users(name, email, country) values('Ha','ha@gmail.com','VietNam');




    private String jdbcURL = "jdbc:mysql://127.0.0.1:3307/user";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";
    private static final String findAll = "Select * from users";
    private static final String delete = "Delete from users where id = ? ;";
    private static final String select = "Select id,name,email,country from users where id= ?";
    private static final String insert = "Insert into users(name,email,country) values(?,?,?);";
    private static final String sort = "select * from users order by name;";
    private static final String findbycountry = "select * from users where country like ? ";
    private static final String update = "update users set name = ?,email= ?, country =? where id = ?;";


    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement st = connection.prepareStatement(insert);
        ) {
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getCountry());
            st.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(select);

        ) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> findAll() {
        ArrayList<User> users = new ArrayList<User>();

        try (
                Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(findAll);
                ResultSet rs = statement.executeQuery();
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (
                Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(delete);
        ) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(update);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> user = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(findbycountry);

        ) {
            statement.setString(1, "%" + country + "%");
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String countr = rs.getString("country");
                user.add(new User(id, name, email, countr));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> sortByName() {
        List<User> users = new ArrayList<>();
        try (
                Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(sort);
                ResultSet rs = statement.executeQuery();
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return users;
    }
}
