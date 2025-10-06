package model;

import lombok.Getter;
import lombok.Setter;
import validator.Auditable;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "fornecedor")
@Getter
@Setter
public class Fornecedor extends Auditable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nome")
    private String nome;
    @Column(name = "cnpj")
    private String cnpj;
    @Column(name = "telefone")
    private String telefone;
    @Column(name = "email")
    private String email;
    @OneToMany(mappedBy = "fornecedor")
    private List<Produto> produtos;
}
