package controller.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import java.time.LocalDate;
import java.util.List;

public class UsuarioAtualizacaoDTO {
    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    @NotBlank(message = "Senha é obrigatória")
    private String senha;

    private String usuarioFoto;

    @Email(message = "Email inválido")
    private String email;

    @Past(message = "não pode ser uma data futura")
    private LocalDate dataNascimento;

    private List<String> roles;
}
