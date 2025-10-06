package controller.dto;

import lombok.Getter;
import lombok.Setter;
import model.Produto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Getter
@Setter
public class ProdutoDTO {

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    @NotBlank(message = "descrição é obrigatória")
    private String descricao;

    private String categoriaFoto;

    @NotNull(message = "Preço é obrigatório")
    private BigDecimal preco;

    @NotNull(message = "Estoque mínimo é obrigatório")
    private Integer estoqueMinimo;

    @NotNull(message = "ID da categoria é obrigatório")
    private Long categoriaId;

    @NotNull(message = "ID do fornecedor é obrigatório")
    private Long fornecedorId;

    // Converte DTO para entidade Produto
    public Produto toEntity(model.Categoria categoria, model.Fornecedor fornecedor) {
        Produto produto = new Produto();
        produto.setNome(this.nome);
        produto.setDescricao(this.descricao);
        produto.setCategoriaFoto(this.categoriaFoto);
        produto.setPreco(this.preco);
        produto.setEstoqueMinimo(this.estoqueMinimo);
        produto.setCategoria(categoria);
        produto.setFornecedor(fornecedor);
        return produto;
    }
}
