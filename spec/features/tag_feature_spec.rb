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

  describe "user sees a single tag" do
    it "displays tag by id" do
      article = Article.create!(title: "New Title", body: "New Body")
      tag = Tag.create!(name: "Name")
      tagging = Tagging.create!(article_id: article.id, tag_id: tag.id)

      visit article_path(article)

      click_link tag.name

      expect(page).to have_content(article.title)
    end
  end
end
