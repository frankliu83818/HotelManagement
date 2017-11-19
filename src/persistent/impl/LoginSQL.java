package persistent.impl;

import entity.UserInfo;
import utils.Log;

import java.sql.*;

/**
 * Created by Shinelon on 2016/12/15.
 */
public class LoginSQL {

    public static void CreateDefUseeInfo() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;


        System.out.println("增加默认用户信息");
        UserInfo userInfo = null;
        String createUserAccountTableStrig  = "create table user_acount(\n" +
                "user_pkid int UNSIGNED primary key auto_increment,\n" +
                "user_name varchar(60) not null,\n" +
                "user_password varchar(20) not null\n" +
                ")auto_increment=1;";
        String insertUserDefInfoString = "insert into user_acount (user_name,user_password) values('admin','admin');";

        try {
            connection = new ConnectionSQL().getConnection();
            DatabaseMetaData databaseMetaData =  connection.getMetaData();
            ResultSet rs = databaseMetaData.getTables(null,null,"user_acount",null);

            if (rs.next()){
               Log.d("user表存在");
            }else{
                preparedStatement = connection.prepareStatement(createUserAccountTableStrig);
                preparedStatement.executeUpdate();
                Log.d("user表创建成功");
                preparedStatement = connection.prepareStatement(insertUserDefInfoString);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                //connection.close();
            }
        } catch (SQLException sqlE){
            sqlE.printStackTrace();
        }

    }
    public static boolean QuerySql(String userName, String userPasswd) throws SQLException {
        System.out.println("用户名"+userName+ "用户密码"+userPasswd);
        UserInfo userInfo  = null;
        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        boolean returnflag = true;

        String queryString = "select * from user_acount";
        try {
            connection = new ConnectionSQL().getConnection();
            preparedStatement = connection.prepareStatement(queryString);
            resultSet = preparedStatement.executeQuery(queryString);
            while (resultSet.next()){
                Log.d("验证用户名");
                if(userName.equals(resultSet.getString("user_name"))){
                    Log.d("用户名存在");
                    if(userPasswd.equals(resultSet.getString("user_password"))){
                        Log.d("密码正确");
                        returnflag = true;
                    }
                }else{
                    returnflag = true;
                }
            }
        }catch (SQLClientInfoException sqlE){
            sqlE.printStackTrace();
        }finally {
            resultSet.close();
            preparedStatement.close();
            //connection.close();
            return returnflag;
        }
    }

}

