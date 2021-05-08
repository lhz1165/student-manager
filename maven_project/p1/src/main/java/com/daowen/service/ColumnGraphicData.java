package com.daowen.service;

public class ColumnGraphicData {

	private Number showvalue;
	
	public Number getShowvalue() {
		return showvalue;
	}

	public void setShowvalue(Number showvalue) {
		this.showvalue = showvalue;
	}

	public Comparable getRowkey() {
		return rowkey;
	}

	public void setRowkey(Comparable rowkey) {
		this.rowkey = rowkey;
	}

	public Comparable getColumnkey() {
		return columnkey;
	}

	public void setColumnkey(Comparable columnkey) {
		this.columnkey = columnkey;
	}

	private Comparable  rowkey;
	
	private Comparable  columnkey;
	
}
