module ApplicationHelper

	def t(page_title)
		content_for :title do
			if page_title
				"Q-Wall | #{page_title}"
			else
				"Q-Wall"
			end
		end
	end

	def g(user, klazz, options={})
		options[:default] = 'https://assets.github.com/images/gravatars/gravatar-140.png'
		gravatar_image_tag(user.email, title:user.username, class:klazz, gravatar: options)
	end
	
end
