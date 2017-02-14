function displayPubli(publi, id, mpandef)
{
	var div=document.getElementById("postContainer");
	div.innerHTML=
		"<div class=\"row\" id=\""+id+"\">" +
			"<div class=\"col-md-1\">" +
				"<img src=\"http://localhost/ITUBook/assets/img/1.png\" style=\"width:60px\"/>" +
			"</div>" +
			"<div class=\"col-md-11\">" +
				"<h4 class=\"nom\">"+ mpandef+ "</h4>" +
				"<p>"+ publi +"</p>"+
			"</div>" +
		"</div>"
	
}
$(document).ready(function(){
	$("#poster").click(function(){
		var stat=document.getElementById('contentPost').value;
		console.log(stat);
		$.ajax({
			url :'http://localhost/OneDay/User/poster',
			type : 'POST',
			data : {st: stat},
			dataType : 'json',
			success : function(valn, statut){
				displayPubli(valn[0].contenuQuestion, valn[0].idQuestion, valn[0].loginMembre);
			},

			error : function(valn, statut, erreur){
				console.log(valn);
				console.log(statut);
				console.log(erreur);
			},
		});				   
	});
});