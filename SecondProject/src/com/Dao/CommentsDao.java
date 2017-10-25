package com.Dao;

import java.util.List;

import com.entity.Comments;
import com.etc.util.BaseDao;

public class CommentsDao {
	/**
	 * 根据商品id查找评论
	 * @param GOODSID
	 * @return
	 */
public List<Comments> getcomments(int GOODSID){
	return (List<Comments>) BaseDao.select("select * from COMMENTS WHERE GOODSID = ?", Comments.class, GOODSID);
	
}
/**
 * 每次从数据库中查询五条数据出来
 *
 */
public List<Comments> getfivecoms(int GOODSID,int page){
	return (List<Comments>) BaseDao.getpageoracle("select * from COMMENTS WHERE GOODSID = ?", 5, page, Comments.class, GOODSID);
	
}
}
