
$(document).ready ->
  $('.comment-link').on 'click', (event) ->
    event.preventDefault()

    postUrl = $(this).data('post-url')
    commentArea = $(this).closest('.thumbnail').find('.comments')
    link = $(this)

    $.get postUrl, (post) ->
      if link.hasClass('clicked-once')
        commentArea.hide()
        link.removeClass('clicked-once')
      else if link.hasClass('appended')
        commentArea.show()
        link.addClass('clicked-once')
      else
        post.comments.forEach (comment) ->
          commentArea.append("<li>#{comment.content}")
        commentArea.slideDown()
        link.addClass('appended clicked-once')
        # link.addClass('clicked-once')