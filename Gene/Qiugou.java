package com.model;

/**
 * Qiugou entity. @author MyEclipse Persistence Tools
 */

public class Qiugou implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String name;
	private String filename;
	private String content;
	private String memberid;
	private String savetime;

	// Constructors

	/** default constructor */
	public Qiugou() {
	}

	/** full constructor */
	public Qiugou(String title, String name, String filename, String content,
			String memberid, String savetime) {
		this.title = title;
		this.name = name;
		this.filename = filename;
		this.content = content;
		this.memberid = memberid;
		this.savetime = savetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}