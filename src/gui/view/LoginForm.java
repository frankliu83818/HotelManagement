package gui.view;

import persistent.impl.LoginSQL;
import utils.Constant;
import utils.Log;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

/**
 * Created by Shinelon on 2016/12/7.
 */
public class LoginForm {
    private JButton registerButton;
    private JButton loginButton;
    private JTextField userNameTextField;
    private JPasswordField passwordField1;
    private JPanel loginPanel;

    public LoginForm()  {
        try {
            LoginSQL.CreateDefUseeInfo();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        addListener();
    }

    /*
    * 按钮监听函数
    * */
    private void addListener() {
        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                isUsernameAndPasswdEmpty();
                try {
                    char[] cs = passwordField1.getPassword();
                    String psw = new String(cs);
                        boolean returnflag = LoginSQL.QuerySql(userNameTextField.getText().toString(), psw);
                        System.out.println(returnflag);
                        if (!returnflag) {
                            JOptionPane.showMessageDialog(getContentPane(), "密码错误");
                        } else {
                            loginPanel.setVisible(false);
                            createNewWindow();
                        }
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        });
    }
    /*
    * 创建新窗口
    * */
    public  void createNewWindow(){
        JFrame frame1 = new JFrame("RoomWithOrderDisplayForm");
        frame1.setContentPane(new RoomWithOrderDisplayForm().getContentPane());
        frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame1.pack();
        Dimension size = new Dimension(
                (int) (Constant.screenSize.getWidth() * 4 / 5),
                (int) (Constant.screenSize.getHeight() * 4/ 5));
        frame1.setSize(size);
        frame1.setLocationRelativeTo(null);
        frame1.setVisible(true);
    }


    /*
    * 判断用户密码和用户名是否为空
    * */
    public void isUsernameAndPasswdEmpty(){
        if (userNameTextField.getText().isEmpty()){
            JOptionPane.showMessageDialog(getContentPane(), "用户名不能为空");
        }
        if (passwordField1.getPassword().length == 0){
            JOptionPane.showMessageDialog(getContentPane(), "密码不能为空");
        }
    }

    /*
    * 获得UI内容
    *
    * */
    public Container getContentPane() {
        return loginPanel;
    }

    /*
    * 创建UI界面
    * */
    private void createUIComponents() {
        // TODO: place custom component creation code here
        Log.d("createLogIn");
        loginPanel = new JPanel();
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("LoginForm");
        frame.setContentPane(new LoginForm().loginPanel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }

}
