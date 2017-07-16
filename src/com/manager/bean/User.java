package com.manager.bean;

public class User {
	
	int id;
	String nickName,passWord,account;
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	public String getAccount(){
		return account;
	}
	public void setAccount(String account){
		this.account=account;
	}
}
