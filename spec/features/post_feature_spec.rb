require 'spec_helper'

describe 'uploading photos' do 

	context 'on the pictures page' do
			
			it 'should display a picture' do
				visit '/posts/new'
				fill_in 'Description', with: 'sss'
				attach_file 'Picture', Rails.root.join('spec/images/kitten.jpeg')
				click_button 'Create Post'

				expect(page).to have_css 'img.uploaded-pic'

			end

	end


end