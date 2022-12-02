function generatePDF(){
	const element = document.getElementsByClassName("head");
	html12pdf()
	.from(element)
	.save();
}