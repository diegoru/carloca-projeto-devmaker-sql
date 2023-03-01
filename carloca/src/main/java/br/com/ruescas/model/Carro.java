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

    @ManyToOne
    @JoinColumn(name = "cor_id")
    private Cor cor;

    @ManyToOne
    @JoinColumn(name = "montadora_id")
    private Montadora montadora;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "estoque_carro_id")
    private EstoqueCarro estoqueCarro;

    @OneToOne(mappedBy = "carro")
    private Locacao locacao;


}
