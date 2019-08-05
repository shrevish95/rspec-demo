require 'rails_helper'

describe 'navigate' do
  describe 'index #GET' do
    it 'can reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe "new #GET" do
    it 'has new form that can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "create #Post" do
    it 'can create new post' do
      visit new_post_path

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "rationale content"

      click_on "Save"

      expect(page).to have_content("rationale content")
    end
  end
end