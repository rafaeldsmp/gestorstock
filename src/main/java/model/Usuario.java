package model;

import lombok.Getter;
import lombok.Setter;
import model.enums.Roles;
import validator.Auditable;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name="usuario")
@Getter
@Setter
public class Usuario extends Auditable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nome")
    private String nome;

    @Column(name = "senha")
    private String senha;

    @Column(name = "usuario_foto")
    private String usuarioFoto;

    @Column(name = "email")
    private String email;

    @Column(name="data_aniversario")
    private LocalDate dataNascimento;

    @Column(name = "roles")
    private Roles roles;
}
