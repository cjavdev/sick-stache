SickStache.Views.ShowsIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render); 
  },
 
  events : {
    
  },

  template: JST['shows/index'],

  render: function() {
    var that = this;
    this.$el.html(this.template());
    this.$el.find('#name').typeahead([{
      name: 'show_name',
      remote: '/shows/titles?q=%QUERY'
      }]).bind('typeahead:selected', function (obj, datum) {
      that.collection.create(datum, {
        success: function(){
          SickStache.message("Added Show!");
        },
        error: function() {
          SickStache.message("No Go! prahvit");
        }
      });
      console.log(obj);
      console.log(datum);
    });
    
    this.collection.each(function(show) {
      var showView = new SickStache.Views.ShowsDetail({
         model: show  
      });
      that.$el.find('#shows').append(showView.render().$el);
    });

    return this; 
  }

});
