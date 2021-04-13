require 'rails_helper'

RSpec.describe Post, type: :model do
  # user_id,contentがあれば有効な状態であること
  it "is valid with user_id, content" do
    expect(FactoryBot.build(:post)).to be_valid
  end

  # contentがなければ無効な状態であること
  it "is invalid without the content" do
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end
  # user_idがなければ無効な状態であること
  it "is invalid without a user_id" do
    post = FactoryBot.build(:post, user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("can't be blank")
  end
  # contentが141字以上なら無効な状態であること
  it "is invalid with content of 141 characters or more" do
    post = FactoryBot.build(:post, content: "a" * 141)
    expect(post).to be_invalid
  end
end
