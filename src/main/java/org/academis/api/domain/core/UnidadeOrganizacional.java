package org.academis.api.domain.core;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "unidade_organizacional")
public class UnidadeOrganizacional {

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

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "campus_id")
    private Campus campus;
}
