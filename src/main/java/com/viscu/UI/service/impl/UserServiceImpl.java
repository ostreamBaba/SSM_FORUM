package com.viscu.UI.service.impl;


import com.viscu.UI.dao.UserDao;
import com.viscu.UI.domain.User;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        if(user!=null){
            this.userDao.addUser(user);
        }
    }

    @Override
    public void updateUser(User user) {
        if(user!=null){
            this.userDao.updateUserByUser(user);
        }
    }

    @Override
    public User getUserByUserName(String username) {
        if(username==null){
            throw new IllegalArgumentException("用户名为空");
        }
        return this.userDao.findUserByUserName(username);
    }

    @Override
    public User getUserByUserId(Integer userId) {
        if(userId==null){
            throw new IllegalArgumentException("用户id为空");
        }
        return this.userDao.findUserByUserId(userId);
    }

    @Override
    public void deleteUserByUserName(String username) {
        if(username==null){
            throw new IllegalArgumentException("用户名为空");
        }
        this.userDao.deleteUserByUserName(username);
    }

    @Override
    public String getPassword(String username) {
        if(username==null){
            throw new IllegalArgumentException("用户名为空");
        }
        return this.userDao.getPassword(username);
    }

    @Override
    public User emailIsExist(String email) {
        if(email==null){
            throw new IllegalArgumentException("邮箱为空");
        }
        return this.userDao.findByEmail(email);
    }

    @Override
    public List<User> getAllUser() {
        return this.userDao.getAllUser();
    } //获得全部用户

    @Override
    public PageBean<User> findByPage(int currentPage,int pageSize) {
        if(currentPage==0){
            throw new IllegalArgumentException("数值出现错误");
        }

        Map<String,Object> map=new HashMap<String,Object>();
        PageBean<User> userPageBean=new PageBean<User>();

        userPageBean.setCurrentPage(currentPage);

        userPageBean.setPageSize(pageSize);

        List<User> userList=userDao.getAllUser();

        int totalCount=userList.size();

        userPageBean.setTotalCount(totalCount);

        double tc=totalCount;
        Double totalPage=Math.ceil(tc/pageSize);
        userPageBean.setTotalPage(totalPage.intValue());

        //查找
        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageSize);


        List<User> userList1=userDao.findByPage(map);
        userPageBean.setLists(userList1);
        return userPageBean;
    }
}
