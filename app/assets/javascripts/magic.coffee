ready = ->
  toggleNav = ->
    if $('.navigation').hasClass('show')
      # Do things on Nav Close
      $('.navgation').removeClass 'show'
      $('#jquery_jplayer_menu').jPlayer('stop');
    else
      # Do things on Nav Open
      $('.navigation').addClass 'show'
      $('#jquery_jplayer_menu').jPlayer('play');
    return
  toggleAbout = ->
    if $('.about').hasClass('show')
      # Do things on Nav Close
      $('.about').removeClass 'show'
      $('.navigation').removeClass 'show'
    else
      # Do things on Nav Open
      $('.about').addClass 'show'
      $('.navigation').removeClass 'show'
    return
  menuAnimation = ->
    videomp4 = "<%= asset_path('menu.mp4') %>"
    videowebm = "<%= asset_path('menu.webm') %>"
    videojpg = "<%= asset_path('menu.jpg') %>"
    $('#jquery_jplayer_menu').jPlayer
      ready: ->
        $(this).jPlayer('setMedia',
          m4v: videomp4
          webmv: videowebm
          poster: videojpg).jPlayer 'play'
        return
      swfPath: '/js'
      supplied: 'webmv, mp4'
      loop: true
      muted: true
  $ ->
    $(document).on 'page:change', ->
      $('#primary-content').addClass 'animated'
      $('#primary-content').addClass 'fadeInUp'

      return
    $(document).on 'page:fetch', ->
      $('#primary-content').addClass 'animated'
      $('#primary-content').addClass 'fadeOutUp'
      return

    # Toggle Nav on Click
    $('.toggle-nav').click (event) ->
      # Calling a function in case you want to expand upon this.
      event.preventDefault()
      toggleNav()
      return
    return
    $('.toggle-about').click (event) ->
      # Calling a function in case you want to expand upon this.
      event.preventDefault()
      toggleAbout()
      return
    return
$(document).ready(ready);
$(document).on('page:load', ready);