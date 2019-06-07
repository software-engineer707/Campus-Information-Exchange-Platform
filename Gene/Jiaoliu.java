package com.model;

/**
 * Jiaoliu entity. @author MyEclipse Persistence Tools
 */

public class Jiaoliu implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodsid;
	private String memberid;
	private String content;
	private String lsavetime;
	private String hcontent;
	private String hsavetime;
	private String saver;

	// Constructors

	/** default constructor */
	public Jiaoliu() {
	}

	/** full constructor */
	public Jiaoliu(String goodsid, String memberid, String content,
			String lsavetime, String hcontent, String hsavetime, String saver) {
		this.goodsid = goodsid;
		this.memberid = memberid;
		this.content = content;
		this.lsavetime = lsavetime;
		this.hcontent = hcontent;
		this.hsavetime = hsavetime;
		this.saver = saver;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsid() {
		return this.goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLsavetime() {
		return this.lsavetime;
	}

	public void setLsavetime(String lsavetime) {
		this.lsavetime = lsavetime;
	}

	public String getHcontent() {
		return this.hcontent;
	}

	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}

	public String getHsavetime() {
		return this.hsavetime;
	}

	public void setHsavetime(String hsavetime) {
		this.hsavetime = hsavetime;
	}

	public String getSaver() {
		return this.saver;
	}

	public void setSaver(String saver) {
		this.saver = saver;
	}

}