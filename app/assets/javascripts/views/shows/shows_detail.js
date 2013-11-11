SickStache.Views.ShowsDetail = Backbone.View.extend({

    template: JST['shows/detail'],

    render: function() {
        this.$el.html(this.template({
          show: this.model 
        }));
        return this;
    }
});
