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
//
//= require rails-ujs
//= require_tree .

document.getElementById("statisticsButton").addEventListener("click", showStatistics);
function showStatistics()
{ if (document.getElementById("statisticsButton").classList.contains("rotated")
  { document.getElementById("statisticsButton").classList.add("unrotated")
    document.getElementById("statisticsButton").classList.remove("rotated")
    document.getElementById("statistics").classList.add("hidden")
    document.getElementById("statistics").classList.remove("unhidden")
  } else
  { document.getElementById("statisticsButton").classList.add("rotated")
    document.getElementById("statisticsButton").classList.remove("unrotated")
    document.getElementById("statistics").classList.add("unhidden")
    document.getElementById("statistics").classList.remove("hidden")
  }

}