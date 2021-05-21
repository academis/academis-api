package org.academis.api.domain.estruturacurricular;

import org.academis.api.domain.core.UnidadeOrganizacional;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "curso")
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Version
    private Long version;

    @NotBlank
    @Min(value = 3)
    private String nome;

    @NotBlank
    @Size(min = 2, max = 20)
    private String sigla;

    @NotBlank
    @Size(min = 2, max = 10)
    @Column(name = "codigo_emec")
    private String codigoEmec;

    @NotBlank
    @Size(min = 2, max = 8)
    @Column(name = "codigo_enade")
    private String codigoEnade;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "unidade_organizacional_id")
    private UnidadeOrganizacional coordenacao;
}
