/* 
	CRUDTABLE
	
	var tableObject3 = {
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
						["1", "antenor", "1334", "antenor@gmail.com", "Gerente"],
						["3", "meire", "4331", "meire@gmail.com", "Administrador"],
						["3", "caua", "6548", "caua@gmail.com", "Produção"],
						["4", "miguel", "7894", "miguel@gmail.com", ""],
					]
				};
*/

/*FUNCOES DA TABLE*/
var selectedRowElement3 = undefined;

function populaTabela3(filterValue, descriptionFieldfilterOption) {
	//Adiciona nova coluna no header da tabela, caso exista não faz nada
	let tableHeadElement = document.getElementById("tableHeadRow3");

	if (tableHeadElement.innerHTML == "") {
		tableObject3.columns.forEach((column, index) => {
			let newHr = document.createElement("th");
			newHr.setAttribute("abbr", column);
			newHr.innerHTML = tableObject3.columnsDescricao[index];
			tableHeadElement.appendChild(newHr);
		});
	}
	
	//Adiciona nova linha ao body da tabela, caso exista algo no table body, será excluido
	let tableBody = document.getElementById("tableBody3");

	if (tableBody.innerHTML != "") {
		tableBody.innerHTML = "";
	}

	if (tableObject3.values.length > 0) {
		tableObject3.values.forEach((row) => {
			let insereLinha = filtraRegistro3(row, filterValue, descriptionFieldfilterOption);

			if (insereLinha) {
				let newTr = document.createElement("tr");
				newTr.setAttribute("onclick", "selectNewRow3(this)");
				newTr.setAttribute("class", "noSelectedRow");
			
				row.forEach((rowColumnData, index) => {
					let newTd = document.createElement("td");

					if (tableObject3.columnsDataType[index] == "checkbox") {
						if (rowColumnData == 1) {
							newTd.innerHTML = "Sim";
						} else if (rowColumnData == 0){
							newTd.innerHTML = "Não";
						}
						
						newTr.appendChild(newTd);
					
					} else if (tableObject3.columnsDataType[index] == "password") {
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
};

//Troca classes de estilo e seta o valor da variavel selectedRowElement3 com o elemento da linha selecionada
function selectNewRow3(element) {
	if (selectedRowElement3 != undefined) {
		selectedRowElement3.setAttribute("class", selectedRowElement3.getAttribute("class").replace("selectedRow", "noSelectedRow"));
	}

	if (selectedRowElement3 == element) {
		selectedRowElement3.setAttribute("class", selectedRowElement3.getAttribute("class").replace("selectedRow", "noSelectedRow"));
		selectedRowElement3 = undefined;
		return;
	}

	selectedRowElement3 = element;

	selectedRowElement3.setAttribute("class", selectedRowElement3.getAttribute("class").replace("noSelectedRow", "selectedRow"));
}

function getSelectedRowPkValue3() {
	let iteracaoSelectedRow = selectedRowElement3.children;

	for (let i = 0; i < iteracaoSelectedRow.length; i++) {
		if (tableObject3.columns[i] == tableObject3.pkField) {
			return iteracaoSelectedRow[i].innerHTML;
		}
	}
}

/*FUNCOES DO FILTRO*/
//Retorna se deve inserir a linha ou não, dependendo do valor contido no campo de filtro.
function filtraRegistro3(row, filterValue, descriptionFieldfilterOption) {
	if (filterValue != undefined && filterValue != "") {
		let indexDescription = tableObject3.columnsDescricao.indexOf(descriptionFieldfilterOption);

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
function populaFilterSelect3() {
	let selectTagElement = document.getElementById("filterOptions3");

	let optionElementDefault = document.createElement("option");
	optionElementDefault.innerHTML = "Campo à filtrar";
	optionElementDefault.setAttribute("selected", "");
	selectTagElement.appendChild(optionElementDefault);

	tableObject3.columnsDescricao.forEach(descricao => {
		let optionElement = document.createElement("option");
		optionElement.innerHTML = descricao;
		selectTagElement.appendChild(optionElement);
	});
}

function vinculaListenerOnFilter3() {
	document.getElementById("filtroInput3").addEventListener('input', function() {
		let opcaoCampoFilter = document.getElementById("filterOptions3").value;
		populaTabela3(this.value, opcaoCampoFilter);
	});

	document.getElementById("filterOptions3").addEventListener('change', function() {
		let filterInputValue = document.getElementById("filtroInput3").value;
		populaTabela3(filterInputValue, this.value);
	});
}

/*FUNCOES DOS BOTOES DE CRUD*/
var modalProperties = undefined;

function adicionar3() {
	novoModal({
		idModalParent: "divModals3",
		title: "Adicionar novo registro",
		body: createFormWithSelectedRowFields3(false),
		okFunction: addEventListerToOKButton3("create"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Adicionar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}				

function remover3() {
	if (selectedRowElement3 == undefined) {
		confirm("Para remover um registro é necessário seleciona-lo na tabela!");	
		return;
	}
	
	let indexPkField = tableObject3.columns.indexOf(tableObject3.pkField);
	let descricaoPkField = tableObject3.columnsDescricao[indexPkField];
	let valorPkField = selectedRowElement3.children[indexPkField].innerHTML;
	
	novoModal({
		idModalParent: "divModals3",
		title: "Remover registro selecionado",
		body: createFormWithSelectedRowFields3(true, true, `Deseja realmente remover o registro de '${descricaoPkField} = ${valorPkField}' da base de dados?`),
		okFunction: addEventListerToOKButton3("delete"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Remover",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}

function editar3() {
	if (selectedRowElement3 == undefined) {
		confirm("Para editar um registro é necessário seleciona-lo na tabela!");	
		return;
	}

	novoModal({
		idModalParent: "divModals3",
		title: "Editar registro selecionado",
		body: createFormWithSelectedRowFields3(true),
		okFunction: addEventListerToOKButton3("update"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Editar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}

function recarregar3() {
	document.location.reload(true);
}

//Cria o form colocado no corpo dos modais dos botões de crud
function createFormWithSelectedRowFields3(ehEdicao, ehRemocao = false, msg = undefined) {
	let formElement = document.createElement("form");
	formElement.setAttribute("id", `formId`);
	formElement.setAttribute("action", tableObject3.contextPath + tableObject3.servletClassName);
	formElement.setAttribute("method", "post");

	if (!ehRemocao) {
		let arrayIteracaoCampos;

		if (ehEdicao) {
			if (selectedRowElement3.children != undefined) {
				arrayIteracaoCampos = selectedRowElement3.children;
			}
		} else {
			arrayIteracaoCampos = tableObject3.columns;
		}

		for (let i = 0; i < arrayIteracaoCampos.length; i++) {
			//Implementação para não apresentar o campo Pk da grid nos forms de adicionar e edição
			if (tableObject3.columns[i] == tableObject3.pkField) continue; 

			let divFormGroup = document.createElement("div");
			divFormGroup.setAttribute("class", "form-group");

			let labelInputField = document.createElement("label");
			labelInputField.setAttribute("for", `input${i}`);
			labelInputField.innerHTML = tableObject3.columnsDescricao[i];

			let inputRowChild = document.createElement("input");
			inputRowChild.setAttribute("id", `input${i}`);
			inputRowChild.setAttribute("name", tableObject3.columns[i]);
			inputRowChild.setAttribute("type", tableObject3.columnsDataType[i]);

			if (tableObject3.columnsDataType[i] == "checkbox") {
				if (arrayIteracaoCampos[i].innerHTML == "Não") {
					inputRowChild.removeAttribute("checked");

				} else if (arrayIteracaoCampos[i].innerHTML == "Sim") {
					inputRowChild.setAttribute("checked", "checked");

				} else {
					inputRowChild.removeAttribute("checked");
				}

			} else if(tableObject3.columnsDataType[i] == "datetime-local") {
				let sqlTime = arrayIteracaoCampos[i].innerHTML;
				if (sqlTime != undefined) {
					let arrayDataTime = sqlTime.split(" ");
	
					let formDataValue = `${arrayDataTime[0]}T${arrayDataTime[1].substring(0, arrayDataTime[1].length-3)}`
	
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
function okFunctionBase3(operacao) {
	let formElement = document.getElementById("formId");
	
	if (formElement != undefined) {

		let jsonRequest = {
			crudTipoOperacao: operacao,
			tableName: tableObject3.tableName,
			fieldsName: [],
			fieldsValue: [],
			fieldsDataType: [],
			pkFieldName: undefined,
			pkFieldValue: undefined,
			pkFieldIsText: tableObject3.pkFieldIsText
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

				jsonRequest.fieldsDataType.push(tableObject3.columnsDataType[tableObject3.columns.indexOf(filhosForm[i].children[1].getAttribute("name"))]);
			}
		}
	
		//caso não for create a pk deve ser setada nos atributos
		if (operacao != "create") {
			jsonRequest.pkFieldName = tableObject3.pkField
			jsonRequest.pkFieldValue = getSelectedRowPkValue3();		
		}
	
		let inputWithJson = document.createElement("input");
		inputWithJson.setAttribute("name", "inputWithJson");
		inputWithJson.setAttribute("value", JSON.stringify(jsonRequest));
		inputWithJson.setAttribute("style", "display: none");
		formElement.appendChild(inputWithJson);
		
		let jspName = document.createElement("input");
		jspName.setAttribute("name", "jspName");
		jspName.setAttribute("value", tableObject3.jspName);
		jspName.setAttribute("style", "display: none");
		formElement.appendChild(jspName);

		document.getElementById("formId").submit();
	}
};


function addEventListerToOKButton3(operacao) {
	setTimeout(() => {
		document.getElementById("okButton").addEventListener("click", () => {okFunctionBase3(operacao)});
	}, 50);
}

function desvinculaBotoes3() {
	let showBtnAdd = tableObject3.mostraBotaoAdicionar;
	let showBtnRemove = tableObject3.mostraBotaoRemover;
	let showBtnEdit = tableObject3.mostraBotaoEditar;
	
	if (showBtnAdd != undefined && !showBtnAdd) {
		let btnElement = document.getElementById("btnAdicionar3");
		btnElement.remove();
	}
	
	if (showBtnEdit != undefined && !showBtnEdit) {
		let btnElement = document.getElementById("btnEditar3");
		btnElement.remove();
	}
	
	if (showBtnRemove != undefined && !showBtnRemove) {
		let btnElement = document.getElementById("btnRemover3");
		btnElement.remove();
	}
}