function buscarReceitas() {
    const ingredientes = document.getElementById('ingredientes').value;
    const apiKey = 'af991a61e05c7d082be472740b7d14b8';
    const apiUrl = `https://api.edamam.com/search?q=${ingredientes}&app_id=3dde8d71&app_key=${apiKey}`;

    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            const receitas = data.hits.slice(0, 9); 
            const receitasDiv = document.getElementById('receitas');
            receitasDiv.innerHTML = '';

            if (receitas.length === 0) {
                receitasDiv.innerHTML = 'Nenhuma receita encontrada com esses ingredientes.';
            } else {
                receitas.forEach(receita => {
                    const receitaInfo = receita.recipe;
                    const nome = receitaInfo.label;
                    const link = receitaInfo.url;
                    const imagem = receitaInfo.image;

                    const receitaElement = document.createElement('div');
                    receitaElement.innerHTML = `
                        <h3>${nome}</h3>
                        <img src="${imagem}" alt="${nome}">
                        <a href="${link}" target="_blank">Ver Receita</a>
                    `;

                    receitasDiv.appendChild(receitaElement);
                });
            }
        })
        .catch(error => {
            console.error('Ocorreu um erro:', error);
        });
}


$(document).ready(function () {
    $(".btnReceitas").click(function () {
        var ingredienteId = $(this).val();

        
        $.ajax({
            type: "POST",
            url: "../php/receitas.php",
            data: { ingredienteId: ingredienteId },
            success: function (data) {
                $("#receitas-container").html(data);
            }
        });
    });
});
