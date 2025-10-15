package controller.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UsuarioLoginDTO {
    @NotBlank(message = "Nome é obrigatório")
    private String email;

    @Email(message = "Email inválido")
    private String senha;

}
