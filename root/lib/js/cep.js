
$(function() {
	$('.error').hide();
	$('#cep_view').hide();
	$('#cep').mask('99999-999');

	$('.button').click( function(value) {
		var cep = $('#cep').val();
		if (cep == "") {
			$('#cep_view').hide();
			return false;
		}
		jQuery('#activity_pane').showLoading();
		var url_string = "/api/" + cep;

		$.getJSON(url_string, 
			function (data) {
				htm = "<b>Bairro:</b> " + data.cep.bairro + "<br/>\n";
				htm = htm + "<b>Cidade:</b> " + data.cep.cidade + "<br/>\n";
				htm = htm + "<b>Estado:</b> "+ data.cep.uf + "<br>\n";
				htm = htm + "<b>Logradouro:</b> " + data.cep.logradouro + "<br>\n";				
				htm = htm + "<b>Complemento:</b>" + data.cep.complemento + "<br/>\n";
				$('#cep_view').html(htm);
				$('#cep_view').show();
				jQuery('#activity_pane').hideLoading();
			}
			);
		return false;
	});

});


