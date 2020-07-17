require 'rails_helper'

describe 'instance method' do
  describe '#tag_list' do
    it 'turns tag name into a list of strings' do
      article = Article.create!(title: 'Tech stuff', body: 'So much tech to learn')
      article.tags.create!(name: 'ruby technology')

      visit article_path(article)

      expect(page).to have_content('ruby technology')
    end
  end
end
