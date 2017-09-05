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
  textCarousel();
});

var count = 0;
var jobsCarousel = function() {
  var i;
  var a = document.getElementsByClassName('jobSlide');
  for (i = 0; i < a.length; i++) {
    a[i].style.display = 'none';
    console.log(a.length);
  }
  count++;
  if (count > a.length) {
    count = 1;
  }
  a[count - 1].style.display = 'block';
  console.log(count);
  setTimeout(jobsCarousel, 5100);
};
var myIndex = 0;
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
  setTimeout(projectsCarousel, 5000);
};

var testCount = 0;
var tCarousel = function() {
  var i;
  var x = document.getElementsByClassName('testimonialSlide');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  testCount++;
  if (testCount > x.length) {
    testCount = 1;
  }
  x[testCount - 1].style.display = 'block';
  setTimeout(tCarousel, 11000);
};

var textCount = 0;
var textCarousel = function() {
  var i;
  var x = document.getElementsByClassName('testimonialText');
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  textCount++;
  if (textCount > x.length) {
    textCount = 1;
  }
  x[textCount - 1].style.display = 'block';
  setTimeout(textCarousel, 16000);
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
      1000
    );
  });
};

var jobsButtonListener = function() {
  $('.jobs-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.jobs').offset().top - 50
      },
      1000
    );
  });
};

var projectsButtonListener = function() {
  $('.projects-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.projects').offset().top - 50
      },
      1000
    );
  });
};

var testimonialsButtonListener = function() {
  $('.testimonials-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.testimonials').offset().top - 50
      },
      1000
    );
  });
};

var bootsInTheWorldButtonListener = function() {
  $('.boots-in-the-world-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.boots-in-the-world').offset().top - 50
      },
      1000
    );
  });
};

var bootsOnTheGroundButtonListener = function() {
  $('.boots-button').on('click', function() {
    $('html, body').animate(
      {
        scrollTop: $('.big-picture').offset().top
      },
      1000
    );
  });
};
