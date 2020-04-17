package com.cqust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cqust.dao.UserDao;
import com.cqust.model.Book;
import com.cqust.model.Check;
import com.cqust.model.Login;
import com.cqust.model.User;

@Service("userService")
@Transactional
public class UserServiceImp implements UserService{

	@Autowired
	private UserDao userDao;
	@Override
	public Login login(String username, String password) {
		// TODO Auto-generated method stub
		return this.userDao.login(username, password);
	}
	@Override
	public User selectById(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.selectById(id);
	}
	@Override
	public Check check(Integer bank_id) {
		// TODO Auto-generated method stub
		return this.userDao.check(bank_id);
	}
	@Override
	public int updateCheck(Check check) {
		// TODO Auto-generated method stub
		return this.userDao.updateCheck(check);
	}
	@Override
	public int insertCheck(Check check) {
		// TODO Auto-generated method stub
		return this.userDao.insertCheck(check);
	}
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.insertUser(user);
	}
	@Override
	public int delCheck(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.delCheck(id);
	}
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.updateUser(user);
	}
	@Override
	public int insertLogin(Login login) {
		// TODO Auto-generated method stub
		return this.userDao.insertLogin(login);
	}
	@Override
	public int updateLogin(Login login) {
		// TODO Auto-generated method stub
		return this.userDao.updateLogin(login);
	}
	@Override
	public Login selectLogin(Integer id) {
		// TODO Auto-generated method stub
		return this.userDao.selectLogin(id);
	}
	@Override
	public List<Book> selectBook() {
		// TODO Auto-generated method stub
		return this.userDao.selectBook();
	}
	@Override
	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		return this.userDao.updateBook(book);
	}
	@Override
	public Book selectByIdBook(Integer book_id) {
		// TODO Auto-generated method stub
		return this.userDao.selectByIdBook(book_id);
	}
	@Override
	public List<Check> selUserIdcheck(Integer user_id) {
		// TODO Auto-generated method stub
		return this.userDao.selUserIdcheck(user_id);
	}

}
