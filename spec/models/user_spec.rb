require 'rails_helper'

RSpec.describe User, type: :model do

  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "has a valid factory with image" do
    expect(FactoryBot.build(:user, :due_with_image)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user,username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user,email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns true with already liked" do
    user = FactoryBot.create(:user)
    post1 =FactoryBot.create(:post)
    Like.create(
      post_id: post1.id,
      user_id: user.id,
    )
    expect(user.already_liked?(post1)).to be true
  end


end
