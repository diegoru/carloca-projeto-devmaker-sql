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
    @Column(name = "cliente_id")
    private Integer clienteId;
    @Column(name = "carro_id")
    private Integer carroId;
    @Column(name = "retirada_id")
    private Integer retiradaId;
    @Column(name = "devolucao_id")
    private Integer devolucaoId;
}
