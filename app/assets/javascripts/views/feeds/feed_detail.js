SickStache.Views.FeedDetail = Backbone.View.extend({
  template: JST['feeds/detail'],
  tagName: 'tr',

  initialize: function () {
    this.listenTo(this.model, "all", this.render);
  },

  events: {
    "click .show": "markWatched",
    "click .dl": "markDownloaded"
  },

  className: function () {
    if (!this.model.get("downloaded") && !this.model.get("watched")) {
      return 'new-show';
    } else if (this.model.get("downloaded") && !this.model.get("watched")) {
      return 'warning';
    } else if (this.model.get("downloaded") && this.model.get("watched")) {
      return 'success';
    }
    return '';
  },

  render: function () {
    var that = this;
    this.$el.html(this.template({
      episode: this.model
    }));
    return this;
  },

  markDownloaded: function (event) {
    event.preventDefault();
    this.model.save({
      'downloaded': !this.model.get('downloaded')
    }, {
      success: function () {
        console.log("marked as downloaded");
      }
    });
  },
  markWatched: function (event) {
    event.preventDefault();
    this.model.save({
      'watched': !this.model.get('watched')
    }, {
      success: function () {
        console.log("marked as watched");
      }
    });
  }
});
