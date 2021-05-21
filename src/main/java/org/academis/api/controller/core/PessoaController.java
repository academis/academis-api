package org.academis.api.controller.core;

import org.academis.api.domain.core.Pessoa;
import org.academis.api.repository.core.PessoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;

@RestController
@RequestMapping(value = "pessoa")
public class PessoaController {

    @Autowired
    private PessoaRepository pessoaRepository;

    @GetMapping
    public Collection<Pessoa> get() {
        return pessoaRepository.findAll();
    }


}
