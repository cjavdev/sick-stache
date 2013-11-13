SickStache.Router = Backbone.Router.extend({
    initialize: function(options) {
        this.$rootEl = options.$rootEl;
    },
    routes: {
        "": "feed",
        "shows": "shows"
    },
    shows: function() {
        var showIndex = new SickStache.Views.ShowsIndex({
            collection: SickStache.shows
        });
        this.$rootEl.html(showIndex.render().$el);
    },
    feed: function() {
        var that = this;
        var feedIndex = new SickStache.Views.FeedIndex({
            collection: SickStache.episodes
        });
        that.$rootEl.html(feedIndex.render().$el);
    }
});
