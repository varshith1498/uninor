package com.example.telecom.model;

public class Plan {

    private String id;
    private String name;
    private int price; // in INR
    private String dataPerDay;
    private String validity;
    private String description;
    private String type; // "Prepaid" or "Postpaid"

    public Plan(String id, String name, int price, String dataPerDay,
                String validity, String description, String type) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.dataPerDay = dataPerDay;
        this.validity = validity;
        this.description = description;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getDataPerDay() {
        return dataPerDay;
    }

    public String getValidity() {
        return validity;
    }

    public String getDescription() {
        return description;
    }

    public String getType() {
        return type;
    }
}
