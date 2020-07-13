require 'rails_helper'

describe 'user sees one article' do
  it 'displays information from the article index' do
    article = Article.create!(title: 'New Title', body: 'New Body')
    comment_1 = article.comments.create!(author_name: 'Me', body: 'chit-chat')
    comment_2 = article.comments.create!(author_name: 'You', body: 'social butterfly')

    visit articles_path

    click_link article.title

    expect(page).to have_content(article.title)
    expect(page).to have_content(article.body)
    expect(page).to have_content(comment_1.author_name)
    expect(page).to have_content(comment_1.body)
    expect(page).to have_content(comment_2.author_name)
    expect(page).to have_content(comment_2.body)  
  end
end
