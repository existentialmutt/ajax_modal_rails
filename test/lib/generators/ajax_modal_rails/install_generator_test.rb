require 'test_helper'
require 'generators/ajax_modal_rails/install/install_generator'

class AjaxModalRails::InstallGeneratorTest < Rails::Generators::TestCase
  tests AjaxModalRails::InstallGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
