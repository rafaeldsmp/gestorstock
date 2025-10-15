package service;

import lombok.RequiredArgsConstructor;
import model.Categoria;
import org.springframework.stereotype.Service;
import repository.CategoriaRepository;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class CategoriaService {

    private final CategoriaRepository categoriaRepository;

    public List<Categoria> listarTudo(){
        return categoriaRepository.findAll();
    }

    public Optional<Categoria> buscarPorId(Long id){
        return categoriaRepository.findById(id);
    }

    public Categoria salvar(Categoria categoria){
        return categoriaRepository.save(categoria);
    }

    public Categoria atualizar(Categoria categoria){
        if(categoria.getId() == null){
            throw new IllegalArgumentException("Para atualizar, é necessário que a Categoria já esteja salva");
        }
        return categoriaRepository.save(categoria);
    }

    public void deletar(Categoria categoria){
        categoriaRepository.delete(categoria);
    }
}
