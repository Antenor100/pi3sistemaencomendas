function populaTabela() {
	//Adiciona nova coluna no header da tabela
	tableObject.columns.forEach((column, index) => {
	    let newHr = document.createElement("th");
	    newHr.setAttribute("abbr", column);
	    newHr.innerHTML = tableObject.columnsDescricao[index];
	    document.getElementById("tableHeadRow").appendChild(newHr);
	});
	
	//Adiciona nova linha ao body da tabela
	tableObject.registros.forEach((row, index) => {
	    let newTr = document.createElement("tr");
	
	    row.forEach(rowColumnData => {
	        let newTd = document.createElement("td");
	        newTd.innerHTML = rowColumnData;
	        newTr.appendChild(newTd);
	    }); 
		
		document.getElementById("tableBody").appendChild(newTr);
	});
};