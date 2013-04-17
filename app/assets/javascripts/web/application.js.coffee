class window.VoxeWeb
  
  constructor: (options)->
    window.app = {models: {}, collections: {}, views:{}}
    
    app.router = new AppRouter()
    
    app.models.user = new UserModel()
    if $.cookie 'user_token'
      app.models.user.set token: $.cookie 'user_token'
      app.models.user.fetch()
      
    # cookies
    app.models.user.bind "change:token", (user)->
      if user.token()
        $.cookie 'user_token', user.token(), {expires: 30}
      else
        $.cookie 'user_token', null
            
    profile = new UserProfileView(model: app.models.user)
    $("#nav").append profile.render().el
    
    app.collections.elections = new ElectionsCollection()
    
    app.models.election = new ElectionModel()
    
    app.collections.tags = app.models.election.tags
    app.collections.candidacies = app.models.election.candidacies
        
    app.views.application = new ApplicationView(el: "#application-view")
    app.views.menu = new MenuView(el: "#menu", model: app.models.election, collection: app.collections.elections)
    app.views.menu.render()
    
    # views
    @candidaciesListView = new CandidaciesListView(el: "#candidacies-list", model: app.models.election)
    @candidaciesListView.render()
    
    @tagsListView = new TagsListView(el: "#tags-list", model: app.models.election)
    @tagsListView.render()
    
    if options.election
      app.models.election.set options.election
        
    app.models.election.bind "change:id", (election)->
      console.log("Fetch election " + election)
      app.models.election.fetch data: {tags: "all"}

    
    Backbone.history.start pushState: true

$ ->
  height = $(window).height()
  # $('body').animate scrollTop: "1px", 0
  $('.page').css 'min-height', height - 50
  
  # tipsy
  $('a').tipsy live: true
