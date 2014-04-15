class Post < ActiveRecord::Base

	belongs_to :user

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
	storage: :s3,
	bucket: 'instragramcloneproject',
  s3_host_name: 's3-eu-west-1.amazonaws.com',
  s3_credentials: {
    access_key_id: Rails.application.secrets[:aws_id],
    secret_access_key: Rails.application.secrets[:aws_key]  
  }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
