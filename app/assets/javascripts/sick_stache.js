window.SickStache = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(options) {
    var that = this;
    this.$header = options.$header;
    this.$main = options.$main;
    this.$notice = options.$notice;

    var headerView = new SickStache.Views.Header();
    this.$header.html(headerView.render().$el);

    SickStache.episodes = new SickStache.Collections.Episodes();
    SickStache.episodes.fetch({
      success: function() {
        new SickStache.Router({
          $rootEl: that.$main 
        });
        Backbone.history.start();
      }
    });
  },
  message: function(msg) {
    this.$notice.html(msg);
    console.log("SickStache got a message: " + msg);
  }
};

$(function(){
  SickStache.initialize({
     $header : $('#header'),
     $main : $('#main'),
     $notice : $('#notice') 
  });
});
