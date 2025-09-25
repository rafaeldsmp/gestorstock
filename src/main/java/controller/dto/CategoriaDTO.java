package controller.dto;

import lombok.Getter;
import lombok.Setter;
import model.Categoria;

import javax.validation.constraints.NotBlank;

//listagem e detalhe
@Getter
@Setter
public class CategoriaDTO {

    private Long id;

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    // Converte DTO para entidade
    private Categoria toEntity() {
        Categoria categoria = new Categoria();
        categoria.setNome(this.nome);
        categoria.setDescricao(this.descricao);
        return categoria;
    }
    public static CategoriaDTO toDTO(Categoria categoria) {
        CategoriaDTO dto = new CategoriaDTO();
        dto.setId(categoria.getId());
        dto.setNome(categoria.getNome());
        dto.setDescricao(categoria.getDescricao());
        return dto;
    }
}
