ready = ->
  toggleNav = ->
    if $('.navigation').hasClass('show')
      # Do things on Nav Close
      $('.navgation').removeClass 'show'
    else
      # Do things on Nav Open
      $('.navigation').addClass 'show'
    return

  $ ->

    # Toggle Nav on Click
    $('.toggle-nav').click (event) ->
      # Calling a function in case you want to expand upon this.
      event.preventDefault()
      toggleNav()
      return
    return
$(document).ready(ready);
$(document).on('page:load', ready);