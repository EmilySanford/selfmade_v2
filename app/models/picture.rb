class Picture  < ActiveRecord::Base

  Paperclip.interpolates :user_name do |attachment, style|
    User.find(attachment.instance.user_id).name
  end

  Paperclip.interpolates :picture_type do |attachment, style|
    if attachment.instance.original_picture_id
      return "modified"
    else
      return "original"
    end
  end

  Paperclip.interpolates :original_picture_id do |attachment, style|
    if attachment.instance.original_picture_id
      return attachment.instance.original_picture_id
    else
      return attachment.instance.id
    end
  end

  has_many :modified_pictures, class_name: "Picture", foreign_key: "original_picture_id"
  belongs_to :original_picture, class_name: "Picture"

  has_attached_file :pic, :path => ":user_name/:original_picture_id/:picture_type(:style)/:id/:basename.:extension", :storage => :s3, :bucket => 'selfmadepictures', :url =>':s3_domain_url', :s3_host_alias => 'd1wa66qgcl7v1x.cloudfront.net'
 validates_attachment_content_type :pic, content_type: [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/]
  belongs_to :user
end

#
# has_attached_file :image,
#     :styles => {
#       :thumb=> "100x100#",
#       :small  => "300x300>",
#       :large => "900x900>"
#         },
#     :storage => :s3,
#     :s3_credentials => {
#       :access_key_id => ENV['S3_KEY'],
#       :secret_access_key => ENV['S3_SECRET'] },
#     :url => ':s3_alias_url',
#     :s3_host_alias => 'static.lostpetalerts.org',
#     :bucket => 'lostpetalerts',
#     :path => "images/:class/:id.:style.:extension"
