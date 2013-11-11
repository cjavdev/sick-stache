SickStache.Views.Header = Backbone.View.extend({
    template: JST['header'],
    render: function() {
        this.$el.html(this.template({
          show: this.model 
        }));
        return this;
    }
});
