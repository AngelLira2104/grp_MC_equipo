document.addEventListener("DOMContentLoaded", function() {
  let usernameField = document.getElementById("username");
  let passwordField = document.getElementById("password");
  let expirationMessage = document.getElementById("passwordExpiredMessage");
  let updatePasswordForm = document.getElementById("updatePassword");
  let updatePasswordNewField = document.getElementById("updatePassword_newPassword");
  let updatePasswordVerifyField = document.getElementById("updatePassword_newPasswordVerify");

  let warningMessage = document.createElement("div"); // Crear alerta amarilla
  warningMessage.className = "alert alert-warning";
  warningMessage.style.display = "none"; // Inicialmente oculta
  warningMessage.setAttribute("role", "alert");
  warningMessage.id = "passwordWarningMessage";

  let loginButton = document.querySelector("button[type='submit']");
  loginButton.parentNode.insertBefore(warningMessage, loginButton);

  usernameField.addEventListener("input", function() {
    let username = usernameField.value.trim();

    if (username === "") {
      passwordField.disabled = false;
      passwordField.value = "";
      expirationMessage.style.display = "none";
      warningMessage.style.display = "none";
      return;
    }

    fetch("http://localhost:3000/getPasswordInfo?username=" + username)
      .then(response => response.json())
      .then(data => {
        if (data.fechaCreacion) {
          let passwordCreatedDate = new Date(data.fechaCreacion);
          let currentDate = new Date();
          let diffDays = Math.floor((currentDate - passwordCreatedDate) / (1000 * 3600 * 24)); // Días de diferencia
          let passwordExpirationDays = 5; // Número de días para la expiración
          let daysRemaining = passwordExpirationDays - diffDays; // Días restantes hasta expiración

          if (daysRemaining < 0) {
            daysRemaining = 0; // Si la diferencia es negativa, la contraseña ya ha expirado
          }

          let lastPassword = localStorage.getItem("lastPassword");

          if (daysRemaining > 0) {
            expirationMessage.style.display = "none";
            passwordField.disabled = false;

            if (daysRemaining <= 3) {
              warningMessage.textContent = "Tu password caduca en " + daysRemaining + " d\u00EDas. C\u00E1mbiala pronto.";
              warningMessage.style.display = "block";
            } else {
              warningMessage.style.display = "none";
            }
          } else {
            if (lastPassword === data.currentPassword) {
              expirationMessage.style.display = "none";
              passwordField.disabled = false;
              warningMessage.style.display = "none";
            } else {
              expirationMessage.style.display = "block";
              passwordField.disabled = true;
              warningMessage.style.display = "none";
            }
          }
        }
      })
      .catch(error => {
        console.error("Error obteniendo la informaci\u00F3n del password:", error);
        warningMessage.style.display = "none";
      });
  });

  // Function to update password
  window.updatePassword = function() {
    let newPassword = updatePasswordNewField.value.trim();
    let newPasswordVerify = updatePasswordVerifyField.value.trim();

    if (newPassword !== newPasswordVerify) {
      alert("Las contrase\u00F1as no coinciden.");
      return;
    }

    fetch("http://localhost:3000/updatePassword", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username: "admin",
        password: "opentaps",
        newPassword: newPassword,
      }),
    })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          alert("Contrase\u00F1a actualizada correctamente.");
          expirationMessage.style.display = "none";
          passwordField.disabled = false;
          updatePasswordForm.style.display = "none";
        } else {
          alert("Error al actualizar la contrase\u00F1a.");
        }
      })
      .catch(error => {
        console.error("Error al actualizar la contrase\u00F1a:", error);
      });
  };
});

