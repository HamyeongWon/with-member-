package com.example.with.member;

public class Member {
	String id;
	String pwd;
	String name;
	String tel;
	int addr;
	String nick;
	int type;
	double rate;

	public Member() {
		super();
	}

	public Member(String id, String pwd, String name, String tel, int addr, String nick, int type, double rate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.nick = nick;
		this.type = type;
		this.rate = rate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getAddr() {
		return addr;
	}

	public void setAddr(int addr) {
		this.addr = addr;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", addr=" + addr + ", nick="
				+ nick + ", type=" + type + ", rate=" + rate + "]";
	}
}