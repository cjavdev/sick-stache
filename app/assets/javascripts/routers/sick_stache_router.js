SickStache.Router = Backbone.Router.extend({
    initialize: function(options) {
        this.$rootEl = options.$rootEl;
    },
    routes: {
        "": "index",
        "feed": "feed"
    },
    index: function() {
        var showIndex = new SickStache.Views.ShowsIndex({
            collection: SickStache.shows
        });
        this.$rootEl.html(showIndex.render().$el);
    },
    feed: function() {
        var that = this;
        SickStache.episodes = new SickStache.Collections.Episodes();
        SickStache.episodes.fetch({
          success: function() {
            var feedIndex = new SickStache.Views.FeedIndex({
                collection: SickStache.episodes
            });
            that.$rootEl.html(feedIndex.render().$el);
          }
        });
    }
});
