<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "spicemachine";

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$ingredienteId = $_POST['ingredienteId'];


$sql = "SELECT nome, imagem, link FROM receitas WHERE ingrediente_id = $ingredienteId LIMIT 3";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='receita'>";
        echo "<h2>" . $row['nome'] . "</h2>";
        echo "<img src='" . $row['imagem'] . "' alt='Imagem da Receita'>";
        echo "<a href='" . $row['link'] . "' target='_blank'>Ver Receita</a>";
        echo "</div>";
    }
} else {
    echo "Nenhuma receita encontrada com este ingrediente.";
}

$conn->close();
?>

<style>
    *{
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    background-color: var(--color-white);
    text-decoration: none;
    }

    .receita {
    display:inline-grid;
    justify-items:center;
    width: 300px;
    height: 400px;
    text-align: center;
    margin: 3%;
    padding: 2%;
    background: rgb(236, 236, 236);
    box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
  }

    .receita h2 {
        color: #CF4647;
        margin-bottom:7%;
    }

    .receita img {
        max-width: 100%;
    }

    .receita a {
        color: #CF4647;
        text-decoration: none;
        margin-top:7%;
    }

    #receitas-container {
        display: flex;
        justify-content: center;
        
    }

    @media screen and (max-width: 768px) {
    #receitas-container {
      display: block;
     margin:5%;
    }
  }
  @media screen and (max-width: 768px) {
    .receita {
     margin:5%;
    }
  }
</style>
