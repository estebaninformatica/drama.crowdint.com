class Drama.Models.Subscription extends Backbone.Model
  url: ->
    '/subscription'

  isNew: ->
    false
