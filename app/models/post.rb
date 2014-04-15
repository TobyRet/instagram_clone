class Post < ActiveRecord::Base

	belongs_to :user

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
	storage: :s3,
	bucket: 'gangstagram-images',
  s3_credentials: {
    access_key_id: Rails.application.secrets[:aws_id],
    secret_access_key: Rails.application.secrets[:aws_key]
  }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
