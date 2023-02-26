package br.com.ruescas.core.data.entities;

import javax.persistence.Entity;

@Entity
public class Carro {
    private Integer id;
    private String modelo;
    private String versao;
    private Integer kilometragem;

}
