class Voter.Views.UpvoteLinkView extends Backbone.View
  events:
    'click a' : 'clickLink'

  clickLink: (e) ->
    e.preventDefault()

    @saveVote(@dramaId())
    @updateCounter()

  dramaId: ->
    @$el.attr('data-drama-id')

  voteCountEl: ->
    @$el.find('.vote-count')

  voteCount: ->
    parseInt(@voteCountEl().text())

  saveVote: (dramaId) ->
    vote = new Voter.Models.Vote
      'drama_id': dramaId

    vote.save()

  updateCounter: ->
    votes = @voteCount() + 1

    if votes > 9
      @$el.remove()
    else
      @voteCountEl().html(votes)
      @removeVoteLink()

  removeVoteLink: ->
    @$el.find('a').remove()
