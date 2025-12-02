package com.example.telecom.model;

public class User {

    private String name;
    private String email;
    private String mobile;
    private String currentPlanId;
    private String currentPlanName;
    private String billingType; // Prepaid / Postpaid
    private int remainingDataGb;
    private int currentBillAmount; // in INR

    public User(String name, String email, String mobile,
                String currentPlanId, String currentPlanName,
                String billingType, int remainingDataGb, int currentBillAmount) {
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.currentPlanId = currentPlanId;
        this.currentPlanName = currentPlanName;
        this.billingType = billingType;
        this.remainingDataGb = remainingDataGb;
        this.currentBillAmount = currentBillAmount;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getMobile() {
        return mobile;
    }

    public String getCurrentPlanId() {
        return currentPlanId;
    }

    public String getCurrentPlanName() {
        return currentPlanName;
    }

    public String getBillingType() {
        return billingType;
    }

    public int getRemainingDataGb() {
        return remainingDataGb;
    }

    public int getCurrentBillAmount() {
        return currentBillAmount;
    }
}
