/* 
	CRUDTABLE
	
	var tableObject = {
					tableName: "TGPUSU",
					columns: ["idusu", "nomeusu", "senhausu", "emailusu", "tipoUsu"],
					columnsDescricao: ["Código", "Nome", "Senha", "Email", "Desc. Tipo Usuário"],
					columnsDataType: ["integer", "text", "text", "password", "text"],
					servletClassName: "ClasseServlet.java",
					contextPath: "encomanager/",
					pkField: "idusu",
					mostraBotaoAdicionar: true,
					mostraBotaoEditar: true,
					mostraBotaoRemover: true,
					values: [
						["1", "antenor", "1324", "antenor@gmail.com", "Gerente"],
						["2", "meire", "4321", "meire@gmail.com", "Administrador"],
						["3", "caua", "6548", "caua@gmail.com", "Produção"],
						["4", "miguel", "7894", "miguel@gmail.com", ""],
					]
				};
*/

/*FUNCOES DA TABLE*/
var selectedRowElement = undefined;

function populaTabela(filterValue, descriptionFieldfilterOption) {
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

	if (tableObject.values.length > 0) {
		tableObject.values.forEach((row) => {
			let insereLinha = filtraRegistro(row, filterValue, descriptionFieldfilterOption);

			if (insereLinha) {
				let newTr = document.createElement("tr");
				newTr.setAttribute("onclick", "selectNewRow(this)");
				newTr.setAttribute("class", "noSelectedRow");
			
				row.forEach((rowColumnData, index) => {
					let newTd = document.createElement("td");

					if (tableObject.columnsDataType[index] == "checkbox") {
						if (rowColumnData == 1) {
							newTd.innerHTML = "Sim";
						} else if (rowColumnData == 0){
							newTd.innerHTML = "Não";
						}
						
						newTr.appendChild(newTd);
					
					} else if (tableObject.columnsDataType[index] == "password") {
						newTd.innerHTML = "**********";
						newTr.appendChild(newTd);

					} else {
						newTd.innerHTML = rowColumnData;
						newTr.appendChild(newTd);
					}

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
	
	//Analiza se existe index para selecionar linha
	if (tableObject.selectedRowIndex != null) setSelectedRowByIndex(tableObject.selectedRowIndex);
};

function getSelectedRowIndex() {
	let pkLinhaSelecionada = getSelectedRowPkValue();

	let tableBodyChildren = document.getElementById("tableBody").children;

	for (let i = 0; i < tableBodyChildren.length; i++) {
		let rowChildren = tableBodyChildren[i].children;

		let indexPkValue = tableObject.columns.indexOf(tableObject.pkField);
		
		let valueTdPk = rowChildren[indexPkValue].innerHTML;
					
		if (pkLinhaSelecionada == valueTdPk) {
			return i;
		}
	}
}

function setSelectedRowByIndex(index) {
	let tableBodyChildren = document.getElementById("tableBody").children;

	for (let i = 0; i < tableBodyChildren.length; i++) {
		if (i.toString() == index) {
			selectNewRow(tableBodyChildren[i]);
			return;
		}
	}
}

//Troca classes de estilo e seta o valor da variavel selectedRowElement com o elemento da linha selecionada
function selectNewRow(element) {
	if (selectedRowElement != undefined) {
		selectedRowElement.setAttribute("class", selectedRowElement.getAttribute("class").replace("selectedRow", "noSelectedRow"));
	}

	if (selectedRowElement == element) {
		selectedRowElement.setAttribute("class", selectedRowElement.getAttribute("class").replace("selectedRow", "noSelectedRow"));
		selectedRowElement = undefined;
		return;
	}

	selectedRowElement = element;

	selectedRowElement.setAttribute("class", selectedRowElement.getAttribute("class").replace("noSelectedRow", "selectedRow"));

	//Executa função ao selecionar uma linha
	if (tableObject.onSelectRowFunction != undefined) tableObject.onSelectRowFunction();
}

function getSelectedRowPkValue() {
	let iteracaoSelectedRow = selectedRowElement.children;

	for (let i = 0; i < iteracaoSelectedRow.length; i++) {
		if (tableObject.columns[i] == tableObject.pkField) {
			return iteracaoSelectedRow[i].innerHTML;
		}
	}
}

/*FUNCOES DO FILTRO*/
//Retorna se deve inserir a linha ou não, dependendo do valor contido no campo de filtro.
function filtraRegistro(row, filterValue, descriptionFieldfilterOption) {
	if (filterValue != undefined && filterValue != "") {
		let indexDescription = tableObject.columnsDescricao.indexOf(descriptionFieldfilterOption);

		let primeiroValor = row[indexDescription];
		let segundoValor = filterValue;
		
		if (typeof(primeiroValor) == "text") {
			primeiroValor = primeiroValor.toLocaleLowerCase();
		}
		
		if (typeof(segundoValor) == "text") {
			segundoValor = segundoValor.toLocaleLowerCase();
		
			if (indexDescription != -1 && primeiroValor.includes(segundoValor)) {
				return true;
			}
			
		} else if (typeof(row[indexDescription]) == "number") {
			segundoValor = new Number(segundoValor);
			
			if (indexDescription != -1 && primeiroValor == segundoValor) {
				return true;
			}
		}

		return false;
	}

	return true;
}

//Popula select tag com todos os possiveis campos de busca.
function populaFilterSelect() {
	let selectTagElement = document.getElementById("filterOptions");

	let optionElementDefault = document.createElement("option");
	optionElementDefault.innerHTML = "Campo à filtrar";
	optionElementDefault.setAttribute("selected", "");
	selectTagElement.appendChild(optionElementDefault);

	tableObject.columnsDescricao.forEach(descricao => {
		let optionElement = document.createElement("option");
		optionElement.innerHTML = descricao;
		selectTagElement.appendChild(optionElement);
	});
}

function vinculaListenerOnFilter() {
	document.getElementById("filtroInput").addEventListener('input', function() {
		let opcaoCampoFilter = document.getElementById("filterOptions").value;
		populaTabela(this.value, opcaoCampoFilter);
	});

	document.getElementById("filterOptions").addEventListener('change', function() {
		let filterInputValue = document.getElementById("filtroInput").value;
		populaTabela(filterInputValue, this.value);
	});
}

/*FUNCOES DOS BOTOES DE CRUD*/
var modalProperties = undefined;

function adicionar() {
	novoModal({
		idModalParent: "divModals",
		title: "Adicionar novo registro",
		body: createFormWithSelectedRowFields(false),
		okFunction: addEventListerToOKButton("create"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Adicionar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}				

function remover() {
	if (selectedRowElement == undefined) {
		confirm("Para remover um registro é necessário seleciona-lo na tabela!");	
		return;
	}
	
	let indexPkField = tableObject.columns.indexOf(tableObject.pkField);
	let descricaoPkField = tableObject.columnsDescricao[indexPkField];
	let valorPkField = selectedRowElement.children[indexPkField].innerHTML;
	
	novoModal({
		idModalParent: "divModals",
		title: "Remover registro selecionado",
		body: createFormWithSelectedRowFields(true, true, `Deseja realmente remover o registro de '${descricaoPkField} = ${valorPkField}' da base de dados?`),
		okFunction: addEventListerToOKButton("delete"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Remover",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}

function editar() {
	if (selectedRowElement == undefined) {
		confirm("Para editar um registro é necessário seleciona-lo na tabela!");	
		return;
	}

	novoModal({
		idModalParent: "divModals",
		title: "Editar registro selecionado",
		body: createFormWithSelectedRowFields(true),
		okFunction: addEventListerToOKButton("update"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Editar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}

function recarregar() {
	document.location.reload(true);
}

//Cria o form colocado no corpo dos modais dos botões de crud
function createFormWithSelectedRowFields(ehEdicao, ehRemocao = false, msg = undefined) {
	let formElement = document.createElement("form");
	formElement.setAttribute("id", `formId`);
	formElement.setAttribute("action", tableObject.contextPath + tableObject.servletClassName);
	formElement.setAttribute("method", "post");

	if (!ehRemocao) {
		let arrayIteracaoCampos;

		if (ehEdicao) {
			if (selectedRowElement.children != undefined) {
				arrayIteracaoCampos = selectedRowElement.children;
			}
		} else {
			arrayIteracaoCampos = tableObject.columns;
		}

		for (let i = 0; i < arrayIteracaoCampos.length; i++) {
			//Implementação para não apresentar o campo Pk da grid nos forms de adicionar e edição
			if (tableObject.columns[i] == tableObject.pkField) continue; 

			let divFormGroup = document.createElement("div");
			divFormGroup.setAttribute("class", "form-group");

			let labelInputField = document.createElement("label");
			labelInputField.setAttribute("for", `input${i}`);
			labelInputField.innerHTML = tableObject.columnsDescricao[i];

			let inputRowChild = document.createElement("input");
			inputRowChild.setAttribute("id", `input${i}`);
			inputRowChild.setAttribute("name", tableObject.columns[i]);
			inputRowChild.setAttribute("type", tableObject.columnsDataType[i]);

			if (tableObject.columnsDataType[i] == "checkbox") {
				if (arrayIteracaoCampos[i].innerHTML == "Não") {
					inputRowChild.removeAttribute("checked");

				} else if (arrayIteracaoCampos[i].innerHTML == "Sim") {
					inputRowChild.setAttribute("checked", "checked");

				} else {
					inputRowChild.removeAttribute("checked");
				}

			} else if(tableObject.columnsDataType[i] == "datetime-local") {
				let sqlTime = arrayIteracaoCampos[i].innerHTML;
				if (sqlTime != undefined) {
					let arrayDataTime = sqlTime.split(" ");
	
					let formDataValue = `${arrayDataTime[0]}T${arrayDataTime[1].substring(0, arrayDataTime[1].length-2)}`
	
					inputRowChild.setAttribute("value", (ehEdicao) ? formDataValue : "");
				}

			} else {
				inputRowChild.setAttribute("value", (ehEdicao) ? arrayIteracaoCampos[i].innerHTML : "");
			}

			inputRowChild.setAttribute("class", "form-control text-center");
	
			divFormGroup.appendChild(labelInputField);
			divFormGroup.appendChild(inputRowChild);

			formElement.appendChild(divFormGroup);
		}

	} else {
		formElement.innerHTML = msg;
	}

	return formElement;
}

//Gera função do btn ok (dados para o backend)
function okFunctionBase(operacao) {
	let formElement = document.getElementById("formId");
	
	if (formElement != undefined) {

		let jsonRequest = {
			crudTipoOperacao: operacao,
			tableName: tableObject.tableName,
			fieldsName: [],
			fieldsValue: [],
			fieldsDataType: [],
			pkFieldName: undefined,
			pkFieldValue: undefined,
			pkFieldIsText: tableObject.pkFieldIsText
		}

		let filhosForm = formElement.children;

		for (let i = 0; i < filhosForm.length; i++) {
			if (filhosForm[i].children[1].getAttribute("id").includes("input")) {
				jsonRequest.fieldsName.push(filhosForm[i].children[1].getAttribute("name"));

				if (filhosForm[i].children[1].getAttribute("type") == "checkbox") {
					jsonRequest.fieldsValue.push((filhosForm[i].children[1].checked) ? true : false);
				} else {
					jsonRequest.fieldsValue.push(filhosForm[i].children[1].value);
				}	

				jsonRequest.fieldsDataType.push(tableObject.columnsDataType[tableObject.columns.indexOf(filhosForm[i].children[1].getAttribute("name"))]);
			}
		}
	
		//caso não for create a pk deve ser setada nos atributos
		if (operacao != "create") {
			jsonRequest.pkFieldName = tableObject.pkField
			jsonRequest.pkFieldValue = getSelectedRowPkValue();		
		}
	
		let inputWithJson = document.createElement("input");
		inputWithJson.setAttribute("name", "inputWithJson");
		inputWithJson.setAttribute("value", JSON.stringify(jsonRequest));
		inputWithJson.setAttribute("style", "display: none");
		formElement.appendChild(inputWithJson);
		
		let jspName = document.createElement("input");
		jspName.setAttribute("name", "jspName");
		jspName.setAttribute("value", tableObject.jspName);
		jspName.setAttribute("style", "display: none");
		formElement.appendChild(jspName);

		document.getElementById("formId").submit();
	}
};


function addEventListerToOKButton(operacao) {
	setTimeout(() => {
		document.getElementById("okButton").addEventListener("click", () => {okFunctionBase(operacao)});
	}, 50);
}

function desvinculaBotoes() {
	let showBtnAdd = tableObject.mostraBotaoAdicionar;
	let showBtnRemove = tableObject.mostraBotaoRemover;
	let showBtnEdit = tableObject.mostraBotaoEditar;
	
	if (showBtnAdd != undefined && !showBtnAdd) {
		let btnElement = document.getElementById("btnAdicionar");
		btnElement.remove();
	}
	
	if (showBtnEdit != undefined && !showBtnEdit) {
		let btnElement = document.getElementById("btnEditar");
		btnElement.remove();
	}
	
	if (showBtnRemove != undefined && !showBtnRemove) {
		let btnElement = document.getElementById("btnRemover");
		btnElement.remove();
	}
}