async function validateLogin() {
  document.querySelector('.form-login').submit((e) => {
    e.preventDefault();
  });
  
  const regexLogin = "[^A-Za-zÃ¡Ã Ã¢Ã£Ã©Ã¨ÃªÃ­Ã¯Ã³Ã´ÃµÃ¶ÃºÃ§Ã±ÃÃ€Ã‚ÃƒÃ‰ÃˆÃÃÃ“Ã”Ã•Ã–ÃšÃ‡Ã‘ 0-9]+";
  const login = document.getElementById('inputUser').value.toLowerCase();
  const password = document.getElementById('inputPassword').value;
  
  if (login === "") {

    alert('Favor informar um usuário.');

  } else if (login.match(regexLogin)) {

    alert('Nome inválido.');

  } else if (password === "") {

    alert('Favor informar a senha.');

  }
}
