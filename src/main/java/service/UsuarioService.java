package service;

import lombok.RequiredArgsConstructor;
import model.Usuario;
import org.springframework.stereotype.Service;
import repository.UsuarioRepository;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UsuarioService {
    private final UsuarioRepository usuarioRepository;

    public List<Usuario> listarTudo(){
        return usuarioRepository.findAll();
    }

    public Optional<Usuario> buscarPorId(Long id){
        return usuarioRepository.findById(id);
    }

    public Usuario salvar(Usuario usuario){
        return usuarioRepository.save(usuario);
    }

    public Usuario atualizar (Usuario usuario){
        if(usuario == null){
            throw new IllegalArgumentException("Para atualizar, é necessário que o Usuário já esteja salvo");
        }
        return usuarioRepository.save(usuario);
    }

    public void deletar(Usuario usuario){
        usuarioRepository.delete(usuario);
    }
}
