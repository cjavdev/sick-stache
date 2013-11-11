SickStache.Views.FeedIndex = Backbone.View.extend({

  template: JST['feeds/index'],

  render: function() {
    var that = this;
    this.$el.html(this.template());
    this.collection.each(function(episode) {
      var feedDetail = new SickStache.Views.FeedDetail({
        model: episode
      });
      that.$el.find('#episodes').append(feedDetail.render().$el);
    });
    return this; 
  }

});
