/* 
	CRUDTABLE
	
	var tableObject2 = {
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
var selectedRowElement2 = undefined;

function populaTabela2(filterValue, descriptionFieldfilterOption) {
	//Adiciona nova coluna no header da tabela, caso exista não faz nada
	let tableHeadElement = document.getElementById("tableHeadRow2");

	if (tableHeadElement.innerHTML == "") {
		tableObject2.columns.forEach((column, index) => {
			let newHr = document.createElement("th");
			newHr.setAttribute("abbr", column);
			newHr.innerHTML = tableObject2.columnsDescricao[index];
			tableHeadElement.appendChild(newHr);
		});
	}
	
	//Adiciona nova linha ao body da tabela, caso exista algo no table body, será excluido
	let tableBody = document.getElementById("tableBody2");

	if (tableBody.innerHTML != "") {
		tableBody.innerHTML = "";
	}

	if (tableObject2.values.length > 0) {
		tableObject2.values.forEach((row) => {
			let insereLinha = filtraRegistro2(row, filterValue, descriptionFieldfilterOption);

			if (insereLinha) {
				let newTr = document.createElement("tr");
				newTr.setAttribute("onclick", "selectNewRow2(this)");
				newTr.setAttribute("class", "noSelectedRow");
			
				row.forEach((rowColumnData, index) => {
					let newTd = document.createElement("td");

					if (tableObject2.columnsDataType[index] == "checkbox") {
						if (rowColumnData == 1) {
							newTd.innerHTML = "Sim";
						} else if (rowColumnData == 0){
							newTd.innerHTML = "Não";
						}
						
						newTr.appendChild(newTd);
					
					} else if (tableObject2.columnsDataType[index] == "password") {
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

//Troca classes de estilo e seta o valor da variavel selectedRowElement2 com o elemento da linha selecionada
function selectNewRow2(element) {
	if (selectedRowElement2 != undefined) {
		selectedRowElement2.setAttribute("class", selectedRowElement2.getAttribute("class").replace("selectedRow", "noSelectedRow"));
	}

	if (selectedRowElement2 == element) {
		selectedRowElement2.setAttribute("class", selectedRowElement2.getAttribute("class").replace("selectedRow", "noSelectedRow"));
		selectedRowElement2 = undefined;
		return;
	}

	selectedRowElement2 = element;

	selectedRowElement2.setAttribute("class", selectedRowElement2.getAttribute("class").replace("noSelectedRow", "selectedRow"));
}

function getSelectedRowPkValue2() {
	let iteracaoSelectedRow = selectedRowElement2.children;

	for (let i = 0; i < iteracaoSelectedRow.length; i++) {
		if (tableObject2.columns[i] == tableObject2.pkField) {
			return iteracaoSelectedRow[i].innerHTML;
		}
	}
}

/*FUNCOES DO FILTRO*/
//Retorna se deve inserir a linha ou não, dependendo do valor contido no campo de filtro.
function filtraRegistro2(row, filterValue, descriptionFieldfilterOption) {
	if (filterValue != undefined && filterValue != "") {
		let indexDescription = tableObject2.columnsDescricao.indexOf(descriptionFieldfilterOption);

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
function populaFilterSelect2() {
	let selectTagElement = document.getElementById("filterOptions2");

	let optionElementDefault = document.createElement("option");
	optionElementDefault.innerHTML = "Campo à filtrar";
	optionElementDefault.setAttribute("selected", "");
	selectTagElement.appendChild(optionElementDefault);

	tableObject2.columnsDescricao.forEach(descricao => {
		let optionElement = document.createElement("option");
		optionElement.innerHTML = descricao;
		selectTagElement.appendChild(optionElement);
	});
}

function vinculaListenerOnFilter2() {
	document.getElementById("filtroInput2").addEventListener('input', function() {
		let opcaoCampoFilter = document.getElementById("filterOptions2").value;
		populaTabela2(this.value, opcaoCampoFilter);
	});

	document.getElementById("filterOptions2").addEventListener('change', function() {
		let filterInputValue = document.getElementById("filtroInput2").value;
		populaTabela2(filterInputValue, this.value);
	});
}

/*FUNCOES DOS BOTOES DE CRUD*/
var modalProperties = undefined;

function adicionar2() {
	novoModal({
		idModalParent: "divModals2",
		title: "Adicionar novo registro",
		body: createFormWithSelectedRowFields2(false),
		okFunction: addEventListerToOKButton2("create"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Adicionar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}				

function remover2() {
	if (selectedRowElement2 == undefined) {
		confirm("Para remover um registro é necessário seleciona-lo na tabela!");	
		return;
	}
	
	let indexPkField = tableObject2.columns.indexOf(tableObject2.pkField);
	let descricaoPkField = tableObject2.columnsDescricao[indexPkField];
	let valorPkField = selectedRowElement2.children[indexPkField].innerHTML;
	
	novoModal({
		idModalParent: "divModals2",
		title: "Remover registro selecionado",
		body: createFormWithSelectedRowFields2(true, true, `Deseja realmente remover o registro de '${descricaoPkField} = ${valorPkField}' da base de dados?`),
		okFunction: addEventListerToOKButton2("delete"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Remover",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}

function editar2() {
	if (selectedRowElement2 == undefined) {
		confirm("Para editar um registro é necessário seleciona-lo na tabela!");	
		return;
	}

	novoModal({
		idModalParent: "divModals2",
		title: "Editar registro selecionado",
		body: createFormWithSelectedRowFields2(true),
		okFunction: addEventListerToOKButton2("update"),
		cancelFunction: undefined,
		showBtnOk: true,
		btnOkLabel: "Editar",
		showBtnCancel: true,
		btnCancelLabel: "Cancelar",
		closeOnOK: true
	});
}

function recarregar2() {
	document.location.reload(true);
}

//Cria o form colocado no corpo dos modais dos botões de crud
function createFormWithSelectedRowFields2(ehEdicao, ehRemocao = false, msg = undefined) {
	let formElement = document.createElement("form");
	formElement.setAttribute("id", `formId`);
	formElement.setAttribute("action", tableObject2.contextPath + tableObject2.servletClassName);
	formElement.setAttribute("method", "post");

	if (!ehRemocao) {
		let arrayIteracaoCampos;

		if (ehEdicao) {
			if (selectedRowElement2.children != undefined) {
				arrayIteracaoCampos = selectedRowElement2.children;
			}
		} else {
			arrayIteracaoCampos = tableObject2.columns;
		}

		for (let i = 0; i < arrayIteracaoCampos.length; i++) {
			//Implementação para não apresentar o campo Pk da grid nos forms de adicionar e edição
			if (tableObject2.columns[i] == tableObject2.pkField) continue; 

			let divFormGroup = document.createElement("div");
			divFormGroup.setAttribute("class", "form-group");

			let labelInputField = document.createElement("label");
			labelInputField.setAttribute("for", `input${i}`);
			labelInputField.innerHTML = tableObject2.columnsDescricao[i];

			let inputRowChild = document.createElement("input");
			inputRowChild.setAttribute("id", `input${i}`);
			inputRowChild.setAttribute("name", tableObject2.columns[i]);
			inputRowChild.setAttribute("type", tableObject2.columnsDataType[i]);

			if (tableObject2.columnsDataType[i] == "checkbox") {
				if (arrayIteracaoCampos[i].innerHTML == "Não") {
					inputRowChild.removeAttribute("checked");

				} else if (arrayIteracaoCampos[i].innerHTML == "Sim") {
					inputRowChild.setAttribute("checked", "checked");

				} else {
					inputRowChild.removeAttribute("checked");
				}

			} else if(tableObject2.columnsDataType[i] == "datetime-local") {
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
function okFunctionBase2(operacao) {
	let formElement = document.getElementById("formId");
	
	if (formElement != undefined) {

		let jsonRequest = {
			crudTipoOperacao: operacao,
			tableName: tableObject2.tableName,
			fieldsName: [],
			fieldsValue: [],
			fieldsDataType: [],
			pkFieldName: undefined,
			pkFieldValue: undefined,
			pkFieldIsText: tableObject2.pkFieldIsText
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

				jsonRequest.fieldsDataType.push(tableObject2.columnsDataType[tableObject2.columns.indexOf(filhosForm[i].children[1].getAttribute("name"))]);
			}
		}
	
		//caso não for create a pk deve ser setada nos atributos
		if (operacao != "create") {
			jsonRequest.pkFieldName = tableObject2.pkField
			jsonRequest.pkFieldValue = getSelectedRowPkValue2();		
		}
	
		let inputWithJson = document.createElement("input");
		inputWithJson.setAttribute("name", "inputWithJson");
		inputWithJson.setAttribute("value", JSON.stringify(jsonRequest));
		inputWithJson.setAttribute("style", "display: none");
		formElement.appendChild(inputWithJson);
		
		let jspName = document.createElement("input");
		jspName.setAttribute("name", "jspName");
		jspName.setAttribute("value", tableObject2.jspName);
		jspName.setAttribute("style", "display: none");
		formElement.appendChild(jspName);

		document.getElementById("formId").submit();
	}
};


function addEventListerToOKButton2(operacao) {
	setTimeout(() => {
		document.getElementById("okButton").addEventListener("click", () => {okFunctionBase2(operacao)});
	}, 50);
}

function desvinculaBotoes2() {
	let showBtnAdd = tableObject2.mostraBotaoAdicionar;
	let showBtnRemove = tableObject2.mostraBotaoRemover;
	let showBtnEdit = tableObject2.mostraBotaoEditar;
	
	if (showBtnAdd != undefined && !showBtnAdd) {
		let btnElement = document.getElementById("btnAdicionar2");
		btnElement.remove();
	}
	
	if (showBtnEdit != undefined && !showBtnEdit) {
		let btnElement = document.getElementById("btnEditar2");
		btnElement.remove();
	}
	
	if (showBtnRemove != undefined && !showBtnRemove) {
		let btnElement = document.getElementById("btnRemover2");
		btnElement.remove();
	}
}