class AjaxModalRails::CustomizeGenerator < Rails::Generators::Base

  class_option :skip_controllers, type: 'boolean', default: false, desc: "Don't copy controller mixin"
  class_option :skip_views, type: 'boolean', default: false, desc: "Don't copy views"
  class_option :skip_javascripts, type: 'boolean', default: false, desc: "Don't copy javascripts"


  source_root File.expand_path('../../../../../app', __FILE__)

  def copy!
    copy_controllers unless skip_controllers
    copy_views unless skip_views
    copy_javascripts unless skip_javascripts
  end

  private 

    def copy_controllers
      directory 'controllers/ajax_modal_rails', 'app/controllers/ajax_modal_rails'
    end

    def copy_views
      directory 'views/ajax_modal_rails', 'app/views/ajax_modal_rails'
    end

    def copy_javascripts
      directory 'assets/javascripts/ajax_modal_rails', 'app/assets/javascripts/ajax_modal_rails'
    end


end
