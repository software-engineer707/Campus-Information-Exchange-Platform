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
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import com.util.Retainone;

public class CarAction extends ActionSupport {
	private int id;
	private String goodsid;
	private CommonDAO commonDAO;
	String suc;
	String no;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
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

	public String carAdd() {
		Map session = ActionContext.getContext().getSession();
		Member member = (Member) session.get("member");
		if (member != null) {
			Goods goods = (Goods)commonDAO.findById(goodsid, "Goods");
			Car car = new Car();
			car.setMemberid(member.getId().toString());
			car.setGoodsid(goodsid);
			car.setSaver(goods.getMemberid());
			car.setSavetime(Info.getDateStr());
			commonDAO.save(car);
			goods.setStatus("交易完成");
			commonDAO.update(goods);
			suc="交易成功";
			goodsid=goodsid;
			return "success";
			}else{
				return "error";
			}
	}

}
