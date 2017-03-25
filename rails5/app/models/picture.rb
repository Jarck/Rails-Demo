class Picture < ApplicationRecord
  validates_presence_of :image

  belongs_to :user

  # 图片
  mount_uploaders :image, AvatarUploader
end
