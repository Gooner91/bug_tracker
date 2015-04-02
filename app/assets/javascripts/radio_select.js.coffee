ready = ->
  # change_bug_type()
  $('#project_developers').multiselect()
  $('.radio_group').click ->
    change_bug_type()
    
change_bug_type = ()->
  if $('#bug_bug_type_feature').is(':checked')
    options = '<option value="New">New</option><option value="Started">Started</option><option value="Completed">Completed</option>'
    $('#type_select').html options
  if $('#bug_bug_type_bug').is(':checked')
    options = '<option value="New">New</option><option value="Started">Started</option><option value="Resolved">Resolved</option>'
    $('#type_select').html options

$(document).ready ready
$(document).on 'page:load', ready


  