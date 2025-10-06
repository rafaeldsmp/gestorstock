package controller.common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Schema(name = "Erro de Campo", description = "Representa um erro específico de um campo")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ErroCampo {

//    @Schema(description = "Nome do campo que apresentou erro", example = "nome")
    private String campo;

//    @Schema(description = "Mensagem detalhando o erro", example = "Nome é obrigatório")
    private String mensagem;

}
