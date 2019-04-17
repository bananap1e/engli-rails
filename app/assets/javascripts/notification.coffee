$(document).on 'ready turbolinks:change turbolinks:load', ->
  if (window.location.pathname == '/notification')
    $.ajax '/notification/read_all',
      type: 'PUT'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log('Something went wrong')
      success: (data, textStatus, jqXHR) ->
        alert('Successful updated')