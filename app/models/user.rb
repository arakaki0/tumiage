class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  has_many :likes, dependent: :destroy

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end
end
