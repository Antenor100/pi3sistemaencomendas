/*  MODAL - Insere um modal a tela, podendo existir quantos quiser setados com limite de 1 aberto por vez.

    exemplo de parâmetro "modalProperties"
    {
        idModalParent: "parentModalId", //Id do elemento que o modal será inserido
        title: "Informações da tela de exemplo", //String contendo titulo do modal
        body: "corpo do modal", //Aqui pode ser informado um DOM Element ou uma string comum
        okFunction: undefined, //Função chamada ao clickar no botão ok da modal
        cancelFunction: undefined, //Função chamada ao clickar no botão cancel da modal
        showBtnOk: false, //Booleano que seta se mostra botão ok
        btnOkLabel: "", //String contendo descrição do botão ok
        showBtnCancel: true, //Booleano que seta se mostra botão cancel
        btnCancelLabel: "Fechar", //String contendo descrição do botão cancel
        closeOnOK: true //Booleano que seta se o modal se fechará após clickar no botão ok
    }

    Obs: para criar um modal deve ser feito um addeventlistener que observa o evento de click do botão que abrirá o modal e quando 
    o evento de click for capturado deve-se executar a função novoModal() passando um objeto (modalProperties) como parâmetro.
*/

var cancelFunction = undefined;
var okFunction = undefined;

function novoModal(modalProperties) {
    appendModal(modalProperties);
    initModal();
}

function initModal() {
    $('#modalId').modal({backdrop: "static", keyboard: false});
    $('#modalId').modal('show');
}

function closeModal(action) {
    if(cancelFunction && action == "cancel") cancelFunction();
    $('#modalId').modal('hide');
    document.getElementById("modalId").remove();
}

function successModal(closeOnOk) {
    okFunction();
    if(closeOnOk) closeModal(); 
}

function appendModal(modalProperties) {
    //Elements
    let divModal = document.createElement("div"); 
        divModal.setAttribute("class", "modal fade text-dark");
        divModal.setAttribute("id", "modalId");
        divModal.setAttribute("tabIndex", "-1");
        divModal.setAttribute("role", "dialog");
        divModal.setAttribute("aria-labelledby", "TituloModalLongoExemplo");
        divModal.setAttribute("aria-hidden", "true");

    let divModalDialog = document.createElement("div");
        divModalDialog.setAttribute("class", "modal-dialog");
        divModalDialog.setAttribute("role", "document");

    let divModalContent = document.createElement("div");
        divModalContent.setAttribute("class", "modal-content");

    let divModalHeader = document.createElement("div");
        divModalHeader.setAttribute("class", "modal-header");

    let h5ModalTitle = document.createElement("h5");
        h5ModalTitle.setAttribute("class", "modal-title");
            h5ModalTitle.innerHTML = modalProperties.title;

    let buttonCloseModal = document.createElement("button");
        buttonCloseModal.setAttribute("type", "button");
        buttonCloseModal.setAttribute("class", "close");
        buttonCloseModal.setAttribute("onclick", "closeModal('close')");
        buttonCloseModal.setAttribute("area-label", "Fechar");

    let spanCloseIcon = document.createElement("span");
        spanCloseIcon.setAttribute("aria-hidden", "true");
            spanCloseIcon.innerHTML = "&times;";

    let divModalBody = document.createElement("div");
        divModalBody.setAttribute("class", "modal-body");
        if (typeof(modalProperties.body) == "object") {
            divModalBody.appendChild(modalProperties.body);
        } else {
            divModalBody.innerHTML = modalProperties.body;
        }

    let divModalFooter = document.createElement("div");
        divModalFooter.setAttribute("class", "modal-footer");

    let buttonCancelModal = document.createElement("button");
        buttonCancelModal.setAttribute("type", "button");
        buttonCancelModal.setAttribute("class", "btn btn-secondary");
        buttonCancelModal.setAttribute("onclick", "closeModal('cancel')");
            buttonCancelModal.innerHTML = "Fechar";
            if (modalProperties.btnCancelLabel != undefined) {
                 buttonCancelModal.innerHTML = modalProperties.btnCancelLabel
            }
            (!modalProperties.showBtnCancel) ? buttonCancelModal.setAttribute("style", "display: none") : undefined;
            (modalProperties.cancelFunction) ? cancelFunction = modalProperties.cancelFunction : undefined;

    let buttonOkModal = document.createElement("button");
		buttonOkModal.setAttribute("id", "okButton");
        buttonOkModal.setAttribute("type", "button");
        buttonOkModal.setAttribute("class", "btn btn-primary");
        buttonOkModal.setAttribute("onclick", `successModal(${(modalProperties.closeOnOK) ? true : false})`);
            buttonOkModal.innerHTML = "Salvar mudanças"
            if (modalProperties.btnOkLabel != undefined) {
                buttonOkModal.innerHTML = modalProperties.btnOkLabel
            }
            (!modalProperties.showBtnOk) ? buttonOkModal.setAttribute("style", "display: none") : undefined;
            (modalProperties.okFunction) ? okFunction = modalProperties.okFunction : undefined;

    //appending elements
    divModal.appendChild(divModalDialog);
        divModalDialog.appendChild(divModalContent);
            divModalContent.appendChild(divModalHeader);
                divModalHeader.appendChild(h5ModalTitle);
                divModalHeader.appendChild(buttonCloseModal);
                    buttonCloseModal.appendChild(spanCloseIcon);
            divModalContent.appendChild(divModalBody);
            divModalContent.appendChild(divModalFooter);
                divModalFooter.appendChild(buttonCancelModal);
                divModalFooter.appendChild(buttonOkModal);
    
    document.getElementById(modalProperties.idModalParent).appendChild(divModal);
}