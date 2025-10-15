package controller.dto;

import lombok.Getter;
import lombok.Setter;
import model.Categoria;
import service.CategoriaService;

import javax.validation.constraints.NotBlank;

//criar
@Getter
@Setter
public class CategoriaCriacaoDTO {
    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    public Categoria toEntity(CategoriaService categoriaService){
        Categoria categoria = new Categoria();
        categoria.setNome(this.nome);
        categoria.setDescricao(this.descricao);

        return categoria;
    }

}
