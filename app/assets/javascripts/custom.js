document.addEventListener("DOMContentLoaded",() => {

  // Get all "navbar-burger" elements
  var $navbarBurgers = document.querySelectorAll('.navbar-burger');

  // Check if there are any navbar burgers
    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.onclick = () => {

        // Get the target from the "data-target" attribute
        var target = el.dataset.target;
        var $target = document.getElementById(target);

        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      };
    });
  

});