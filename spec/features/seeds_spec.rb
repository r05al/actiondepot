require 'rails_helper'

feature "Seed Data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    user = User.where(email: "admin@example.com").first!
    product = Product.where(title: "Reviewer Beta").first!
  end
end
