# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#bill_client_id").select2()
  $("#bill_person_id").select2()

  $("#new-person-form").on("ajax:success", (e, data, status, xhr) ->

    response = JSON.parse xhr.responseText
    $("#bill_person_id").append "<option value=#{response.person.id}>#{response.person.cui}</option>"
    $("#modal-partial-msgs").text "La persona fue creada con exito"
    $("#modal-partial-msgs").addClass('alert alert-success').removeClass('alert-danger')
    $("#new-person-form").remove();

  ).on "ajax:error", (e, xhr, status, error) ->
    response = JSON.parse xhr.responseText
    errors = []
    errors.push('CUIT/CUIL '+response.errors.cui) if response.errors.cui
    errors.push('Nombre '+response.errors.name) if response.errors.name

    $("#modal-partial-msgs").addClass("alert alert-danger")

    for k,error of errors
      $("#modal-partial-msgs").append("<p>"+error+"</p>")

