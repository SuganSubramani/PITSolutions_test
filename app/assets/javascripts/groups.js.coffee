# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#roles_table').DataTable()

	$('.user_field').chosen({
		width: "100%"
	})
	$('.role_field').chosen({
		width: "100%",
		search_contains: "false"
	})