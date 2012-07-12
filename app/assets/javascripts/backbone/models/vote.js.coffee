class Voter.Models.Vote extends Backbone.Model
  url: =>
    '/submissions/' + @get('drama_id') + '/votes'
