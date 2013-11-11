SickStache.Views.FeedDetail = Backbone.View.extend({
    initialize: function() {
        this.listenTo(this.model, "change", this.render);
    },
    template: JST['feeds/detail'],
    events: {
        "click .show": "markWatched"
    },
    render: function() {
        var that = this;
        this.$el.html(this.template({
            episode: this.model
        }));
        return this;
    },
    markWatched: function(event) {
        event.preventDefault();
        //this.model.set('watched', 'true');
        this.model.save({'watched': 'true'}, {
            success: function() {
                console.log("marked as watched");
            }
        });
    }

});
