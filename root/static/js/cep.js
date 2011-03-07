
$(function() {
	$('.error').hide();
	$('#cep_view').hide();


	$('.button').click( function(value) {
		var cep = $('#cep').val();
		if (cep == "") {
			$('#cep_view').hide();
			return false;
		}

		var url_string = "/api/" + cep;

		$.getJSON(url_string, 
			function (data) {
				htm = "Bairro: " + data.cep.bairro + "<br/>\n";
				htm = htm + "Cidade: " + data.cep.cidade + "<br/>\n";
				htm = htm + "Esado: "+ data.cep.uf + "<br>\n";
				htm = htm + "Logradouro: " + data.cep.logradouro + "<br>\n";				
				htm = htm + "Complemento: " + data.cep.complemento + "<br/>\n";
				$('#cep_view').html(htm);
				$('#cep_view').show();
			}
			);
		return false;
	});

});


