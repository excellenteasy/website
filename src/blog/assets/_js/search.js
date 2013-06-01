(function(){
  var searchIndex = {};
  var $search = $('input#search');
  var $info = $('#info');
  var printResults = function(results, blank){
    var $searchResults = $('#results');
    $searchResults.html('');
    if (results.length) {
      $info.html('and here are <em>the results</em>:');
    } else if (blank) {
      return $info.html('');
    } else {
      $info.html('but there are <em>no results</em>. Here is our <em>latest post</em> though:');
      return $searchResults.append(
        '<div class="search-result">'+
          '<a href="' + searchIndex[0]['href'] + '">'+
            searchIndex[0]['title']+
          '</a>'+
        '</div>'
      );
    }
    $searchResults.html(function() {
      $.each(results, function(index, result) {
        $searchResults.append(
          '<div class="search-result">'+
            (index+1+'. ') +
            '<a href="' + result[1] + '">'+
              result[0]+
            '</a>'+
          '</div>'
        );
      });
    });
  };
  var search = function(searchTerm){
    var results = [];
    if (searchTerm != '') {
      $.each(searchIndex, function(id, article) {
          var title = article['title'];
          var titleLowerCase = article['title'].toLowerCase();
          var url = article['href'];

          if (titleLowerCase.indexOf(searchTerm) !== -1) {
              results.push([title, url]);
          };
      });

      printResults(results);
    } else{
      $('#results').html();
      printResults([],true);
    };
  };

  $.getJSON('/blog/search/search.json', function(data) {
    searchIndex = data;
  });

  $search.autoGrowInput({
    comfortZone: 10,
    maxWidth: 2000
  }).focus().keyup(function() {
    search($(this).val().toLowerCase());
  });
  $('.introduction').click(function(){
    $search.focus();
  });
}).call(this);
