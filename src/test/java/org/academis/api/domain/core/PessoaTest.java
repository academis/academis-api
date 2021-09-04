package org.academis.api.domain.core;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class PessoaTest {

    private Pessoa pessoa;

    @BeforeEach
    public void setUp() {
        pessoa = new Pessoa();
    }

    @Test
    public void deveRetonarNomeCivilQuandoNomeSocialForNulo() {
        final String nomeCivil = "Nome Civil";
        final String nomeSocial = null;

        pessoa.setNomeCivil(nomeCivil);
        pessoa.setNomeSocial(nomeSocial);

        final String nomeExibicao = pessoa.getNomeExibicao();
        assertEquals(nomeCivil, nomeExibicao);
    }

    @Test
    public void deveRetonarNomeCivilQuandoNomeSocialEstiverVazio() {
        final String nomeCivil = "Nome Civil";
        final String nomeSocial = "";

        pessoa.setNomeCivil(nomeCivil);
        pessoa.setNomeSocial(nomeSocial);

        final String nomeExibicao = pessoa.getNomeExibicao();
        assertEquals(nomeCivil, nomeExibicao);
    }

    @Test
    public void deveRetonarNomeCivilQuandoNomeSocialEstiverEmBranco() {
        final String nomeCivil = "Nome Civil";
        final String nomeSocial = " ";

        pessoa.setNomeCivil(nomeCivil);
        pessoa.setNomeSocial(nomeSocial);

        final String nomeExibicao = pessoa.getNomeExibicao();
        assertEquals(nomeCivil, nomeExibicao);
    }

    @Test
    public void deveRetonarNomeCivilQuandoNomeSocialNaoForNulo() {
        final String nomeCivil = "Nome Civil";
        final String nomeSocial = "Nome Social";

        pessoa.setNomeCivil(nomeCivil);
        pessoa.setNomeSocial(nomeSocial);

        final String nomeExibicao = pessoa.getNomeExibicao();
        assertEquals(nomeSocial, nomeExibicao);
    }
}