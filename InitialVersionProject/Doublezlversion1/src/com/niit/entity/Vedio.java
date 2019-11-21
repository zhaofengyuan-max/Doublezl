package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="vedio")
public class Vedio {

	@Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="VedioId", unique=true, nullable=false, length=10)
     private Integer vedioId;
    @Column(name="VedioName", nullable=false)
     private String vedioName;
    @Column(name="VedioPro", nullable=false, length=16)
     private String vedioPro;
    @Column(name="VedioAttachment", nullable=false)
     private String vedioAttachment;
    @Column(name="AttachmentOldName", nullable=false, length=10)
     private String attachmentOldName;
    @Column(name="uploadTime", length=25)
     private String uploadTime;
    @Column(name="Del", nullable=false, length=4)
     private String del;
    
    
    
	public Vedio() {
		super();
	}
	public Vedio(Integer vedioId, String vedioName, String vedioPro, String vedioAttachment, String attachmentOldName,
			String uploadTime, String del) {
		super();
		this.vedioId = vedioId;
		this.vedioName = vedioName;
		this.vedioPro = vedioPro;
		this.vedioAttachment = vedioAttachment;
		this.attachmentOldName = attachmentOldName;
		this.uploadTime = uploadTime;
		this.del = del;
	}
	public Integer getVedioId() {
		return vedioId;
	}
	public void setVedioId(Integer vedioId) {
		this.vedioId = vedioId;
	}
	public String getVedioName() {
		return vedioName;
	}
	public void setVedioName(String vedioName) {
		this.vedioName = vedioName;
	}
	public String getVedioPro() {
		return vedioPro;
	}
	public void setVedioPro(String vedioPro) {
		this.vedioPro = vedioPro;
	}
	public String getVedioAttachment() {
		return vedioAttachment;
	}
	public void setVedioAttachment(String vedioAttachment) {
		this.vedioAttachment = vedioAttachment;
	}
	
	public String getAttachmentOldName() {
		return attachmentOldName;
	}
	public void setAttachmentOldName(String attachmentOldName) {
		this.attachmentOldName = attachmentOldName;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}

    
    


}


