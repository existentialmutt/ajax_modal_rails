require 'rails_helper'

RSpec.describe "Create messages", js: true do

  describe 'User requests new message form' do
    it "loads in the modal" do
      visit '/messages'
      click_link 'New Message'
      within '[data-ajax-modal]' do
        expect(page).to have_text('Write a New Message')
      end
    end

    describe 'User submits new message form' do

      before do
        visit '/messages'
        click_link 'New Message'
      end

      context 'invalid form' do
        it 'displays an error message in the modal' do
          within '[data-ajax-modal] #new_message_form' do
            fill_in 'Message', with: ''
            click_button 'Create Message'
          end
          within '[data-ajax-modal]' do
            expect(page).to have_content("Message can't be blank")
          end
        end 
      end

      context 'valid form' do
        it 'displays the message in the list of messages' do
          within '[data-ajax-modal] #new_message_form' do
            fill_in 'Message', with: 'Hello Modal!'
            click_button 'Create Message'
          end
          expect(page).to have_content("Hello Modal!")
        end 
      end


    end

  end


end