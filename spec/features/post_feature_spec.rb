require 'spec_helper'

describe 'uploading photos' do 

	context 'on the pictures page' do
			
			it 'should display a picture' do
				add_post
				expect(page).to have_css 'img.uploaded-pic'

			end
	end

	context "while logged out" do

		it "shouldnt be able to create a post" do
			add_post
			expect(page).to have_content "You need to login first"
		end
	end
end
