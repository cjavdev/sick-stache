SickStache.Views.FeedIndex = Backbone.View.extend({
  template: JST['feeds/index'],

  initialize: function () {
    this.listenTo(this.collection, 'all', this.render);
  },

  events: {
    'click #episodeFetch': 'episodeFetch'
  },

  render: function () {
    var that = this;
    this.$el.html(this.template());
    this.collection.each(function (episode) {
      var feedDetail = new SickStache.Views.FeedDetail({
        model: episode
      });
      that.$el.find('#episodes').append(feedDetail.render().$el);
    });
    return this;
  },

  episodeFetch: function () {
    var that = this;
    this.$el.find('#episode-fetch-loading').html("refreshing...");
    $.get("/episodes/refresh", {
      success: function () {
        that.collection.fetch({
          success: function () {
            that.$el.find('#episode-fetch-loading').html('');
          },
        });
      }
    });
  }
});
