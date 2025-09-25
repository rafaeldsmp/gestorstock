package service;

import lombok.RequiredArgsConstructor;
import model.Fornecedor;
import org.springframework.stereotype.Service;
import repository.FornecedorRepository;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class FornecedorService {
    public final FornecedorRepository fornecedorRepository;

    public List<Fornecedor> fornecedor(){
        return fornecedorRepository.findAll();
    }

    public Optional<Fornecedor> buscarPorId(Long id){
        return fornecedorRepository.findById(id);
    }

    public Fornecedor salvar (Fornecedor fornecedor){
        return fornecedorRepository.save(fornecedor);
    }

    public Fornecedor atualizar(Fornecedor fornecedor){
        if(fornecedor == null){
            throw new IllegalArgumentException("Para atualizar, é necessário que o Fornecedor já esteja salvo");
        }
        return fornecedorRepository.save(fornecedor);
    }

    public void deletar(Fornecedor fornecedor){
        fornecedorRepository.delete(fornecedor);
    }
}
