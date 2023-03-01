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
@Table(name = "estoque_carro")
public class EstoqueCarro {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private boolean disponivel;

    @OneToMany(mappedBy = "carro")
    private List<Carro> carros;

    @OneToMany
    @Column(name = "franquia")
    private List<Franquia> franquias;

}
