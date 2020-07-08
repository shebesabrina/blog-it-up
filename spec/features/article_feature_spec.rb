require 'rails_helper'

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit '/articles'

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end

  describe "user sees on article" do
    it "displays article by id" do

      article = Article.create!(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)

      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit "/articles/#{article_1.id}"

      expect(page).to have_content(article_1.title)
      expect(page).to_not have_content(article_2.title)
    end
  end

  describe "user creates a new article" do
    it "creates a new article" do
      visit articles_path
      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"
      click_on "Create Article"

      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
    end
  end
end
