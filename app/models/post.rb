class Post < ActiveRecord::Base

	belongs_to :user

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
	# ,
	# storage: :s3,
	# bucket: 'S3_BUCKET_NAME',
 #  s3_credentials: {
 #    access_key_id: 'AWS_ACCESS_KEY_ID',
 #    secret_access_key: 'AWS_SECRET_ACCESS_KEY'
 #  }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
