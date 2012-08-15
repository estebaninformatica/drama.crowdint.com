class Drama.Views.SubscriptionApp extends Backbone.View
  el: '#subscriptions'

  initialize: ->
    @user = new Drama.Models.Subscription
    @user.fetch
      success: =>
        @subscriptionView = new Drama.Views.SubscriptionView
          model: @user

        @$el.append @subscriptionView.render().el
