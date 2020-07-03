var interval = setInterval(() => {
	let contentBox = document.getElementById("contentBox");
	let content = document.getElementById("content");

	if (contentBox != undefined && content != undefined) {
		contentBox.innerHTML = "";
		contentBox.append(content);
		paraInterval();	
	}
}, 100);

interval;

function paraInterval() {
	clearInterval(interval);
}