require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
  let(:post) { user.posts.create(title: 'Post 1', text: 'This is post 1', comments_counter: 0, likes_counter: 0) }
  subject { Comment.new(text: 'Text', author_id: user.id, post_id: post.id) }

  before { subject.save }

  it 'validates presence of text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of author_id' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  describe '#update_post_comments_counter' do
    it 'increments the comments counter' do
      expect { subject.update_post_comments_counter }.to change { subject.post.comments_counter }.by(1)
    end
  end
end
