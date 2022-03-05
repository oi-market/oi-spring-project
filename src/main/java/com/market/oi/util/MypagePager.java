package com.market.oi.util;

public class MypagePager {

	private long perPage;
	private long perBlock;
	private long curPage;

	private long startRow;
	private long lastRow;
	
	private long totalPage;
	private long curBlock;
	private long totalBlock;
	private long startNum;
	private long lastNum;

	private boolean pre=false;
	private boolean next=false;
	
	public MypagePager() {
		// TODO Auto-generated constructor stub
		perPage=12;
		perBlock=5;
		curPage=1;
	}
	
	public void makeRow() {

		this.startRow= (curPage-1)*(perPage)+1;
		this.lastRow= curPage *perPage;

	}

	public void makeNum(long totalCount) {

		//총 페이지 갯수
		totalPage = totalCount/perPage;
		if(totalCount%perPage!=0) {
			totalPage++;
		}
		//총 블록
		totalBlock= totalPage/perBlock;
		if(totalPage%perBlock!=0) {
			totalBlock++;
		}
		//현 블록
		curBlock = curPage/perBlock;
		if(curPage%perBlock!=0) {
			curBlock++;
		}
		//페이지 밑 번호
		startNum=perBlock*(curBlock-1)+1;
		lastNum=curBlock * perBlock;
		//마지막 블럭 정리
		if(curBlock==totalBlock) {
			lastNum=totalPage;
		}
		//앞 뒤 정리
		if(curBlock>1) {
			pre=true;
		}
		if(curBlock<totalBlock) {
			next=true;
		}

	}

	
	public long getPerPage() {
		return perPage;
	}

	public void setPerPage(long perPage) {
		this.perPage = perPage;
	}

	public long getPerBlock() {
		return perBlock;
	}

	public void setPerBlock(long perBlock) {
		this.perBlock = perBlock;
	}

	public long getCurPage() {
		return curPage;
	}

	public void setCurPage(long curPage) {
		this.curPage = curPage;
	}

	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public long getLastRow() {
		return lastRow;
	}

	public void setLastRow(long lastRow) {
		this.lastRow = lastRow;
	}

	public long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}

	public long getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(long curBlock) {
		this.curBlock = curBlock;
	}

	public long getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(long totalBlock) {
		this.totalBlock = totalBlock;
	}

	public long getStartNum() {
		return startNum;
	}

	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}

	public long getLastNum() {
		return lastNum;
	}

	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

}
