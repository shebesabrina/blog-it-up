class Article < ApplicationRecord
    validates_presence_of :title, :body
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    def tag_list
      tags.join(", ")
    end

    def tag_list=(tags_string)
      tags_string.gsub(',','').split()
      # tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    end
end
