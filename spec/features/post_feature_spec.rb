require 'spec_helper'

describe 'post index page' do 

	context 'no posts' do
		
		it 'shows a message' do
			visit '/posts'
			expect(page).to have_content('No posts yet')
		end

	end

	context 'logged out' do

		it "shouldnt be able to create a post" do
			visit "/posts/new"
			expect(page).to have_content "You need to sign in"
		end

	end

	context 'with posts' do

		before do  
			toby = create(:toby)
    	create(:post, user: toby)
    end

		it 'displays the post' do
			visit '/posts'
			expect(page).to have_content 'I am a cat'
		end

	end

	context 'tagging' do
		
		it 'displays tags' do
			toby = create(:toby) 
			create(:post, user: toby)
			visit '/posts'
	  	expect(page).to have_content '#cat'
  	end
  	
	end

	context 'posts with tags' do
		
		before do 
			toby = create(:toby) 
			create(:post, user: toby)
			create(:post, user: toby, description: 'Hello world', tag_names: '#greeting' ) 
		end

		describe 'clicking a tag' do
			
			it 'show the photos for that tag' do 
				visit '/posts'
				click_link '#cat'
				expect(page).to have_content('I am a cat')
			end 

			it 'does not show photos without that tag' do 
				visit '/posts'
				click_link '#cat'
				expect(page).not_to have_content('Hello world')
			end

			it 'uses a pretty url' do 
				visit '/posts'
				click_link '#cute'
				expect(current_path).to eq '/tags/cute'
			end

		end
	end
end
