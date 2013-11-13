SickStache.Models.Episode = Backbone.Model.extend({
    first_aired: function() {
      return moment(this.get("first_aired")).fromNow();
    },
    
    parse: function(data) {
       data.show_name = data.show._name;
       delete data.show;
       return data; 
    },
    
    sNum: function() {
       var padded = "00" + this.get("s_num");
       return padded.slice(-2);
    },

    eNum: function() {
       var padded = "00" + this.get("e_num");
       return padded.slice(-2);
    }
});
