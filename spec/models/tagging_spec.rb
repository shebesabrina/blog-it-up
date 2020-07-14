require 'rails_helper'

describe Tagging, type: :model do
  describe 'relationships' do
    it {should belong_to(:tag)}
    it {should belong_to(:article)}
  end
end
