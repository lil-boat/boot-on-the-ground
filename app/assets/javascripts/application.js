// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery-ujs
//= require rails-ujs
//= require turbolinks
//= require_tree
//= require jcrop

$(document).ready(function() {
  scrollListener();
  aboutButtonListener();
  jobsButtonListener();
  projectsButtonListener();
  testimonialsButtonListener();
  bootsInTheWorldButtonListener();
  bootsOnTheGroundButtonListener();
  jobsCarousel();
  projectsCarousel();
  // tCarousel();
});

var myIndex = 0;
var jobsCarousel = function() {
  var i;
  var x = document.getElementsByClassName('jobSlide');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  myIndex++;
  if (myIndex > x.length) {
    myIndex = 1;
  }
  x[myIndex - 1].style.display = 'block';
  setTimeout(jobsCarousel, 3100);
};

var projectsCarousel = function() {
  var i;
  var x = document.getElementsByClassName('projectSlide');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  myIndex++;
  if (myIndex > x.length) {
    myIndex = 1;
  }
  x[myIndex - 1].style.display = 'block';
  setTimeout(projectsCarousel, 3000);
};

var tCarousel = function() {
  var i;
  var x = document.getElementsByClassName('testimonialSlide');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  myIndex++;
  if (myIndex > x.length) {
    myIndex = 1;
  }
  x[myIndex - 1].style.display = 'block';
  setTimeout(tCarousel, 3000);
};

var scrollListener = function() {
  $(window).on('scroll', function() {
    if ($(window).scrollTop() > 700) {
      $('.home-header').show();
    } else {
      $('.home-header').hide();
    }
  });
};

var aboutButtonListener = function() {
  $('.scroll-to-about').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.about').offset().top
      },
      1500
    );
  });
};

var jobsButtonListener = function() {
  $('.jobs-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.jobs').offset().top
      },
      1500
    );
  });
};

var projectsButtonListener = function() {
  $('.projects-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.projects').offset().top
      },
      1500
    );
  });
};

var testimonialsButtonListener = function() {
  $('.testimonials-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.testimonials').offset().top
      },
      1500
    );
  });
};

var bootsInTheWorldButtonListener = function() {
  $('.boots-in-the-world-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.boots-in-the-world').offset().top
      },
      1500
    );
  });
};

var bootsOnTheGroundButtonListener = function() {
  $('.boots-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.big-picture').offset().top
      },
      1500
    );
  });
};
