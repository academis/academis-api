package org.academis.api.controller;

import org.academis.api.domain.Pessoa;
import org.academis.api.repository.PessoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collection;

@RequestMapping(value = "pessoa")
public class PessoaController {

    @Autowired
    private PessoaRepository pessoaRepository;

    @GetMapping
    public Collection<Pessoa> get() {
        return pessoaRepository.findAll();
    }
}
