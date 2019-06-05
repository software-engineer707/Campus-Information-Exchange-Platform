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

import com.model.Car;
import com.model.Goods;
import com.model.Jingjia;
import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import com.util.Retainone;

public class GoodsAction extends ActionSupport
{
	private int id;
	private String goodsname;
	private String goodsid;
	private int price;
	private int jiajia;
	private int shuishou;
	private String stime;
	private String etime;
	private String xiangpian;
	private String content;
	private String delstatus;
	private String idlist;
	private String total;
	private String type;
	private String chengdu;
	private String buytime;
	private int cs;
	private String memberid;
	private CommonDAO commonDAO;
	String suc;
	String no;
	
	


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getGoodsname() {
		return goodsname;
	}


	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

    


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}



	public int getJiajia() {
		return jiajia;
	}


	public void setJiajia(int jiajia) {
		this.jiajia = jiajia;
	}


	public int getShuishou() {
		return shuishou;
	}


	public void setShuishou(int shuishou) {
		this.shuishou = shuishou;
	}


	public String getStime() {
		return stime;
	}


	public void setStime(String stime) {
		this.stime = stime;
	}


	public String getEtime() {
		return etime;
	}


	public void setEtime(String etime) {
		this.etime = etime;
	}


	public String getXiangpian() {
		return xiangpian;
	}


	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getDelstatus() {
		return delstatus;
	}


	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
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
	
	


	public String getTotal() {
		return total;
	}


	public void setTotal(String total) {
		this.total = total;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getCs() {
		return cs;
	}


	public void setCs(int cs) {
		this.cs = cs;
	}
	
	


	public String getGoodsid() {
		return goodsid;
	}


	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}
	
	


	public String getChengdu() {
		return chengdu;
	}


	public void setChengdu(String chengdu) {
		this.chengdu = chengdu;
	}


	public String getBuytime() {
		return buytime;
	}


	public void setBuytime(String buytime) {
		this.buytime = buytime;
	}


	//添加商品
	public String goodsAdd(){
		Goods goods = new Goods();
		goods.setGoodsname(goodsname);
		goods.setPrice(price);
		goods.setShuishou(shuishou);
		goods.setContent(content);
		goods.setDelstatus("0");
		goods.setImg(xiangpian);
		goods.setStatus("正在出售");
		goods.setStime(Info.getDateStr());
		goods.setJiajia(jiajia);
		goods.setEtime(etime);
		goods.setBuytime(buytime);
		goods.setChengdu(chengdu);
		goods.setType(type);
		goods.setCs(0);
		goods.setMaxprice(goods.getPrice());
		goods.setMemberid(memberid);
		goods.setShstatus("待审核");
		commonDAO.save(goods);
		suc="添加成功";
		return "success";
	}
	
	
	//编辑商品
	public String goodsEdit(){
		Goods goods = (Goods)commonDAO.findById(id, "Goods");
		goods.setGoodsname(goodsname);
		goods.setPrice(price);
		goods.setShuishou(shuishou);
		goods.setContent(content);
		goods.setImg(xiangpian);
		goods.setJiajia(jiajia);
		goods.setEtime(etime);
		goods.setType(type);
		goods.setBuytime(buytime);
		goods.setChengdu(chengdu);
		goods.setMaxprice(goods.getPrice());
		commonDAO.update(goods);
		suc="编辑成功";
		return "success";
	}
	
	//删除商品
	public String goodsDel(){
		String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
		Goods goods = (Goods)commonDAO.findById(a[i], "Goods");
		goods.setDelstatus("1");
		commonDAO.update(goods);
		}
		suc="";
		return "success";
	}
	
	//删除商品
	public String prodcutDel(){
		System.out.println("id===="+id);
		Goods goods = (Goods)commonDAO.findById(id, "Goods");
		goods.setDelstatus("1");
		commonDAO.update(goods);
		suc="";
		return "success";
	}
	
	
	
	

	 
}
