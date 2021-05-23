package org.academis.api.domain.estruturacurricular;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "matriz_curricular")
public class MatrizCurricular {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Version
    private Long version;

    @NotBlank
    private String nome;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "curso_id")
    Curso curso;

    @NotBlank
    private String decreto;

    private Turno turno;

    @Column(name = "grau_academico")
    private GrauAcademico grauAcademico;

    @NotBlank
    @Min(value = 5)
    private String emissao;

    @NotBlank
    private String tituloFeminino;

    @NotBlank
    private String tituloMasculino;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String getDecreto() {
        return decreto;
    }

    public void setDecreto(String decreto) {
        this.decreto = decreto;
    }

    public Turno getTurno() {
        return turno;
    }

    public void setTurno(Turno turno) {
        this.turno = turno;
    }

    public GrauAcademico getGrauAcademico() {
        return grauAcademico;
    }

    public void setGrauAcademico(GrauAcademico grauAcademico) {
        this.grauAcademico = grauAcademico;
    }

    public String getEmissao() {
        return emissao;
    }

    public void setEmissao(String emissao) {
        this.emissao = emissao;
    }

    public String getTituloFeminino() {
        return tituloFeminino;
    }

    public void setTituloFeminino(String tituloFeminino) {
        this.tituloFeminino = tituloFeminino;
    }

    public String getTituloMasculino() {
        return tituloMasculino;
    }

    public void setTituloMasculino(String tituloMasculino) {
        this.tituloMasculino = tituloMasculino;
    }
}
