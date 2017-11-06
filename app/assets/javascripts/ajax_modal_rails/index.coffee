#############
# Ajax modals
#############
class window.AjaxModal
  constructor: ->
    @modal = $(".modal[data-ajax-modal]")
    @content = @modal.find("[data-ajax-modal-content]")
    @linkTriggersSelector = '[data-loads-in-ajax-modal]'
    @formTriggersSelector = '[data-submits-to-ajax-modal]'
    @loading = @modal.find("[data-ajax-modal-loading]")
    @listen()

  listen: ->
    @_registerLinks()
    @_registerForms()
    @_registerClose()

  _registerLinks: ->
    $('body').on 'click', @linkTriggersSelector, (e) =>
      e.preventDefault()
      @loading.show()
      @open()
      $.ajax
        url: e.currentTarget.getAttribute("href"),
        dataType: 'html',
        headers: {
          'X-AJAX-MODAL': true
        },
        complete: (xhr, status) =>
          @loading.hide()
          @content.html xhr.responseText
          @open

  _registerForms: ->
    # scope.find(@formTriggersSelector).attr('data-remote', true)
    $('body').on 'submit', @formTriggersSelector, (event) =>
      form = event.currentTarget
      event.preventDefault()
      $.ajax
        url: form.getAttribute('action')
        type: form.getAttribute('method')
        dataType: 'html',
        data: $(form).serialize(),
        headers: {
          'X-AJAX-MODAL': true
        },
        complete: (xhr, status) =>
          @loading.hide()
          @content.html xhr.responseText
          @open
      return false


    # $('body').on 'ajax:complete', @formTriggersSelector, (event, data, status, xhr) =>
    #   @_registerForms @content
      
  # maybe don't need this for bootstrap
  _registerClose: ->
    @modal.on 'click', '[data-ajax-modal-close]', =>
      @modal.modal('hide')
      @reset()

  open: ->
    @modal.modal 'show'

  reset: ->
    @content.html("")
    @loading.show()
