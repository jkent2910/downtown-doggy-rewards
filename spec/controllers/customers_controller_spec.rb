require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  include Devise::TestHelpers

  before do   
    @carrie = FactoryGirl.create(:carrie)
    sign_in @carrie
  end

  #This should return the minimal set of attributes required to create a valid
  #Customer.  

  let(:valid_attributes) {
    {
      first_name: "Julie",
      last_name: "Kent",
    }
  }

  let(:invalid_attributes) {
    {
      first_name: nil,
      last_name: nil
    }
  }

  context "list of customers" do 
    describe "GET #index" do 
      it "assigns all customers as @customers" do 
        customer = Customer.create! valid_attributes
        get :index
        expect(assigns(:customers)).to eq([customer])
      end
    end

    context "when a user tries to view the index page" do 
      before do 
        @user = FactoryGirl.create(:user)
        sign_in @user
        get :index
      end

      it "redirects to home path" do 
        expect(response).to redirect_to(home_path)
      end

      it "displays an appropriate message" do 
        expect(flash[:notice]).to match ("not allowed")
      end
    end

    describe "GET #show" do
      it "assigns the requested customer as @customer" do 
        customer = Customer.create! valid_attributes
        get :show, {:id => customer.to_param}
        expect(assigns(:customer)).to eq(customer)
      end

      before do 
        @user = FactoryGirl.create(:user)
        @user2 = FactoryGirl.create(:user)
        @customer = FactoryGirl.create(:customer, user: @user, email: @user.email)
      end
      it "only allows a customer to view their customer page" do 
        sign_out @carrie
        sign_in @user2 
        get :show, {:id => @customer.to_param} 
        expect(response).to redirect_to home_url
      end
    end

    describe "GET #new" do
      context "when creating a new customer" do 
        it "assigns a new customer as @customer" do 
          get :new
          expect(assigns(:customer)).to be_a_new(Customer)
        end
      end

      context "when a user already has a customer account" do 
        before do 
          user = FactoryGirl.create(:user)
          customer = FactoryGirl.create(:customer, user: user, email: user.email)
          sign_in user
          sign_out @carrie
          get :new
        end

        it "redirects to the Customer home page" do 
          expect(response).to redirect_to home_url
        end

        it "displays an appropriate message" do 
          expect(flash[:notice]).to match("already have a customer account")
        end
      end
    end

    describe "GET #edit" do 
      it "assigns the requested customer as @customer" do 
        customer = Customer.create! valid_attributes
        get :edit, {:id => customer.to_param}
        expect(assigns(:customer)).to eq(customer)
      end
    end

    describe "POST #create" do 
      context "with valid params" do 
        it "creates a new Customer" do 
          expect {
            post :create, {:customer => valid_attributes}
            }.to change(Customer, :count).by(1)
          end

          it "assigns a newly created customer as @customer" do 
            post :create, {:customer => valid_attributes}
            expect(assigns(:customer)).to be_a(Customer)
            expect(assigns(:customer)).to be_persisted
          end

          it "redirects to the created customer" do 
            post :create, {:customer => valid_attributes}
            expect(response).to redirect_to(Customer.last)
          end
        end

        context "with invalid params" do 
          it "assigns a newly created but unsaved customer as @customer" do 
            post :create, {:customer => invalid_attributes}
            expect(assigns(:customer)).to be_a_new(Customer)
          end

          it "re-renders the 'new' template" do 
            post :create, {:customer => invalid_attributes} 
            expect(response).to render_template("new")
          end
        end
      end

      describe "PUT #update" do 
        context "with valid params" do 
          let(:new_attributes) {
            {
              first_name: "Julie",
              last_name: "Renken"
            }
          }

          it "updates the requested customer" do 
            customer = Customer.create! valid_attributes
            put :update, {:id => customer.to_param, :customer => new_attributes}
            customer.reload
            expect(customer.last_name).to eq("Renken")
          end

          it "assigns the requested customer as @customer" do 
            customer = Customer.create! valid_attributes
            put :update, {:id => customer.to_param, :customer => valid_attributes}
            expect(assigns(:customer)).to eq(customer)
          end

          it "redirects to the customer" do 
            customer = Customer.create! valid_attributes
            put :update, {:id => customer.to_param, :customer => valid_attributes}
            expect(response).to redirect_to(customer)
          end
        end

        context "with invalid params" do 
          it "assigns the customer as @customer" do 
            customer = Customer.create! valid_attributes
            put :update, {:id => customer.to_param, :customer => invalid_attributes}
            expect(assigns(:customer)).to eq(customer)
          end

          it "re-renders the 'edit' template" do 
            customer = Customer.create! valid_attributes
            put :update, {:id => customer.to_param, :customer => invalid_attributes}
            expect(response).to render_template("edit")
          end
        end
      end

      describe "DELETE #destroy" do 
        it "destroys the requested customer" do 
          customer = Customer.create! valid_attributes
          expect {
            delete :destroy, {:id => customer.to_param}
            }.to change(Customer, :count).by(-1)
          end

          it "redirects to the customer index page" do 
            customer = Customer.create! valid_attributes
            delete :destroy, {:id => customer.to_param}
            expect(response).to redirect_to(customers_url)
          end
        end
      end
    end
