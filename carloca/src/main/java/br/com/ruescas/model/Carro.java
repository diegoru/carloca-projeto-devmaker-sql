package br.com.ruescas.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "carro")
public class Carro {
    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String modelo;
    private String versao;
    private Integer quilometragem;
    @Column(name = "cor_id")
    private Integer corId;
    @Column(name = "montadora_id")
    private Integer montadoraId;
    @Column(name = "categoria_id")
    private Integer categoriaId;

}
