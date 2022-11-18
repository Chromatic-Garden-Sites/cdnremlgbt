function hintToggle()
{
	this.classList.add("show");
	var linksInSpoiler = this.querySelectorAll("a");
	for (var i = 0; i < linksInSpoiler.length; i++)
		linksInSpoiler[i].classList.add("show");
}

function initHints()
{
	var hintNodes = document.getElementsByClassName("hint");
	for (var i = 0; i < hintNodes.length; i++)
		hintNodes[i].onclick = hintToggle;
}

window.onload = initHints;