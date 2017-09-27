# AjaxModalRails
This plugin provides a simple way to do common modal interactions in a rails app.  Just add a single data attribute to links and forms and include a controller mixin to load pages via ajax in a modal.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ajax_modal_rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ajax_modal_rails
```

## Usage


### Views

Add the attribute `data-loads-in-ajax-modal` to a link and it's request will load in a modal over the current page.

Add the attribute `data-submits-to-ajax-modal` to a form and the response from the form's submit will load in the modal frame.

### Controller Mixin

A controller that is processing actions to be loaded in a modal should call `include AjaxModalRails::Controller`

### Layouts and Javascript

View partials can be installed automatically by a generator for apps that stick close to rails conventions.  See below for manual installation

Running `rails generate ajax_modal_rails:install` will require the necessary javascript in `application.js` and add a partial render to the bottom of the body in `layouts/application.html.erb|haml`

#### Manual Installation

Add `//= require ajax_modal_rails` to `app/assets/application.js`

A page that opens a modal should call `render 'ajax_modal_rails/frame'` somewhere on the page.  We recommend you do this in your layout so the modal frame is available for all pages.

### Customization

If you want to customize the behavior of this gem, run `rails generate ajax_modal_rails:customize`.  It will copy the views, javascript, and controller mixin into your application.

### Example

A simple example application is provided [example application](blob/master/spec/dummy)

### Requirements

The provided modal views and javascript require [Twitter Bootstrap 4.0](https://getbootstrap.com/docs/4.0/getting-started/introduction/).  You can do some customization if your app is using something else (see above).

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Gratitude
This gem was made possible by 