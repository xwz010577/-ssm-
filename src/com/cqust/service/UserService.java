package com.cqust.service;

import java.util.List;

import com.cqust.model.Book;
import com.cqust.model.Check;
import com.cqust.model.Login;
import com.cqust.model.User;

public interface UserService {
	public Login login(String username,String password);
	public User selectById(Integer id);
	public Check check(Integer bank_id);
	public int updateCheck(Check check);
	public int insertCheck(Check check);
	public int insertUser(User user);
	public int delCheck(Integer id);
	public int updateUser(User user);
	public int insertLogin(Login login);
	public int updateLogin(Login login);
	public Login selectLogin(Integer id);
	public List<Book> selectBook();
	public int updateBook(Book book);
	public Book selectByIdBook(Integer book_id);
	public List<Check> selUserIdcheck(Integer user_id);
}
