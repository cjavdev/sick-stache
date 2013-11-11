SickStache.Views.ShowsIndex = Backbone.View.extend({

  template: JST['shows/index'],

  render: function() {
    var that = this;
    this.$el.html(this.template());

    this.collection.each(function(show) {
      var showView = new SickStache.Views.ShowsDetail({
         model: show  
      });
      that.$el.find('#shows').append(showView.render().$el);
    });

    return this; 
  }

});
