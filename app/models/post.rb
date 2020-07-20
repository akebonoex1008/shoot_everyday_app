class Post < ApplicationRecord
    mount_uploader :img, ImgUploader

		belongs_to :user
		has_many :likes, dependent: :destroy
		has_many :like_users, through: :likes, source: :user
		has_many :comments, dependent: :destroy

    validates :title, presence: true
		validates :img, presence: true
		validates :user_id, presence: true

		#　投稿をいいねする
		def like(user)
			likes.create(user_id: user.id)
		end

		# 投稿のいいねを解除する
		def unlike(user)
			likes.find_by(user_id: user.id).destroy
		end

		def like?(user)
			like_users.include?(user)
		end
end
