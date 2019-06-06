package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;

import com.model.Goods;
import com.model.Jiaoliu;
import com.model.Liuyan;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class JiaoliuAction extends ActionSupport {
	private int id;
	private String memberid;
	private String idlist;
	private String goodsid;
	private String content;
	private String hcontent;
	private String lsavetime;
	private String saver;
	private String hsavetime;
	private CommonDAO commonDAO;
	String suc;
	String no;
	
	


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHcontent() {
		return hcontent;
	}

	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}

	public String getLsavetime() {
		return lsavetime;
	}

	public void setLsavetime(String lsavetime) {
		this.lsavetime = lsavetime;
	}

	public String getSaver() {
		return saver;
	}

	public void setSaver(String saver) {
		this.saver = saver;
	}

	public String getHsavetime() {
		return hsavetime;
	}

	public void setHsavetime(String hsavetime) {
		this.hsavetime = hsavetime;
	}

	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public String getSuc() {
		return suc;
	}

	public void setSuc(String suc) {
		this.suc = suc;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	// 添加交流
	public String jiaoliuAdd() {
		Jiaoliu jiaoliu = new Jiaoliu();
		Goods goods = (Goods)commonDAO.findById(goodsid, "Goods");
		jiaoliu.setContent(content);
		jiaoliu.setMemberid(memberid);
		jiaoliu.setGoodsid(goodsid);
		jiaoliu.setLsavetime(Info.getDateStr());
		jiaoliu.setHcontent("");
		jiaoliu.setHsavetime("");
		jiaoliu.setSaver(goods.getMemberid());
		commonDAO.save(jiaoliu);
		return "success";
	}
	
	// 回复交流
	public String jiaoliuHf() {
		Jiaoliu jiaoliu = (Jiaoliu)commonDAO.findById(id, "Jiaoliu");
		jiaoliu.setHcontent(hcontent);
		jiaoliu.setHsavetime(Info.getDateStr());
		commonDAO.update(jiaoliu);
		goodsid=goodsid;
		return "success";
	}


	// 删除交流
	public String jiaoliuDel() {
		String[] a = idlist.split(",");
		for (int i = 0; i < a.length; i++) {
			Jiaoliu jiaoliu = (Jiaoliu) commonDAO.findById(a[i], "Jiaoliu");
			commonDAO.delete(jiaoliu);
		}
		return "success";
	}

}
