package com.bean;

import java.text.NumberFormat;

public class Tongjibean {
	private int weishenhe;
	private int shenhe;
	private int tongguo;
	private int tuihui;
	private int zong;
	private String weishenhe1;
	private String shenhe1;
	private String tongguo1;
	private String tuihui1;
	public int getWeishenhe() {
		return weishenhe;
	}
	public void setWeishenhe(int weishenhe) {
		this.weishenhe = weishenhe;
	}
	public int getShenhe() {
		return shenhe;
	}
	public void setShenhe(int shenhe) {
		this.shenhe = shenhe;
	}
	public int getTongguo() {
		return tongguo;
	}
	public void setTongguo(int tongguo) {
		this.tongguo = tongguo;
	}
	public int getTuihui() {
		return tuihui;
	}
	public void setTuihui(int tuihui) {
		this.tuihui = tuihui;
	}
	
	public int getZong() {
		return zong;
	}
	public void setZong() 
	{
		this.zong = this.weishenhe+this.shenhe;
	}
	public String jiussuan(int num1,int num2)
	{
		
		NumberFormat numberFormat = NumberFormat.getInstance();  
	
        numberFormat.setMaximumFractionDigits(2);  
  
        String result = numberFormat.format((float) num1 / (float) num2 * 100);
        return result+ "%";
		
	}
	
	public void setWeishenhe1(String weishenhe1) {
		this.weishenhe1 = weishenhe1;
	}
	public void setShenhe1(String shenhe1) {
		this.shenhe1 = shenhe1;
	}
	public void setTongguo1(String tongguo1) {
		this.tongguo1 = tongguo1;
	}
	public void setTuihui1(String tuihui1) {
		this.tuihui1 = tuihui1;
	}
	public String getWeishenhe1() {
		return weishenhe1;
	}
	public String getShenhe1() {
		return shenhe1;
	}
	public String getTongguo1() {
		return tongguo1;
	}
	public String getTuihui1() {
		return tuihui1;
	}
	
	
	

}
