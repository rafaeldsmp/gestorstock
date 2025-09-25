package controller;

import controller.dto.CategoriaDTO;
import lombok.RequiredArgsConstructor;
import model.Categoria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.CategoriaService;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("/categoria")
public class CategoriaController {
    public final CategoriaService categoriaService;

    @GetMapping("/pagina")
    public String listarCategorias(Model model) {
        List<Categoria> categorias = categoriaService.listarTudo();

        // Converte para DTO
        List<CategoriaDTO> dtos = categorias.stream()
                .map(CategoriaDTO::toDTO)
                .collect(Collectors.toList());

        model.addAttribute("categorias", dtos);
        return "lista"; // JSP em /WEB-INF/views/categoria-lista.jsp
    }

//        @RequestMapping(value = "/teste", method = RequestMethod.GET)
//        public String teste(Model model) {
//            model.addAttribute("mensagem", "Spring MVC funcionando!");
//            return "teste"; // nome do JSP
//        }

    @GetMapping("/teste")
    @ResponseBody
    public String teste() {
        return "Spring MVC funcionando!";
    }

}


