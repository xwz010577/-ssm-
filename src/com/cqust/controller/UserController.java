package com.cqust.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqust.model.Book;
import com.cqust.model.Check;
import com.cqust.model.Login;
import com.cqust.model.User;
import com.cqust.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	//退出登录
	@RequestMapping("/toLogin")
		public String tolo(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("login");
		session.removeAttribute("id");
		model.addAttribute("msg", "您还没有登录，请先登录！");
		 return "login";
	}
		//登录
	@RequestMapping("/u_login")
		public String toLogin( @Param("username")String username,@Param("password")String password,HttpSession session,Model model){
		Login login=this.userService.login(username, password);
		if(login != null){		
			// 将用户对象添加到Session
			session.setAttribute("login", login);
			session.setAttribute("id", login.getId());
			session.setAttribute("user", login.getUser());
			User user=this.userService.selectById(login.getId());
			if (user!=null) {
				model.addAttribute("user", user);
				return "userbrowse";
			}else{
				user=login.getUser();
				model.addAttribute("user",user);
			}
			
			return "userbrowse";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
		//返回主页面
	@RequestMapping("/touserbro")
		public String toUserBorwse(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		model.addAttribute("user",user);
		return "userbrowse";
	}
		//查询单个银行
	@RequestMapping("/serch")
	@ResponseBody
		public String serch(HttpServletRequest request,String banktype){
			HttpSession session=request.getSession();
			User user=this.userService.selectById((Integer)session.getAttribute("id"));
			if (user!=null) {
				List<Check> check1=new ArrayList<Check>();
				for (Check check : user.getUser_check()) {
					if (check.getBanktype().equals(banktype)) {
						check1.add(check);
						user.getUser_check().clear();
						System.out.println(user.toString());
						user.setUser_check(check1);
						System.out.println(user.toString());
						session.setAttribute("user", user);
						return "ok";
					}
				}
			}else {
				user=(User) request.getSession().getAttribute("user");
				return "no";
			}
			
			return "false";
		}
		//查询所有信息
	@RequestMapping("/alluser")
		public String toAlluser(HttpServletRequest request,Model model){
		HttpSession session=request.getSession();
		User user=this.userService.selectById((Integer) (session.getAttribute("id")));
		if (user==null) {
			user=(User) session.getAttribute("user");
		}
		model.addAttribute("user", user);
		return "userbrowse";
		
	}
		//注册
		@RequestMapping("/toRegist")
		public String toRegist(){
			return "register";
		}
		@RequestMapping("/toInsertUser")
		public String inserUser(Login login,Model model){
			User user=login.getUser();
				Login login2=this.userService.login(user.getUsername(), login.getPassword());
				if (login2==null) {
					int rows=this.userService.insertUser(user);
					if (rows>0) {
						login.setId(user.getId());
						int rows1=this.userService.insertLogin(login);
						if (rows>0 && rows1>0){
								return "login";
						}
						else 
							return "login";
					}
				}
			
			model.addAttribute("msg","注册失败！用户民重复");
			return "login";
	}
		//修改密码
		@RequestMapping("/changePwd")
		@ResponseBody
		public String changePwd(HttpServletRequest request,String oldPWd,String newPwd){
			HttpSession session=request.getSession();
			Login login=this.userService.selectLogin((Integer)session.getAttribute("id"));
			if (login.getPassword().equals(oldPWd) && oldPWd!=null) {
				login.setPassword(newPwd);
				int rows=this.userService.updateLogin(login);
				if (rows>0) {
					return "ok";
				}
			}else {
				return "no";
			}
			
			return "false";
			
		}
		//修改个人信息
		@RequestMapping("/toUpdate")
 		public String toUpdateUser(HttpServletRequest request,Model model){
			HttpSession session=request.getSession();
			User user=this.userService.selectById((Integer) (session.getAttribute("id")));
			if (user==null) {
				user=(User) session.getAttribute("user");
			}
			model.addAttribute("user",user);
			return "updateUser";
	    }
	@RequestMapping("/toUpdateUser")
		public String updateUser(HttpServletRequest request,User user){
		HttpSession session=request.getSession();
		user.setId((Integer)session.getAttribute("id"));
			int rows=this.userService.updateUser(user);
			if (rows>0) 
					return "redirect:alluser";
			else 
				return "updateUser";
	}
	
		//申请借书
	@RequestMapping("/toBook")
		public String toApply(Model model){
		List<Book> books=this.userService.selectBook();
		model.addAttribute("books", books);
		return "setbook";
	}
		//归还书籍
		@RequestMapping(value="/Deposit")
		@ResponseBody
		public String Deposit(Integer id,Integer count){
			
			Check checks=this.userService.check(id);
			int rows=0;
			if (checks.getCount()>=count && count!=null) {
				List<Book> book=this.userService.selectBook();
				for (Book book2 : book) {
					if (book2.getBook_name().equals(checks.getBanktype())) {
						book2.setBook_count(book2.getBook_count()+count);
						this.userService.updateBook(book2);
						if (checks.getCount()==count) {
							this.userService.delCheck(id);rows++;
						}else{
							checks.setCount(checks.getCount()-count);
							rows=this.userService.updateCheck(checks);
						}
							
					}
				}
			}
			if (rows>0) {
				return "ok";
			}	else
				 return "false";
		}
		//图书馆借出图书		
		@RequestMapping(value="/WithDraw")
		@ResponseBody
		public String WithDraw(HttpServletRequest request,Integer id,Integer count){
			HttpSession session=request.getSession();
			int id1=(Integer) (session.getAttribute("id"));//用户id
			Book books=this.userService.selectByIdBook(id);
			if (count>=books.getBook_count()) {
				return "no";
			}
			List<Check> check= this.userService.selUserIdcheck(id1);
			if (check!=null) {
				for (Check check2 : check) {
					if (check2.getBanktype().equals(books.getBook_name())) {
						check2.setCount(check2.getCount()+count);
						books.setBook_count(books.getBook_count()-count);
						this.userService.updateBook(books);
						this.userService.updateCheck(check2);
						return "ok";
					}
				}
				Check check2=new Check();
				check2.setUser_id(id1);
				check2.setBanktype(books.getBook_name());
				check2.setCount(count);
				books.setBook_count(books.getBook_count()-count);
				this.userService.updateBook(books);
				this.userService.insertCheck(check2);
				return "ok";
			}
			Check check2=new Check();
			check2.setUser_id(id1);
			check2.setBanktype(books.getBook_name());
			check2.setCount(count);
			books.setBook_count(books.getBook_count()-count);
			this.userService.updateBook(books);
			int rows=this.userService.insertCheck(check2);
			if (rows>0) {
				return "ok";
			}else
				return "fall";
			
		}
		
		//归还全部
		@RequestMapping("/del")
		@ResponseBody
		public String delUser(Integer bank_id){
			int rows=0;
			List<Book> books=this.userService.selectBook();
			Check check=this.userService.check(bank_id);
			for (Book book : books) {
				if (book.getBook_name().equals(check.getBanktype())) {
					book.setBook_count(book.getBook_count()+check.getCount());
					this.userService.updateBook(book);
					rows=this.userService.delCheck(bank_id);
				}
			}
			if (rows>0) 
				return "ok";
			else
				return "false"; 
		}
}
