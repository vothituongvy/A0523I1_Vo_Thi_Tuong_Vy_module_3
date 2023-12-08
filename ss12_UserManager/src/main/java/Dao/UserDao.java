package Dao;

import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDao {
    private String jdbcURL = "jdbc:mysql://127.0.0.1:3307/user";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Vovy1012!";

String insert = "insert into user (name,email,country) values (?,?,?);";
    private static final String select_id = "select * from user where id = ? ;";
    private static final String select_user = " select * from user; ";
    private static final String delete = "delete from user where id = ? ;";
    private static final String update = " update user set name = ? , email = ? , country = ? where id = ? ;";

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(insert);
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement.executeUpdate());
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException e) {
        for (Throwable throwable : e) {
            if (throwable instanceof SQLException) {
                throwable.printStackTrace(System.err);
                System.err.printf("SQL State %s%n", ((SQLException) throwable).getSQLState());
                System.err.println("Error code "+ ((SQLException) throwable).getErrorCode());
                System.err.println("Message "+throwable.getMessage());
                Throwable throwable1 = e.getCause();
                while (throwable1 !=null){
                    System.out.println("Cause "+throwable1);
                    throwable1 = throwable1.getCause();
                }
            }
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(select_id);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(select_user);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(delete);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(update);
            preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getCountry());

            rowUpdate = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }
}
