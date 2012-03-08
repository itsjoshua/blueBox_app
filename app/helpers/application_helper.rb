module ApplicationHelper
	def title
		base_title = "Server Manager"
		@title.nil? ? base_title : "#{base_title} | #{@title}"
	end

end
