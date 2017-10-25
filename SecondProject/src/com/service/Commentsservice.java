package com.service;

import java.util.List;

import com.Dao.CommentsDao;
import com.entity.Comments;
import com.etc.util.PageData;

public class Commentsservice {
	CommentsDao cd = new CommentsDao();
		/**
		 * 根据商品id查找评论
		 * @param GOODSID
		 * @return
		 */
	public List<Comments> getcomments(int GOODSID){
		return cd.getcomments(GOODSID);
	}
	/**
	 * 每次从数据库中查询五条数据出来
	 *
	 */
	public PageData<Comments> getfivecoms(int GOODSID,int page){
		return (PageData<Comments>) cd.getfivecoms(GOODSID, page);
	}
}
