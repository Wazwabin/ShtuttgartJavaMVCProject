package ru.vallione.DAO;

import java.io.Serializable;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.GeneratedValue;
import javax.persistence.Column;

@Entity
@Table(name="towninfo")
public class Shtuttgart implements Serializable {
	private int id;
	private String title;
	private int photo;
	private String textinfo;
	 
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column (name = "id") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column (name = "title") 
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column (name = "photo") 
	public int getPhoto() {
		return photo;
	}
	public void setPhoto(int photo) {
		this.photo = photo;
	}
	
	@Column (name = "textinfo") 
	public String getTextinfo() {
		return textinfo;
	}
	public void setTextinfo(String textinfo) {
		this.textinfo = textinfo;
	}
	
	@Override
	public String toString() {
		return String.format("%-3d %-50s %4d", 
				getId(), getTitle(), getPhoto());
	}

}
