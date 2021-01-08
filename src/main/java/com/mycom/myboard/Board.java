package com.mycom.myboard;

import java.sql.Blob;
import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class Board {
	private int id;
	private String title;
	private String message;
	private Blob photo;
	private String content_type;
	private String author;
	private Date created_date;
	
	
	
	public Board() {
	}

	public Board(int id, String title, String message, Blob photo, String content_type, String author,
			Date created_date) {
		this.id = id;
		this.title = title;
		this.message = message;
		this.photo = photo;
		this.content_type = content_type;
		this.author = author;
		this.created_date = created_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getContent_type() {
		return content_type;
	}

	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	
	
	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", message=" + message + ", photo=" + photo + ", content_type="
				+ content_type + ", author=" + author + ", created_date=" + created_date + "]";
	}
	
}
