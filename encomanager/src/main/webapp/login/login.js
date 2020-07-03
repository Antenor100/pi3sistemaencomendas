var senhaVisivel = true;

window.onload = () => {
	let inputEyeIcon = document.getElementById("inputEyeIcon");
	
	inputEyeIcon.addEventListener("click", () => {
		mostraSenha(senhaVisivel);
		senhaVisivel = !senhaVisivel;
	});
	
	function mostraSenha(mostra) {
	    let inputSenha = document.getElementById("inputSenha");
	    
	    if (mostra) {
	        inputSenha.setAttribute("type", "text");
			
	        inputStringIconClass = inputEyeIcon.getAttribute("class");
	        inputEyeIcon.setAttribute("class", inputStringIconClass.replace("fa-eye", "fa-eye-slash"));
	
	    } else {
	        inputSenha.setAttribute("type", "password");
	        
	        inputStringIconClass = inputEyeIcon.getAttribute("class");
	        inputEyeIcon.setAttribute("class", inputStringIconClass.replace("fa-eye-slash", "fa-eye"));
	    }
	}
}