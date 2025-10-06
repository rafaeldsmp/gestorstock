package controller.dto;

import lombok.Getter;
import lombok.Setter;
import model.Fornecedor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class FornecedorDTO {

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    @NotBlank(message = "CNPJ é obrigatório")
    private String cnpj;

    @NotBlank(message = "telefone é obrigatório")
    private String telefone;

    @Email(message = "Email inválido")
    private String email;

    // Converte DTO para entidade
    public Fornecedor toEntity() {
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setNome(this.nome);
        fornecedor.setCnpj(this.cnpj);
        fornecedor.setTelefone(this.telefone);
        fornecedor.setEmail(this.email);
        return fornecedor;
    }
}
