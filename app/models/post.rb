class Post < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :content
  end
end
