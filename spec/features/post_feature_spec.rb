require 'spec_helper'

describe 'uploading photos' do

  context 'on the pictures page' do

    before do
      create(:post1)
      visit '/posts'
    end

    xit 'should display a picture' do
      expect(page).to have_css 'img.uploaded-pic'
    end

    it "shows the user who posted it" do
      expect(page).to have_content 'user1'
    end

    it "shows the timestamp" do
      expect(page).to have_content 'less than a minute'
    end

    it "deletes a post" do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'sss'
    end
  end

  context "while logged out" do

    it "shouldnt be able to create a post" do
      visit '/posts/new'
      expect(page).to have_content "You need to sign in"
    end
  end

end

describe "tagging" do
  before do
    create(:post1)
    create(:post2)
    visit '/posts'
  end

  it 'adds tags with post' do
    expect(page).to have_content '#kitten #cute'
  end
  it 'clicking on a tag filters posts by tag' do
    click_link '#kitten'
    expect(page).to have_content 'Testing a kitten'
  end
  it 'does not show photos withot a tag when filtering' do
    click_link '#kitten'
    expect(page).not_to have_content 'sss'
  end

  it 'uses a pretty URL' do
    click_link '#kitten'
    expect(current_path).to eq '/tags/kitten'
  end
end
