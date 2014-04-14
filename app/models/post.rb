class Post < ActiveRecord::Base


	attr_accessor :picture_file_name
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

end
