/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Eduardo
 */
public class Paciente {
    private int codigo;
    private String nombre, direccion, genero, tipo_de_sangre;

    public Paciente(int codigo, String nombre, String direccion, String genero, String tipo_de_sangre) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.direccion = direccion;
        this.genero = genero;
        this.tipo_de_sangre = tipo_de_sangre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTipo_de_sangre() {
        return tipo_de_sangre;
    }

    public void setTipo_de_sangre(String tipo_de_sangre) {
        this.tipo_de_sangre = tipo_de_sangre;
    }
}
