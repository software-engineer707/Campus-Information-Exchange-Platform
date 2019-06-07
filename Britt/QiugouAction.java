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

import com.model.Notice;
import com.model.Qiugou;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class QiugouAction extends ActionSupport
{
	private int id;
	private String title;
	private String img;
	private String content;
	private String memberid;
	private String xiangpian;
	private String name;
	private String idlist;
	private CommonDAO commonDAO;
	String suc;
	String no;
	
	
	

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


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getIdlist() {
		return idlist;
	}


	public void setIdlist(String idlist) {
		this.idlist = idlist;
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

	

	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	

	public String getXiangpian() {
		return xiangpian;
	}


	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
	}

	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	//添加求购
	public String qiugouAdd(){
		Qiugou qiugou = new Qiugou();
		qiugou.setTitle(title);
		qiugou.setFilename(xiangpian);
		qiugou.setContent(content);
		qiugou.setSavetime(Info.getDateStr());
		qiugou.setMemberid(memberid);
		qiugou.setName(name);
		commonDAO.save(qiugou);
		suc="操作成功";
		return "success";
	}
	
	
	
	//删除求购
	public String qiugouDel(){
		String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
			Qiugou qiugou = (Qiugou)commonDAO.findById(a[i], "Qiugou");
		commonDAO.delete(qiugou);
		}
		suc="";
		return "success";
	}

	 
}
