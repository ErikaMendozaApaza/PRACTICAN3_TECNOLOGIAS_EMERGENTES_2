package com.emergentes.modelo;
import java.util.Date;
import java.text.SimpleDateFormat;

public class Student {
    // atributos
    private int id;
    private Date fecha;
    private String nombre;
    private String apellidos;
    private String turno;
    private String[] seminarios;

    //constructores

    public Student(int id, Date fecha, String nombre, String apellidos, String[] seminarios, String turno) {
        this.id = id;
        this.fecha = fecha;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.seminarios = seminarios;
        this.turno = turno;
    }

    public Student() {
    }

    //getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String[] getSeminarios() {
        return seminarios;
    }

    public void setSeminarios(String[] seminarios) {
        this.seminarios = seminarios;
    }

    //metodos
    public String getFormattedFecha() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormat.format(this.fecha);
    }
    public String getSeminariosFormatted() {
        StringBuilder seminariosFormatted = new StringBuilder();
        for (String seminario : this.seminarios) {
            seminariosFormatted.append(seminario).append(", ");
        }
        return seminariosFormatted.toString().trim().replaceAll(",$", "");
    }
}
