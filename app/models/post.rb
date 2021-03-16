class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  with_options presence: true do
    validates :content
  end
end
