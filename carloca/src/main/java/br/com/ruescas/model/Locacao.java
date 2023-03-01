package br.com.ruescas.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "locacao")
public class Locacao {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private LocalDate data;

    @OneToOne
    @JoinColumn(name = "cliente_id")
    private Cliente Cliente;

    @OneToOne
    @JoinColumn(name = "carro_id")
    private Carro carro;

    @OneToOne
    @JoinColumn(name = "retirada_id")
    private Retirada retirada;

    @OneToOne
    @JoinColumn(name = "devolucao_id")
    private Devolucao devolucao;
}
