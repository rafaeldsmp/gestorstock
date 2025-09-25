package controller.dto;

import javax.validation.constraints.NotBlank;

//atualizar
public class CategoriaAtualizacaoDTO {
    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;
}
