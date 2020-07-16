<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade text-dark" id="idInicial" tabindex="-1" role="dialog" aria-labelledby="TituloModalLongoExemplo" aria-hidden="true">
	<script type="text/javascript">
		let modalInput =  document.getElementById("idInicial");
		modalInput.setAttribute("id", modalProperties.id);
	</script>

  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitulo">
	        <script type="text/javascript">
				let tituloModalInput = document.getElementById("modalTitulo")	
		        tituloModalInput.innerHTML = modalProperties.title;
			</script>
		</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div id="modalBody" class="modal-body">
      	 <script type="text/javascript">
			let corpoModalInput = document.getElementById("modalBody")	
	        corpoModalInput.innerHTML = modalProperties.body;
		</script>  
      </div>
      
      <div class="modal-footer">
      	<!-- Botão cancel -->
        <button id="cancelButton" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cancelFunction()">Fechar</button>
      	<script type="text/javascript">
        	function cancelFunction() {
        		if (modalProperties.cancelFunction != undefined) modalProperties.cancelFunction();
			}
        	
        	let cancelButtonInput = document.getElementById("cancelButton");
        	if (modalProperties.btnCancelLabel != undefined && modalProperties.btnCancelLabel != "") cancelButtonInput.innerHTML = modalProperties.btnCancelLabel;
        	
        	if (!modalProperties.showBtnCancel) cancelButtonInput.setAttribute("style", "display:none");
        </script>
        
        <!-- Botão ok -->
        <button id="okButton" type="button" class="btn btn-primary" onclick="okFunction()">Salvar mudanças</button>
        <script type="text/javascript">
        	function okFunction() {
        		if (modalProperties.okFunction != undefined) modalProperties.okFunction();
			}
        	
        	let okButtonInput = document.getElementById("okButton");
        	if (modalProperties.btnOkLabel != undefined && modalProperties.btnOkLabel != "") okButtonInput.innerHTML = modalProperties.btnOkLabel;
        	
        	if (!modalProperties.showBtnOk) okButtonInput.setAttribute("style", "display:none");
        </script>
      </div>
      
    </div>
  </div>
</div>