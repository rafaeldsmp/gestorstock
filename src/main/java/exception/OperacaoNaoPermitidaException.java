package exception;

public class OperacaoNaoPermitidaException extends RuntimeException{
    public OperacaoNaoPermitidaException (String mensage){
        super(mensage);
    }
}
