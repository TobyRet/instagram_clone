require 'spec_helper'

describe 'deleting posts' do
  context 'logged out' do 
  
    before do 
      create(:post)
    end
  
    describe 'attempting to delete posts' do
      it 'tells you to log in' do
        visit '/posts'
        click_link 'Delete'
        expect(page).to have_content('Sign in')
      end
    end
  end

  context 'logged in as Toby' do
    let(:toby) { create(:toby) }
      
    before do
      login_as create(:toby)
    end

    describe 'attempting to delete Rivkas post' do
      it 'displays an error' do
        rivka = create(:rivka)
        create(:post, user: rivka)
        visit '/posts'
        click_link 'Delete'
        expect(page).to have_content 'Error'
      end
    end
  
    describe 'deleting my own posts' do
      it 'removes the post' do
        visit '/posts'
        click_link 'Delete'
        expect(page).to have_content 'Successfully deleted'
        expect(page).not_to have_content 'I am a cat'
      end
    end
  end
end