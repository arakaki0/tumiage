require 'rails_helper'

RSpec.describe Like, type: :model do
  it "valid" do
    expect(FactoryBot.build(:like)).to be_valid
  end
end
