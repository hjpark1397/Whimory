package com.test.whimory.common;

import java.sql.Date;

public class SearchDate implements java.io.Serializable {
	private static final long SerialVersionUID = 9998L;
	
	private Date begin;
	private Date end;
	
	public SearchDate() {}

	public SearchDate(Date begin, Date end) {
		super();
		this.begin = begin;
		this.end = end;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public static long getSerialversionuid() {
		return SerialVersionUID;
	}

	@Override
	public String toString() {
		return "SearchDate [begin=" + begin + ", end=" + end + "]";
	}
}
