package com.viscu.UI.dao;


import com.viscu.UI.domain.User;

import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

public interface UserDao {

    User findByEmail(String email); //查找邮箱是否被注册过

    User findUserByUserName(String username); //通过用户名查找用户

    User findUserByUserId(Integer id); //通过id查找用户

    void addUser(User user);//添加用户

    void deleteUserByUserName(String username);

    void updateUserByUser(User user);

    List<User> getAllUser();

    String getPassword(String username);

    //分页查询
    List<User> findByPage(Map<String,Object> map);
}
