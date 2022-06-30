package com.gushipsam.cart;

public class CartBean {
	private String itemName;
	private String itemBrand;
	private String itemLink;
	private String itemImage;
	private int itemPrice;
	private int itemQty;
	
	public CartBean(String itemName, String itemBrand, String itemLink, String itemImage, int itemPrice, int itemQty) {
		super();
		this.itemName = itemName;
		this.itemBrand = itemBrand;
		this.itemLink = itemLink;
		this.itemImage = itemImage;
		this.itemPrice = itemPrice;
		this.itemQty = itemQty;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getItemBrand() {
		return itemBrand;
	}
	
	public void setItemBrand(String itemBrand) {
		this.itemBrand = itemBrand;
	}

	public String getItemLink() {
		return itemLink;
	}

	public void setItemLink(String itemLink) {
		this.itemLink = itemLink;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemQty() {
		return itemQty;
	}

	public void setItemQty(int itemQty) {
		this.itemQty = itemQty;
	}
	
	
	
	
}
