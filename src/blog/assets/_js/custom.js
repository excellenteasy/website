var changeImgSrcPostfixTo = function(width) {
  $('img[data-src]').each(function(){
    var $el = $(this);
    // get data src
    var datasrc = $el.attr('data-src');
    // get file extension
    var match = datasrc.match(/(_[0-9]*)?(\.[0-9a-z]+)$/i);
    var ext = match[2];
    // remove prepended _#{width} before applying new one
    if (match[1]) {
      datasrc = datasrc.replace(match[1], '');
    }
    // prepend extension with _#{width}
    datasrc = datasrc.replace(ext, '_'+width+ext);
    $el.attr('data-src', datasrc);
  }).unveil(0);
};

var registerMatchForWidth = function(maxwidth, width) {
  var minwidth = maxwidth - 190;
  enquire.register("screen and (min-width: "+minwidth+"px) and (max-width: "+maxwidth+"px)", function() {
    // change all data-src attributes on img tags to width
    changeImgSrcPostfixTo(width);
  });
};

registerMatchForWidth(699, 470);
registerMatchForWidth(509, 280);
registerMatchForWidth(319, 150);

// TODO: more granular matches

// 700+px
enquire.register("screen and (min-width:700px)", function() {
  changeImgSrcPostfixTo(660);
});

// Disqus
if (window.disqus_title) {
  var $window = $(window);
  var treshold = ($('body').height()*0.7);
  var loadDisqus = function(e) {
    if ($window.scrollTop() >= treshold) {
      $window.off('scroll', loadDisqus);
      (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      })();
    }
  };
  $window.on('scroll', loadDisqus);
}
