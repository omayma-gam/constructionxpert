<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://i.pinimg.com/736x/cb/ec/dc/cbecdc10643074c69636d00585611487.jpg');
      background-size: cover; /* Couvre toute la page */
      background-position: center; /* Centre l'image */
      background-repeat: no-repeat; /* Empêche la répétition */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .login-container {
      background-color: rgba(255, 255, 255, 0.8); /* Fond semi-transparent */
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 300px;
      text-align: center;
    }
    .login-container h2 {
      margin-bottom: 20px;
    }
    .login-container input {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .login-container button {
      width: 100%;
      padding: 10px;
      background-color: orange;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .login-container button:hover {
      background-color: lightcoral;
    }
    .error-message {
      color: red;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h2>Connexion</h2>
  <form id="loginForm">
    <input type="text" id="username" placeholder="Nom d'utilisateur" required>
    <input type="password" id="password" placeholder="Mot de passe" required>
    <button type="submit">Se connecter</button>
  </form>
  <div id="errorMessage" class="error-message"></div>
</div>

<script>
  document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Empêche la soumission du formulaire

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    if (username === 'admin' && password === 'admin123') {
      window.location.href = 'home.jsp'; // Redirige vers la page d'accueil
    } else {
      document.getElementById('errorMessage').textContent = 'Nom d\'utilisateur ou mot de passe incorrect';
    }
  });
</script>
</body>
</html>