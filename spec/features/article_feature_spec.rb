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
      expect(page).to have_content("Article was created")
    end
  end

  describe "user deletes an article" do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(all(".article-title").count).to eq(1)
      expect(page).to have_content("#{article_1.title} was destroyed.")
    end
  end

  describe "user can edit an article" do
    it "updates the article by id" do
      article = Article.create!(title: "Title 1", body: "Body 1")

      visit article_path(article)
      click_link "Edit"

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"

      click_on "Update Article"

      expect(current_path).to eq(article_path(article.id))
      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
      expect(page).to have_content("Article New Title! Updated!")
    end
  end
end
