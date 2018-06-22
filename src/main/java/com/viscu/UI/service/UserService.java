package com.viscu.UI.service;

import com.viscu.UI.domain.User;
import com.viscu.UI.entiry.PageBean;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

public interface UserService {

    User emailIsExist(String email); //查找邮箱是否存在

    void addUser(User user); //添加用户

    void updateUser(User user); //更新用户信息

    User getUserByUserName(String username); //通过用户名查找用户

    User getUserByUserId(Integer userId); //通过用户id查找用户

    void deleteUserByUserName(String username); //通过用户名删除用户

    List<User> getAllUser(); //获取所有的用户

    String getPassword(String username); //获得用户密码

    PageBean<User> findByPage(int currentPage,int pageSize);
}
