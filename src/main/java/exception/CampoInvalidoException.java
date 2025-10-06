package exception;

import lombok.Getter;

@Getter
public class CampoInvalidoException extends RuntimeException{
    private String campo;
    public CampoInvalidoException(String campo, String mensage){
        super(mensage);
        this.campo = campo;
    }
}
