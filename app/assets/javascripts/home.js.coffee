# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(window).load ->
		$('#posts-container').masonry
			columnWidth: 50
			itemSelector: '.post-block'

		$(".post-block").on "mouseover", ->
			$(@).tooltip 'show'

		$("#create-post").on 'click', ->
			$("#create-modal").modal 'show'

		$(".close-modal").on 'click', (e) ->
			e.preventDefault()
			$('#create-modal').modal 'hide'

	
