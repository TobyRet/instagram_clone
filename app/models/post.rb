class Post < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    bucket: 'gangstagram-images',
  s3_credentials: {
    access_key_id: Rails.application.secrets.aws_id,
    secret_access_key: Rails.application.secrets.aws_key
  }

  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]



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
