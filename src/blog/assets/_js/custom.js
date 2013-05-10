$(document).ready(function() {
  enquire.register("screen and (min-width:700px)", {

    // OPTIONAL
    // If supplied, triggered when a media query matches.
    match : function() {
      // change all data-src attributes on img tags to _660
      $('img[data-src]').each(function(){
        // get data src
        var datasrc = $(this).attr('datasrc');
        // get file extension
        var ext = datasrc.replace();
        // prepend extension with _660
        // TODO
      });
    },

    // OPTIONAL
    // If supplied, triggered when the media query transitions
    // *from a matched state to an unmatched state*.
    unmatch : function() {},

    // OPTIONAL
    // If supplied, triggered once, when the handler is registered.
    setup : function() {},

    // OPTIONAL, defaults to false
    // If set to true, defers execution of the setup function
    // until the first time the media query is matched
    deferSetup : true,

    // OPTIONAL
    // If supplied, triggered when handler is unregistered.
    // Place cleanup code here
    destroy : function() {}

  });

  $("img").unveil(200);
});
