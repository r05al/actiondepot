$(document).ready(function() {
	$('a#add_another_file').click(event => {
		let url = "/files/new?number=" + $('#files input').length
		$.get(url,
			(data) => {
				$('#files').append(data)
			})
	});
});