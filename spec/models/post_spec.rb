require 'spec_helper'

describe Post do 

  describe '#tag_names' do

    it 'should create a tag if it does not exist' do
      post = create(:post, tag_names: '#miaow')
      expect(post.tags.count).to eq 1
      expect(post.tags.first.name).to eq '#miaow'
    end

    it 'should use the tag if it already exists' do     
      post = create(:post, tag_names: '#miaow')
      expect(post.tags.count).to eq 1
      expect(post.tags.first.name).to eq '#miaow'
      expect(Tag.count).to eq 1
    end

    it 'keep tags unique' do
      post = create(:post, tag_names: '#miaow #miaow #cat')
      expect(post.tags.count).to eq 2
    end

  end
end