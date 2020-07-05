//Funções e variaveis responsaveis pelo controle de expansão do leftSideNav
var sideNavFechado = true;
var tamanhoSideNavContentOpen = "col-12"
var tamanhoSideNavContentClose = "col-7"

function controlaExpansaoSideNav() {
    let iconExpansao = document.getElementById("iconeExpansao");
    let sideNav = document.getElementById("leftSideNav");
    let logoHomeSideNav = document.getElementById("logoHomeSideNav");
	let sideNavContent = document.getElementById("sideNavContent");
	let divIconeExpansao = document.getElementById("divIconeExpansao");
    
    let sideNavClass = sideNav.getAttribute("class");
    let srcLogoHomeSideNav = logoHomeSideNav.getAttribute("src");
    let iconExpansaoClass = iconExpansao.getAttribute("class");
	let sideNavContentClass = sideNavContent.getAttribute("class"); 
	let divIconeExpansaoClass = divIconeExpansao.getAttribute("class");
    
    let sideNavCloseStringClass = "leftSideBarStyleClose";
    let sideNavOpenStringClass = "leftSideBarStyleOpen";
    let logoSideNavCloseString = "iconebrancosemfundo";
    let logoSideNavOpenString = "bannerBranco";
    let iconExpansaoCloseClass = "fa-angle-right";
    let iconExpansaoOpenClass = "fa-angle-left";
	let divIconeExpansaoClassClose = "divIconeExpansaoClose";
    let divIconeExpansaoClassOpen = "divIconeExpansaoOpen";
    let sideNavContentVisibilityClose = "hidden";
    let sideNavContentVisibilityOpen = "unset";

    if (sideNavFechado) {
        sideNav.setAttribute("class", sideNavClass.replace(sideNavCloseStringClass, sideNavOpenStringClass));
        logoHomeSideNav.setAttribute("src", srcLogoHomeSideNav.replace(logoSideNavCloseString, logoSideNavOpenString));
        iconeExpansao.setAttribute("class", iconExpansaoClass.replace(iconExpansaoCloseClass, iconExpansaoOpenClass));
		sideNavContent.setAttribute("class", sideNavContentClass.replace(tamanhoSideNavContentClose, tamanhoSideNavContentOpen));
        divIconeExpansao.setAttribute("class", divIconeExpansaoClass.replace(divIconeExpansaoClassClose, divIconeExpansaoClassOpen));	
        changeSideNavArrowPosition();
        sideNavContent.setAttribute("style", `visibility: ${sideNavContentVisibilityOpen}`);
		
        sideNavFechado = false;

    } else {
        sideNav.setAttribute("class", sideNavClass.replace(sideNavOpenStringClass, sideNavCloseStringClass));
        logoHomeSideNav.setAttribute("src", srcLogoHomeSideNav.replace(logoSideNavOpenString, logoSideNavCloseString));
        iconeExpansao.setAttribute("class", iconExpansaoClass.replace(iconExpansaoOpenClass, iconExpansaoCloseClass));
		sideNavContent.setAttribute("class", sideNavContentClass.replace(tamanhoSideNavContentOpen, tamanhoSideNavContentClose));
		divIconeExpansao.setAttribute("class", divIconeExpansaoClass.replace(divIconeExpansaoClassOpen, divIconeExpansaoClassClose))
        changeSideNavArrowPosition();
        sideNavContent.setAttribute("style", `visibility: ${sideNavContentVisibilityClose}`);
		
        sideNavFechado = true;
    }
}

function changeSideNavArrowPosition() {
    let sideNav = document.getElementById("leftSideNav");
    if (!document.getElementById("sideNavContent").getAttribute("class").includes(tamanhoSideNavContentClose)) {
        divIconeExpansao.setAttribute("style", `left:${sideNav.clientWidth}px`);
    } else {
        divIconeExpansao.setAttribute("style", ``);
    }
}

//Funções e variaveis responsaveis pelo menu de telas do leftSideNav
var objetosGruposTelas = {};

function habilitaTelasGrupo(idGrupoAlvo) {
    if (objetosGruposTelas[idGrupoAlvo] == undefined) {
        objetosGruposTelas[idGrupoAlvo] = {};
        objetosGruposTelas[idGrupoAlvo].fechado = true;
    }
    
    let elementGrupoAlvo = document.getElementById(idGrupoAlvo); 
    let styleGrupoAlvo =  document.getElementById(idGrupoAlvo).getAttribute("style");
   
    if (objetosGruposTelas[idGrupoAlvo].fechado) {
        elementGrupoAlvo.setAttribute("style", styleGrupoAlvo.replace("display: none", "display: unset"));
        objetosGruposTelas[idGrupoAlvo].fechado = false;
    
    } else {
        elementGrupoAlvo.setAttribute("style", styleGrupoAlvo.replace("display: unset", "display: none"));
        objetosGruposTelas[idGrupoAlvo].fechado = true;
    }
}