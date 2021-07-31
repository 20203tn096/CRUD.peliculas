package mx.com.movie.model;

import java.util.Date;

public class BeanMovie {
    private int id;
    private String name;
    private String description;
    private String premiereDate;
    private double collection;
    private int status;

    public BeanMovie() {
    }

    public BeanMovie(int id, String name, String description, String premiereDate, double collection, int status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.premiereDate = premiereDate;
        this.collection = collection;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPremiereDate() {
        return premiereDate;
    }

    public void setPremiereDate(String premiereDate) {
        this.premiereDate = premiereDate;
    }

    public double getCollection() {
        return collection;
    }

    public void setCollection(double collection) {
        this.collection = collection;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
