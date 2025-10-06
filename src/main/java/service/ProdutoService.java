package service;

import lombok.RequiredArgsConstructor;
import model.Produto;
import org.springframework.stereotype.Service;
import repository.ProdutoRepository;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class ProdutoService {
    private final ProdutoRepository produtoRepository;

    public List<Produto> listarTudo (){
        return produtoRepository.findAll();
    }

    public Optional<Produto> buscarPorId(Long id){
        return produtoRepository.findById(id);
    }

    public Produto salvar(Produto produto){
        return produtoRepository.save(produto);
    }

    public Produto atualizar(Produto produto){
        if(produto == null){
                throw new IllegalArgumentException("Para atualizar, é necessário que o Produto já esteja salvo");
        }
        return produtoRepository.save(produto);
    }

    public void deletar(Produto produto){
        produtoRepository.delete(produto);
    }
}
