package com.cqust.model;

public class Book {
	private int book_id;
	private String  book_name;
	private String book_author;
	private String book_publish;
	private float book_price;
	private Integer book_count;
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_publish() {
		return book_publish;
	}
	public void setBook_publish(String book_publish) {
		this.book_publish = book_publish;
	}
	public float getBook_price() {
		return book_price;
	}
	public void setBook_price(float book_price) {
		this.book_price = book_price;
	}
	public Integer getBook_count() {
		return book_count;
	}
	public void setBook_count(Integer book_count) {
		this.book_count = book_count;
	}
	
}
