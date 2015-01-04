require 'rails_helper'
require 'spec_helper'

RSpec.describe HomepageController, :type => :controller do

  it "shouldn't create a post if data is invalid" do
    expect{post :create}.to change(Post, :count).by(0)
  end
end
