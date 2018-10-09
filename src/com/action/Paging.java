package com.action;

public class Paging {
	//总数量
	private int totalCount;
	//总页数
	private int pageCount;
	//当前页
	private int currentPage;
	//一页多少条数据
	private int countPerPage;
	
	private String prefixUrl;
	
	//true的术后是&否则是？
	private boolean isAnd;
	
	public Paging(int currentPage,int totalCount,int countPerPage){
		this.countPerPage=countPerPage;
		pageCount=(totalCount-1)/countPerPage+1;
		/*比如总共29条数据，即总数量为29，一页为10条数据，则总页数=28/11约等为3	*/
		
		if(currentPage>=pageCount){
			currentPage=pageCount-1;
		}
		if(currentPage<0){
			currentPage=0;
		}
		
		this.totalCount=totalCount;
		this.currentPage=currentPage;
	}
	
	public Paging(){
		
	}
	
	public int getCurrentPage(){
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage){
		this.currentPage=currentPage;
	}
	
	/*
	 * @return Returns the prefixUrl.
	 */
	public String getPrefixUrl(){
		return prefixUrl;
	}
	/*
	 * @param prefixUrl The prefixUrl to set.
	 */
	public void setPrefixUrl(String prefixUrl){
		this.prefixUrl=prefixUrl;
	}
	/*
	 * @return Returns the totalCount.
	 */
	public int getTotalCount(){
		return totalCount;
	}
	/*
	 * @param totalCount The totalCount to set;
	 */
	public void setTotalCount(int totalCount){
		this.totalCount=totalCount;
	}
	
	public int getPageCount(){
		return pageCount;
	}
	
	public void setPageCount(int pageCount){
		this.pageCount=pageCount;
	}
	
	public int getCountPerPage(){
		return countPerPage;
	}
	
	public void setCountPerPage(int countPerPage){
		this.countPerPage=countPerPage;
	}
	
	
	@Override
	public String toString(){
		return"PagingBean [totalCount="+totalCount+",titalPageCount="
				+pageCount+",currentPage="+currentPage
				+",prefixUrl="+prefixUrl+",countPerPage="+countPerPage
				+",isAnd="+isAnd+"]";
	}
	
	public boolean isAnd(){
		return isAnd;
	}
	
	public void setAnd(boolean isAnd){
		this.isAnd=isAnd;
	}
	
	
	
}
