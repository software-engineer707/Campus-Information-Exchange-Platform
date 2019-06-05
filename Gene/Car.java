package com.model;

/**
 * Car entity. @author MyEclipse Persistence Tools
 */

public class Car implements java.io.Serializable {

	// Fields

	private Integer id;
	private String memberid;
	private String goodsid;
	private String savetime;
	private String saver;

	// Constructors

	/** default constructor */
	public Car() {
	}

	/** full constructor */
	public Car(String memberid, String goodsid, String savetime, String saver) {
		this.memberid = memberid;
		this.goodsid = goodsid;
		this.savetime = savetime;
		this.saver = saver;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getGoodsid() {
		return this.goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getSaver() {
		return this.saver;
	}

	public void setSaver(String saver) {
		this.saver = saver;
	}

}