class Drama.Views.SubscriptionView extends Backbone.View
  template:
    JST.subscription

  render: ->
    @$el.html @template(@model.toJSON())

    @

  events:
    'click input#subscribed' : 'toggle'

  toggle: (e) ->
    @model.save('subscribed', $(e.target).is(':checked'))

