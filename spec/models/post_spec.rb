require 'spec_helper'

describe Post do
  context 'tags' do
    it 'creates a tag when tag is filled' do
      post = Post.create(description: 'test', tag_names: '#makersswag #yolo')
      expect(post.tags.count).to eq 2
      expect(post.tags.first.name).to eq '#makersswag'
    end

    it 'tag names are unique' do
      post = Post.create(description: 'test', tag_names: '#yolo #makersswag #yolo')
      expect(post.tags.count).to eq 2
      expect(post.tags.last.name).to eq '#makersswag'
    end

    it 'transforms tags to lowercase' do
      post = Post.create(description: 'test', tag_names: '#yOLO')
      expect(post.tags.last.name).to eq '#yolo'
    end
  end
end
