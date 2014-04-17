require 'spec_helper'

describe 'commenting on posts' do

  before do 
    rivka = create(:rivka)
    create(:post, user: rivka)
  end

  it 'begins with no comments' do
    visit '/posts'
    expect(page).to have_content '0 comments'
  end

  it 'adds the new comment' do
    visit '/posts'
    click_link 'Add a comment'
    fill_in 'Comment', with: 'What a great picture'
    click_button 'Create Comment'

    expect(page).to have_content '1 comment'
  end
  
end