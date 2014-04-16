require 'spec_helper'

describe 'uploading photos' do

  context 'on the pictures page' do

    before { login_as_test_user }
    before { add_post }

    xit 'should display a picture' do
      expect(page).to have_css 'img.uploaded-pic'
    end

    it "shows the user who posted it" do
      expect(page).to have_content 'dave'
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
  it 'adds tags with post' do
    login_as_test_user
    add_post_with_tags
    expect(page).to have_content '#kitten #cute'
  end
  it 'clicking on a tag filters posts by tag' do
    login_as_test_user
    add_post_with_tags
    click_link '#kitten'
    expect(page).to have_content 'Testing a kitten'
  end
  it 'does not show photos withot a tag when filtering' do
    login_as_test_user
    add_post_with_tags
    add_post
    click_link '#kitten'
    expect(page).not_to have_content 'sss'
  end

  it 'uses a pretty URL' do
    login_as_test_user
    add_post_with_tags
    click_link '#kitten'
    expect(current_path).to eq '/tags/kitten'
  end
end
