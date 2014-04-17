class Post < ActiveRecord::Base

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
	storage: :s3,
	bucket: 'instragramcloneproject',
  s3_host_name: 's3-eu-west-1.amazonaws.com',
  s3_credentials: {
    access_key_id: Rails.application.secrets[:aws_id],
    secret_access_key: Rails.application.secrets[:aws_key]  
  }

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  has_and_belongs_to_many :tags

  has_many :comments
  belongs_to :user

  geocoded_by :address  
  after_validation :geocode          

  def tag_names
    tags.map(&:name).join
  end

  def tag_names=(tag_names)
    tag_names.split(' ').uniq.each do |tag_name|
      tag_name.prepend('#') unless tag_name[0] == '#'
      tag = Tag.find_or_create_by(name: tag_name.downcase)
      tags << tag
      end
    end
  end
