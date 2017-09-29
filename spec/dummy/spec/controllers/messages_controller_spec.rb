require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe MessagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {message: 'Hello Spec!'}
  }

  let(:invalid_attributes) {
    {message: ''}
  }

  describe "GET #new" do
    context "ajax modal request" do
      it "returns a success response" do
        # TODO move to custom header
        # get articles_url, headers: { "Content-Type": "text/plain" } # simulate the request with custom header

        get :new, headers: {'HTTP_X_AJAX_MODAL': true}
        expect(response).to be_success
      end

      it "renders the modal layout" do
        # TODO move to custom header
        # get articles_url, headers: { "Content-Type": "text/plain" } # simulate the request with custom header

        get :new, headers: {'HTTP_X_AJAX_MODAL': true}
        expect(response).to render_template('layouts/ajax_modal_rails/content')
      end
    end
  end

  describe "POST #create" do
    context "ajax modal request" do
        context "with valid params" do
          it "redirects via javascript" do
            post :create, params: {message: valid_attributes}, headers: {'HTTP_X_AJAX_MODAL': true}
            expect(response).to render_template('ajax_modal_rails/redirect_via_js')
          end
        end

        context "with invalid params" do
          it "returns a success response (i.e. to display the 'new' template)" do
            post :create, params: {message: invalid_attributes}, headers: {'HTTP_X_AJAX_MODAL': true}
            expect(response).to be_success
          end

          it "renders the modal layout" do
            post :create, params: {message: invalid_attributes}, headers: {'HTTP_X_AJAX_MODAL': true}
            expect(response).to render_template('layouts/ajax_modal_rails/content')
          end
        end
      end      
    end
 

end
