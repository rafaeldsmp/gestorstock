document.addEventListener("DOMContentLoaded", function() {
    const hora = new Date().getHours();
    let saudacao;

    if (hora < 12) saudacao = "Bom dia";
    else if (hora < 18) saudacao = "Boa tarde";
    else saudacao = "Boa noite";

    const nome = "Rafael"; // Pode futuramente vir de ${usuario.nome}
    const elemento = document.getElementById("saudacao");

    if (elemento) {
        elemento.textContent = `${saudacao}, ${nome}!`;
    }
});
