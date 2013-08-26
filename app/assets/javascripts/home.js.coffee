# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(window).load ->
		$('#posts-container').masonry
			columnWidth: 20
			itemSelector: '.post-block'

		$(".post-block").on "mouseover", ->
			$(@).tooltip 'show'

		$("#create-post").on 'click', ->
			$("#create-modal").modal 'show'

		$(".close-modal").on 'click', (e) ->
			e.preventDefault()
			$('#create-modal').modal 'hide'

		$("#new_post").on 'submit', (e) ->
			e.preventDefault()

			url = $(@).attr 'action'
			home_path = $(@).data('success')
			content = $(@).find('#post_content').val()

			$.ajax
				type: "POST"
				dataType: "json"
				url: url
				data:
					post:
						content: content
				success: (data) ->
					status = data.operation_status
					if status == 0
						$("#message").addClass('success')
						$("#message").html(data.notice)
						$("#message").show()

						window.location.href = home_path
					else
						$("#message").addClass('error')
						$("#message").html(data.alert)
						$("#message").show()
				error: (data) ->
					alert 'error'
				complete: (data) ->
					$("#post_content").val('')