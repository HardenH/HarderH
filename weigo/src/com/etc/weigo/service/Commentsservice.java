package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.CommentsDao;
import com.etc.weigo.entity.Comments;
import com.etc.weigo.util.PageData;

public class Commentsservice {
	CommentsDao cd = new CommentsDao();
		/**
		 * 鏍规嵁鍟嗗搧id鏌ユ壘璇勮
		 * @param GOODSID
		 * @return
		 */
	public List<Comments> getcomments(int GOODSID){
		return cd.getcomments(GOODSID);
	}
	/**
	 * 姣忔浠庢暟鎹簱涓煡璇簲鏉℃暟鎹嚭鏉�
	 *
	 */
	public PageData<Comments> getfivecoms(int GOODSID,int page){
		return (PageData<Comments>) cd.getfivecoms(GOODSID, page);
	}
}
