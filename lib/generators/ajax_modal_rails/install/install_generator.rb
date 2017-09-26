class AjaxModalRails::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app', __FILE__)
  class_option :skip_layout, type: 'boolean', default: false, desc: "Don't modify application layout"
  class_option :skip_javascript, type: 'boolean', default: false, desc: "Don't modify application javascript"
  class_option :layout, type: 'string', default: default_layout, desc: 'Specify a custom layout'
  class_option :javascript, type: 'string', default: 'app/views/layouts/application.js', desc: 'Specify a custom javascript'


  def self.default_layout
    begin
      Haml
      return find_default_haml_layout
    rescue NameError
      return 'app/views/layouts/application.html.erb'
    end
  end

  def install
    install_layout unless skip_layout
    install_javascript unless skip_javascript
  end

  private

    def install_layout
      begin
        Haml
        append_to_file layout, File.read(File.expand_path('../templates/render_ajax_modal_frame.html.haml'), __FILE__)
      rescue NameError
        insert_into_file layout, File.read(File.expand_path('../templates/render_ajax_modal_frame.html.erb'), __FILE__), before: '</body>'
      end
    end

    def install_javascript
      append_to_file 'app/assets/javascripts/application.js', '//= require ajax_modal_rails'
    end

    def self.find_default_haml_layout
      Dir.glob('app/views/layouts/application{.html,}.haml').first
    end

end
