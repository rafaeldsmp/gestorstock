package controller.common;

import exception.CampoInvalidoException;
import exception.OperacaoNaoPermitidaException;
import exception.RegistroDuplicadoException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.nio.file.AccessDeniedException;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
    public ErroResposta handleMethodArgumentNotValidException(final MethodArgumentNotValidException exception) {
        log.error("Erro de validação {}", exception.getMessage());
        List<ErroCampo> listaErros = exception.getBindingResult().getFieldErrors()
                .stream()
                .map(fe -> new ErroCampo(fe.getField(), fe.getDefaultMessage()))
                .collect(Collectors.toList());
        return new ErroResposta(HttpStatus.UNPROCESSABLE_ENTITY.value(), "Erro de validação.", listaErros);
    }

    @ExceptionHandler(RegistroDuplicadoException.class)
    @ResponseStatus(HttpStatus.CONFLICT)
    public ErroResposta handleRegistroDuplicadoException(RegistroDuplicadoException exception) {
        return ErroResposta.conflito(exception.getMessage());
    }

    @ExceptionHandler(OperacaoNaoPermitidaException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErroResposta handleOperacaoNaoPermitidaException(OperacaoNaoPermitidaException exception) {
        return ErroResposta.respostaPadrao(exception.getMessage());
    }

    @ExceptionHandler(CampoInvalidoException.class)
    @ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
    public ErroResposta handleCampoInvalidoException(CampoInvalidoException exception) {
        return new ErroResposta(
                HttpStatus.UNPROCESSABLE_ENTITY.value(),
                "Erro de validação.",
                java.util.Collections.singletonList(new ErroCampo(exception.getCampo(), exception.getMessage()))
        );
    }

    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public ErroResposta handleAccessDeniedException(AccessDeniedException exception){
        return new ErroResposta(HttpStatus.FORBIDDEN.value(), "Acesso Negado", Collections.emptyList());
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErroResposta handleErrosNaoTratados(RuntimeException e) {
        log.error("Erro inesperado: {}", e.getMessage());
        return new ErroResposta(HttpStatus.INTERNAL_SERVER_ERROR.value(),
                "Ocorreu um erro inesperado. Entre em contato com a administração",
                Collections.emptyList());
    }
}
