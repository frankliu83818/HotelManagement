package persistent.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by wiwi on 2016/12/21.
 */
public class test {
    public static void main(String[] args) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        connection = new ConnectionSQL().getConnection();
        String asdf = "use hotel;";
        PreparedStatement preparedStatement1 = connection.prepareStatement(asdf);
        String createUserAccountTableStrig = "INSERT\n" +
                "INTO\n" +
                "  orders(\n" +
                "    orderpepole_pkid,\n" +
                "    checkinpepole_pkid,\n" +
                "order_type_pkid,\n" +
                "    room_pkid,\n" +
                "    createdaytime,\n" +
                "    dropdaytime,\n" +
                "    paid_amount,indatetime,outdatetime,state,ifgroup) values (1,2,1,2,\"2017-12-19 23:26:19\",\"2018-12-19 23:26:19\",123,\"2016-12-19 23:26:19\",\"2016-12-19 23:26:19\",\"只\",0);";
        preparedStatement = connection.prepareStatement(createUserAccountTableStrig);
//        System.out.println("预订确认");
        preparedStatement1.executeUpdate();
        preparedStatement.executeUpdate();
        preparedStatement.close();
        preparedStatement1.close();



    }

}
