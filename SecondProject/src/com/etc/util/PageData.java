package com.etc.util;

import java.util.List;

/**
 * ��ҳ������
 */
public class PageData<T> {
	private List<T> data; // ���ҵ�����

	private Integer total; // �ܼ�¼��

	private Integer pageSize;// ÿҳ���У�ÿҳ�ļ�¼��

	private Integer page;// ҳ��(ҳ��)
	
	private Integer totalPage;

	public PageData() {
		super();
	}

	public PageData(List<T> data, Integer total, Integer pageSize, Integer page) {
		super();
		this.data = data;
		this.total = total;
		this.pageSize = pageSize;
		this.page = page;
		this.totalPage = getTotalPage();
	}

	

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * �Զ��巽��gettotalPage ��ȡ��ҳ��
	 * 
	 * @return
	 */
	public int getTotalPage() {
		//  15��   ÿҳ��ʾ4��
		int num = total / pageSize; 
		if (total % pageSize != 0)
			num++;
		return num;
	}

	@Override
	public String toString() {
		return "{total:" + total + ",data:" + data + "}";
	}
}
