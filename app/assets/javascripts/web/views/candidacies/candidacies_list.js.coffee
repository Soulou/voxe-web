class window.CandidaciesListView extends Backbone.View
  
  initialize: ->
    console.log "bind change:candidacies, rerender"
    @model.bind "change:candidacies", @render, @
      
  render: ->
    console.log "Render CandidaciesListView"
    $(@el).html ''
    console.log JSON.stringify(@model.candidacies)
    @model.candidacies.each (candidacy) =>
      view = new CandidacyCellView model: candidacy, election: @model
      console.log "Append " + @el
      $(@el).append view.render().el
    @
