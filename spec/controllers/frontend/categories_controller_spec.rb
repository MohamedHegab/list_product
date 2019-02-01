require 'rails_helper'

RSpec.describe Frontend::CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of all categorys' do
      categories = FactoryBot.create_list(:category, 3)
      get :index
      expect(assigns(:categories)).to match_array(categories)
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before(:each) do
      @category = FactoryBot.create :category
      get :show, params: { id: @category.id }
    end

    it { should respond_with 200 }
    it { expect(response).to render_template :show }
  end
end
