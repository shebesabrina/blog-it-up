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

  describe "user sees all tags" do
    describe "they visit /tags" do
      it "displays all tags" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        tag_1 = article_1.tags.create!(name: "Name 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")
        tag_2 = article_2.tags.create!(name: "Name 2")
        article_3 = Article.create!(title: "Title 3", body: "Body 3")
        tag_3 = article_3.tags.create!(name: "Name 3")

        visit tags_path

        expect(page).to have_content(tag_1.name)
        expect(page).to have_content(tag_2.name)
        expect(page).to have_content(tag_3.name)
      end
    end
  end

  describe "user deletes an tag" do
    it "displays all tags without the deleted entry" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      tag_1 = article_1.tags.create!(name: "Name 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")
      tag_2 = article_2.tags.create!(name: "Name 2")

      visit tag_path(tag_1)
      click_link "Delete"

      expect(current_path).to eq(tags_path)
      expect(page).to have_content(tag_2.name)
      expect(all(".tag-name").count).to eq(1)
      expect(page).to have_content("#{tag_1.name} was destroyed.")
    end
  end
end
