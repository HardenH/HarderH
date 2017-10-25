package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Comments;
import com.etc.weigo.util.BaseDao;



public class CommentsDao {
	/**
	 * 鏍规嵁鍟嗗搧id鏌ユ壘璇勮
	 * @param GOODSID
	 * @return
	 */
public List<Comments> getcomments(int GOODSID){
	return (List<Comments>) BaseDao.select("select * from COMMENTS WHERE GOODSID = ?", Comments.class, GOODSID);
	
}
/**
 * 姣忔浠庢暟鎹簱涓煡璇簲鏉℃暟鎹嚭鏉�
 *
 */
public List<Comments> getfivecoms(int GOODSID,int page){
	return (List<Comments>) BaseDao.getpageoracle("select * from COMMENTS WHERE GOODSID = ?", 5, page, Comments.class, GOODSID);
	
}
}
