package entity;

/**
 * Created by Shinelon on 2016/12/15.
 */
public class UserInfo {
    private String userName;    //系统使用用户名
    private String password;   //系统使用用户登录密码


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
