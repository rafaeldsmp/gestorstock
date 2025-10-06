package controller.common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.HttpStatus;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

//@Schema(name = "Erro de Resposta", description = "Modelo usado para retornar mensagens de erro da API")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ErroResposta implements Serializable {

    //    @Schema(description = "Código HTTP do erro", example = "400")
    private int status;

    //    @Schema(description = "Mensagem geral do erro", example = "Campo obrigatório ausente")
    private String mensagem;

    //    @Schema(description = "Lista de erros específicos por campo")
    private List<ErroCampo> erros;

    public static ErroResposta respostaPadrao(String mensagem){
        return new ErroResposta(HttpStatus.BAD_REQUEST.value(), mensagem, Collections.emptyList());
    }

    public static ErroResposta conflito(String mensagem){
        return new ErroResposta(HttpStatus.CONFLICT.value(), mensagem, Collections.emptyList());
    }

}
