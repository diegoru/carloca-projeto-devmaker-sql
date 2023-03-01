package br.com.ruescas.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "retirada")
public class Retirada {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "data_hora")
    private LocalDateTime dataHora;

    private Integer quilometragem;

    @ManyToOne
    @JoinColumn(name = "franquia_id")
    private Franquia franquia;

    @OneToOne(mappedBy = "retirada")
    private Locacao locacao;
}
