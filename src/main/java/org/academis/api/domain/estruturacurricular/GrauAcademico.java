package org.academis.api.domain.estruturacurricular;

public enum GrauAcademico {

    LICENCIATURA("Licenciado", "Licenciada"),
    BACHARELADO("Bacharel", "Bacharela"),
    TECNOLOGICO("Tecnólogo", "Tecnóloga"),
    TECNICO("Técnico", "Técnica");

    private String tituloMasculino;
    private String tituloFeminino;

    GrauAcademico(String tituloMasculino, String tituloFeminino) {
        this.tituloMasculino = tituloMasculino;
        this.tituloFeminino = tituloFeminino;
    }

    public String getTituloMasculino() {
        return tituloMasculino;
    }

    public String getTituloFeminino() {
        return tituloFeminino;
    }
}
