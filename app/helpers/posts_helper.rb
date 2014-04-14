module PostsHelper

	def timestamp(time)
		time_ago_in_words(time) + ' ago'
	end
end
