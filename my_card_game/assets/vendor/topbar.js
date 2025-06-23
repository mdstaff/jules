// topbar.js
// Simple progress bar, often used with Phoenix LiveView

(function (global) {
  "use strict";

  var topbar = {};
  var canvas, progressTimerId, fadeTimerId, currentProgress, showing,
      options = {
        autoRun: true,
        barThickness: 3,
        barColors: {
          0: "rgba(26,  188, 156, .7)",
          ".3": "rgba(41, 128, 185, .7)",
          "1.0": "rgba(241, 196, 15,  .7)"
        },
        shadowBlur: 5,
        shadowColor: "rgba(0,   0,   0,   .5)",
        className: null, // Used to specify a custom class name for the canvas element
      };

  topbar.config = function (opts) {
    for (var key in opts) {
      if (options.hasOwnProperty(key)) {
        options[key] = opts[key];
      }
    }
  };

  topbar.show = function () {
    if (showing) return;
    showing = true;
    if (fadeTimerId !== null) clearTimeout(fadeTimerId);
    if (!canvas) {
      canvas = document.createElement("canvas");
      var style = canvas.style;
      style.position = "fixed";
      style.top = "0";
      style.left = "0";
      style.right = "0";
      style.zIndex = "99999"; // High z-index to ensure it's on top
      if (options.className) {
        canvas.classList.add(options.className);
      }
      document.body.appendChild(canvas);
    }
    if (options.autoRun) {
      currentProgress = 0;
      progressTimerId = setInterval(function () {
        if (currentProgress >= 0.95) { // Cap progress to avoid reaching 100% too soon
          clearInterval(progressTimerId);
          progressTimerId = null;
          return;
        }
        var M = Math;
        var incr = M.random() * 0.05; // Smaller increments
        currentProgress = M.min(0.95, currentProgress + incr);
        draw(currentProgress);
      }, 200); // Slower interval
    }
  };

  topbar.hide = function () {
    if (!showing) return;
    showing = false;
    if (progressTimerId !== null) {
      clearInterval(progressTimerId);
      progressTimerId = null;
    }
    fadeTimerId = setTimeout(function () {
      if (canvas) {
        canvas.style.opacity = "0";
        setTimeout(function () {
          if (canvas) { // Check again in case it was removed
            canvas.remove();
            canvas = null;
          }
        }, 500); // Wait for fade out animation
      }
    }, 100); // Small delay before starting fade
  };

  topbar.progress = function (to) {
    if (!showing) return topbar.show();
    if (to === undefined) return currentProgress;
    draw(to);
    currentProgress = to;
  };

  function draw(progress) {
    if (!canvas) return;
    var W = window.innerWidth;
    var H = options.barThickness;
    canvas.width = W;
    canvas.height = H;
    canvas.style.opacity = "1"; // Ensure it's visible when drawing

    var ctx = canvas.getContext("2d");
    ctx.shadowBlur = options.shadowBlur;
    ctx.shadowColor = options.shadowColor;

    var lineargradient = ctx.createLinearGradient(0, 0, W, H);
    for (var stop in options.barColors) {
      lineargradient.addColorStop(parseFloat(stop), options.barColors[stop]);
    }
    ctx.fillStyle = lineargradient;
    ctx.fillRect(0, 0, W * progress, H);
  }

  if (typeof exports === "object" && typeof module !== "undefined") {
    module.exports = topbar;
  } else if (typeof define === "function" && define.amd) {
    define(topbar);
  } else {
    global.topbar = topbar;
  }
})(typeof window !== "undefined" ? window : this);
