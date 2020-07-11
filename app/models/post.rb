class Post < ApplicationRecord
    mount_uploader :img, ImgUploader

    belongs_to :user
    validates :title, presence: true
    validates :img, presence: true
end
