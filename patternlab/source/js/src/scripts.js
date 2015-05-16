var header = document.getElementById('primaryHeader');
var headerOffset = 88;
var returnToTopTrigger = document.getElementById('returnToTopTrigger');
var primaryNavLink = document.getElementsByClassName('navTrigger');

(function($) {
  $('.navTrigger').on('click', function(e) {
    var navLocation = this.hash;
    var newOffset = headerOffset - 40;
    $.scrollTo( navLocation, 800, {
      offset : -newOffset,
    });
    return false;
  });
  $('.secondary .navTrigger').click(function(e){
    var hrefLink = $(this).attr("href");
    window.location.href = hrefLink;
  });
  $('#returnToTop').on('click', function(e) {
    e.preventDefault();
    $.scrollTo(0, 800);
  });
  $('#mobile-nav-trigger').mobileMenuCollapse({
    navMenu : ".nav-primary"
  });
})(jQuery);

function clickHandler(event) {
  // Add an item to the history log
  history.pushState(event.target.textContent, event.target.href);

  return event.preventDefault();
}

// Attach event listeners
for (var i = 0, l = primaryNavLink.length; i < l; i++) {
  primaryNavLink[i].addEventListener('click', clickHandler, true);
}

// Revert to a previously saved state
window.addEventListener('popstate', function(event) {
  console.log('popstate fired!');

  updateContent(event.state);
});

function classSwap(direction) {
  if (direction == 'down') {
    header.classList.add("thinner");
    returnToTopTrigger.classList.remove("ui-collapsed");
  }
  if (direction == 'up') {
    header.classList.remove("thinner");
    returnToTopTrigger.classList.add("ui-collapsed");
  }
}

var waypoint = new Waypoint({
  element: document.getElementById('waypointTriggerTop'),
  handler: function(direction) {
    classSwap(direction);
  },
  offset: headerOffset
});