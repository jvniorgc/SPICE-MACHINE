CREATE DATABASE `spiceMachine`;
USE `spiceMachine` ;

CREATE TABLE IF NOT EXISTS ingredientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS receitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    imagem VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL,
    ingrediente_id INT NOT NULL,
    FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id)
);

INSERT INTO ingredientes (nome) VALUES
    ('Alho'),
    ('Limão'),
    ('Pimenta');

INSERT INTO receitas (nome, imagem, link, ingrediente_id) VALUES
    ('Picles de Alho Poró', '../img/alho1.jpg', 'https://receitas.globo.com/receitas-da-tv/perto-do-fogo/como-fazer-picles-de-alho-poro-gnt.ghtml', 1),
    ('Sopa de Alho', '../img/alho2.jpg', 'https://www.tudogostoso.com.br/receita/107572-sopa-de-alho-mingau-de-alho.html', 1),
    ('Alho Confitado', '../img/alho3.jpg', 'https://essareceitafunciona.com.br/alho-confitado/', 1),
    ('Barrinha de Limão', '../img/limao1.jpg', 'https://cybercook.com.br/receitas/doces/receita-de-barrinha-de-limao-108548', 2),
    ('Sorbet de Limão', '../img/limao2.jpg', 'https://casavogue.globo.com/LazerCultura/Comida-bebida/Receita/noticia/2017/12/sorbet-de-limao-siciliano-receita-facil-para-fazer-em-casa-ja.html', 2),
    ('Limão Sparkler', '../img/limao3.jpg', 'https://receitas.globo.com/tipos-de-prato/drinks-e-bebidas/sparkler-leva-laranja-limao-e-angostura-gnt.ghtml', 2),
    ('Lemon com Frango', '../img/pimenta1.jpg', 'https://www.tudogostoso.com.br/receita/169718-files-de-frango-ao-limao.html', 3),
    ('Sopa de Pimenta', '../img/pimenta2.jpg', 'https://www.fooddiez.com.br/receitas/sopa-de-pimenta-vermelha-assada-7894/', 3),
    ('Molho de Pimenta', '../img/pimenta3.jpg', 'https://panelinha.com.br/receita/molho-de-pimenta-caseiro', 3);
