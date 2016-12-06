package com.cz.fms.formation.domain;

public class Formation {
	
	private int formation_num;
	private String formation_name;
	private String formation_path;
	
	
	public Formation() {}


	public Formation(int formation_num, String formation_name, String formation_path) {
		this.formation_num = formation_num;
		this.formation_name = formation_name;
		this.formation_path = formation_path;
	}


	public int getFormation_num() {
		return formation_num;
	}


	public void setFormation_num(int formation_num) {
		this.formation_num = formation_num;
	}


	public String getFormation_name() {
		return formation_name;
	}


	public void setFormation_name(String formation_name) {
		this.formation_name = formation_name;
	}


	public String getFormation_path() {
		return formation_path;
	}


	public void setFormation_path(String formation_path) {
		this.formation_path = formation_path;
	}
	
	
	
	

}
