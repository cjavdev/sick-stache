SickStache.Collections.Episodes = Backbone.Collection.extend({
  model: SickStache.Models.Episode,
  url: "/episodes",
  parse: function(data) {
    this.page_number = data.page_number;
    this.total_pages = data.total_pages;
    return data.episodes; 
  },
});
