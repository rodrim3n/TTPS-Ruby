# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#bill_client_id").select2()
  $("#bill_person_id").select2()

  $("#new_person").on("ajax:success", (e, data, status, xhr) ->

    response = JSON.parse xhr.responseText
    $("#bill_person_id").append "<option value=#{response.person_id}>#{response.person_cui}</option>"

  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_person").append error

