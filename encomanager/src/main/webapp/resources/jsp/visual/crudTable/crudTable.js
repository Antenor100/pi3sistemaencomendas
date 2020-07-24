/* FUNCOES DA TABLE */
var selectRowElement = undefined;

function populaTabela(filterValue) {
	//Adiciona nova coluna no header da tabela, caso exista não faz nada
	let tableHeadElement = document.getElementById("tableHeadRow");

	if (tableHeadElement.innerHTML == "") {
		tableObject.columns.forEach((column, index) => {
			let newHr = document.createElement("th");
			newHr.setAttribute("abbr", column);
			newHr.innerHTML = tableObject.columnsDescricao[index];
			tableHeadElement.appendChild(newHr);
		});
	}
	
	//Adiciona nova linha ao body da tabela, caso exista algo no table body, será excluido
	let tableBody = document.getElementById("tableBody");

	if (tableBody.innerHTML != "") {
		tableBody.innerHTML = "";
	}

	if (tableObject.registros.length > 0) {
		tableObject.registros.forEach((row) => {
			let insereLinha = filtraRegistro(row, filterValue);

			if (insereLinha) {
				let newTr = document.createElement("tr");
				newTr.setAttribute("onclick", "selectNewRow(this)");
				newTr.setAttribute("class", "noSelectedRow");
			
				row.forEach(rowColumnData => {
					let newTd = document.createElement("td");
					newTd.innerHTML = rowColumnData;
					newTr.appendChild(newTd);
				}); 
				
				tableBody.appendChild(newTr);

			}
		});

		let existeUmAviso = (document.getElementsByClassName("tableDivAlert").length > 0) ? true : false ;

		if (tableBody.children.length < 1 && !existeUmAviso) {
			let divAlertFilterNotFound = document.createElement("div");
			divAlertFilterNotFound.setAttribute("class", "tableDivAlert");
			divAlertFilterNotFound.innerHTML = "Nenhum registro encontrado pelo filtro!"
			tableBody.parentElement.appendChild(divAlertFilterNotFound);
		
		} else {
			if (tableBody.children.length > 0 && existeUmAviso) {
				let elementoAviso = document.getElementsByClassName("tableDivAlert");
				elementoAviso[0].remove();
			}
		}

	} else {
		let divAlertRegisterNotFound = document.createElement("div");
		divAlertRegisterNotFound.setAttribute("class", "tableDivAlert");
		divAlertRegisterNotFound.innerHTML = "Nenhum registro encontrado!"
		tableBody.parentElement.appendChild(divAlertRegisterNotFound);
	}
};

//Retorna se deve inserir a linha ou não, dependendo do valor contido no campo de filtro.
function filtraRegistro(row, filterValue) {
	if (filterValue != undefined) {
		let indexPk = tableObject.columns.indexOf(tableObject.pkField);
		let indexDescription = tableObject.columns.indexOf(tableObject.descriptionField);

		if (row[indexPk] == filterValue || row[indexDescription].includes(filterValue)) {
			return true;
		}
	
		return false;
	}

	return true;
}

//Troca classes de estilo e seta o valor da variavel selectRowElement com o elemento da linha selecionada
function selectNewRow(element) {
	if (selectRowElement != undefined) {
		selectRowElement.setAttribute("class", selectRowElement.getAttribute("class").replace("selectedRow", "noSelectedRow"));
	}

	if (selectRowElement == element) {
		selectRowElement.setAttribute("class", selectRowElement.getAttribute("class").replace("selectedRow", "noSelectedRow"));
		selectRowElement = undefined;
		return;
	}

	selectRowElement = element;

	selectRowElement.setAttribute("class", selectRowElement.getAttribute("class").replace("noSelectedRow", "selectedRow"));
}

function vinculaListenerOnFilter() {
	document.getElementById("filtroInput").addEventListener('input', function() {
		populaTabela(this.value);
	});
}

/* FUNCOES DOS BOTOES DE CRUD */
var modalProperties = undefined;

function adicionar() {
	modalProperties = {
		id: "adicionarRegistroModal",
		title: "Adicionar novo registro",
		body: adicionarModalBodyElement,
		okFunction: undefined,
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Confirmar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar"
	}

	var adicionarModalBodyElement = "a";
	$('#adicionarRegistroModal').modal('show');
}				

function remover() {
	modalProperties = {
		id: "removerRegistroModal",
		title: "Remover registro selecionado",
		body: removerModalBodyElement,
		okFunction: undefined,
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Confirmar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar"
	}

	var removerModalBodyElement = "b";
	$('#removerRegistroModal').modal('show');
}

function editar() {
	modalProperties = {
		id: "editarRegistroModal",
		title: "Editar registro selecionado",
		body: editarModalBodyElement,
		okFunction: undefined,
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Confirmar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar"
	}

	var editarModalBodyElement = "c";
	$('#editarRegistroModal').modal('show');
}

function recarregar() {

}