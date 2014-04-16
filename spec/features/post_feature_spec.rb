require 'spec_helper'

describe 'uploading photos' do 

	context 'on the pictures page' do
			
			before { login_as_test_user }
			before { add_post }
		
			it 'should display a picture' do
				expect(page).to have_css 'img.uploaded-pic'
			end

			it "shows the user who posted it" do
				expect(page).to have_content 'dave'
			end

			it "shows the user who posted it" do
				expect(page).to have_content 'less than a minute'
			end
		end

	context "while logged out" do

		it "shouldnt be able to create a post" do
			visit "/posts/new"
			expect(page).to have_content "You need to sign in"
		end

	end

	context 'tagging' do
		before { login_as_test_user }
		
		it 'displays tags' do
			visit '/posts/new'
	  	fill_in 'Description', with: 'miaow'
	  	fill_in 'Tags', with: '#cat, #cute'
	  	attach_file 'Picture', Rails.root.join('spec/images/kitten.jpeg')
	  	click_button 'Post image'

	  	expect(page).to have_content '#cat, #cute'
  	end
  	
	end

	context 'with posts' do
		before { login_as_test_user }
		before { add_post }

		it 'displays the post' do
			visit '/posts'
			expect(page).to have_content 'sss'
		end

		describe 'deleting a post' do

			it 'removes the post' do
				visit '/posts'
				click_link 'Delete'
				expect(page).not_to have_content 'sss'
			end

		end
	end

	context 'posts with tags' do
		before do 
			create(:user)
			create(:post, tag_names: '#cat, #cute')
			create(:post, description: 'Hello world') 
		end

		describe 'clicking a tag' do
			it 'show the photos for that tag' do 
				#login_as_test_user
				visit '/posts'
				click_link '#cat'
				expect(page).to have_content('I am a cat')
			end 

			it 'does not show photos without that tag' do 
				visit '/posts'
				click_link '#cat'
				expect(page).not_to have_content('Hello world')
			end
		end
	end

end
