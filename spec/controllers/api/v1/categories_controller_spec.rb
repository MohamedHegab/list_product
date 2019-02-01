require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller, format: :api do
  describe 'GET #show' do
    before(:each) do
      @category = FactoryBot.create :category
      get :show, params: { id: @category.id }
    end

    it 'returns the information about the category on a hash' do
      category_response = json_response
      expect(category_response[:data][:attributes][:name]).to eql @category.name
    end

    it { should respond_with 200 }
  end

  describe 'POST #create' do
    context 'when is successfully created' do
      before(:each) do
        @category_attributes = FactoryBot.attributes_for :category
        post :create, params: { category: @category_attributes }
      end

      it 'renders the json representation for the category record just created' do
        category_response = json_response
        expect(category_response[:data][:attributes][:name]).to eql @category_attributes[:name]
      end

      it { should respond_with 201 }
    end

    context 'when is not created not valid attributes' do
      before(:each) do
        @invalid_category_attributes = { name: nil }
        post :create, params: { category: @invalid_category_attributes }
      end

      it 'renders an errors json' do
        category_response = json_response
        expect(category_response).to have_key(:errors)
      end

      it 'renders the json errors on why the category could not be created' do
        category_response = json_response
        expect(category_response[:errors][:name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe 'PUT/PATCH #update' do
    context 'when is successfully updated' do
      before(:each) do
        @category = FactoryBot.create :category
        @name = 'female'
        patch :update, params: { id: @category.id,
                                 category: FactoryBot.attributes_for(:category, name: 'female') }
      end

      it 'renders the json representation for the updated user' do
        category_response = json_response
        expect(category_response[:data][:attributes][:name]).to eql @name
      end

      it { should respond_with 200 }
    end
  end

  describe 'DELETE #destroy' do
    context 'can destroy category' do
      before(:each) do
        @category = FactoryBot.create :category
      end
      it '' do
        expect {
          delete :destroy, params: { id: @category.id }
        }.to change(Category, :count).by(-1)
      end
    end
  end
end
