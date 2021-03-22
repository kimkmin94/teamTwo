package com.oracle.teamTwo.teamtwo.model;

import java.sql.Timestamp;

public class Chg_photochk {

	private int chg_num;
	private String parti_id_email;
	private Timestamp upload_timestamp;
	private int confirm_state;
	private String confirm_image;
	private int photochk_num;

	public int getPhotochk_num() {
		return photochk_num;
	}

	public void setPhotochk_num(int photochk_num) {
		this.photochk_num = photochk_num;
	}

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public String getParti_id_email() {
		return parti_id_email;
	}

	public void setParti_id_email(String parti_id_email) {
		this.parti_id_email = parti_id_email;
	}

	public Timestamp getUpload_timestamp() {
		return upload_timestamp;
	}

	public void setUpload_timestamp(Timestamp upload_timestamp) {
		this.upload_timestamp = upload_timestamp;
	}

	public int getConfirm_state() {
		return confirm_state;
	}

	public void setConfirm_state(int confirm_state) {
		this.confirm_state = confirm_state;
	}

	public String getConfirm_image() {
		return confirm_image;
	}

	public void setConfirm_image(String confirm_image) {
		this.confirm_image = confirm_image;
	}

}
