require 'rails_helper'

RSpec.describe Frontend::CategoriesController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @category = FactoryBot.create :category
      get :show, params: { id: @category.id }
    end

    it 'returns the information about the category on a hash' do
    end

    it { should respond_with 200 }
  end

  describe 'Get #index' do

  end
end
