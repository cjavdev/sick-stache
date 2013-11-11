window.SickStache = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var headerView = new SickStache.Views.Header();
    $('#header').html(headerView.render().$el);

    SickStache.shows = new SickStache.Collections.Shows();
    SickStache.shows.fetch({
      success: function() {
        new SickStache.Router({
          $rootEl: $('#main')  
        });
        Backbone.history.start();
      }
    });
  }
};

$(function(){
  SickStache.initialize();
});
