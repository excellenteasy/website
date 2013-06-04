(function() {
  var searchIndex = {};
  var $info = $('#info');
  var $search = $('input#search');
  var $searchResults = $('#results');
  var printResults = function(results, blank) {
    $searchResults.html('');
    if (results.length) {
      $info.html('and here are <em>the results</em>:');
    } else if (blank) {
      return $info.html('');
    } else {
      return $info.html('but there are <em>no results</em>.');
    }
    $.each(results, function(index, result) {
      $searchResults.append(
        '<div class="search-result">'+
          (parseInt(result.score*100))+ '% match: ' +
          '<a href="' + result.href + '">'+
            result.title+
          '</a>'+
        '</div>'
      );
    });
  };
  var search = function(searchTerm){
    var results = _.map(searchIndex, function(article) {
      article.score = $.fuzzyMatch(article.title, searchTerm).score;
      if (article.score > 0.01) { return article; } else { return undefined; }
    });
    results = _.compact(results);
    results = _.sortBy(results, function(result) { return -result.score; });
    printResults(results);
  };

  $.getJSON('/blog/search/search.json', function(data) {
    searchIndex = data;
    if (location.search) {
      $search
        .val(decodeURIComponent(location.search.replace(/^\?/,'')))
        .trigger('keyup');
    }
  });

  $search.autoGrowInput({
    comfortZone: 10,
    maxWidth: 2000
  }).focus().keyup(function() {
    var searchTerm = $(this).val();
    searchTerm !== '' ? search(searchTerm) : printResults([],true);
  });
  $('.introduction').click(function() {
    $search.focus();
  });
}).call(this);
