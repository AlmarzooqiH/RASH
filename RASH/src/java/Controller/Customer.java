/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author truedeveloper
 */
public class Customer {

    private String Fname;
    private String Lname;
    private int CID;
    private int AID;
    private String Phone;
    private String Email;

    public Customer() {
    }

    public Customer(String Fname, String Lname, int CID, String Phone, int AID, String Email) {
        this.Fname = Fname;
        this.Lname = Lname;
        this.CID = CID;
        this.Phone = Phone;
        this.AID = AID;
        this.Email = Email;
    }

    public String getFname() {
        return Fname;
    }

    public String getLname() {
        return Lname;
    }

    public int getCID() {
        return CID;
    }

    public String getPhone() {
        return Phone;
    }

    public int getAID() {
        return AID;
    }

    public String getEmail() {
        return Email;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public void setLname(String Lname) {
        this.Lname = Lname;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setAID(int AID) {
        this.AID = AID;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
     @Override
    public String toString() {
        String s = String.format("\nCustomer:\nFname: %s\nLname: %s\nCID: %d\nAID: %d\nPhone#: %s\nEmail: %s\n=======================================", Fname, Lname, CID, AID, Phone, Email);
        return (s);
    }
}
