package br.com.ruescas.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "franquia")
public class Franquia {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nome;

    @OneToOne
    @Column(name = "endereco_id")
    private Endereco endereco;

    @ManyToOne
    @JoinColumn(name = "estoque_carro_id")
    private EstoqueCarro estoqueCarro;

    @OneToMany(mappedBy = "devolucao")
    private List<Devolucao> devolucoes;

    @OneToMany(mappedBy = "retirada")
    private List<Retirada> retiradas;

}
