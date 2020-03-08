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
//= require jquery3
//= require_tree .
//= require activestorage
//= require bootstrap.min
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js
//= require jquery.slick
//= require search
//= require custom

$(function() {
    $('.slick-slider').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        mobileFirst: true
    })
})

$(function() {
    $('.slick-slider').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        mobileFirst: true
    })

    $('.datepicker').datepicker({
        format: 'dd-mm-yyyy'
    });
})

$(document).ready(function() {
    var uri = window.location.pathname;
    $("#menu-item-1792").removeClass("current-menu-item");
    $("#menu-item-1539").removeClass("current-menu-item");
    $("#menu-item-1537").removeClass("current-menu-item");
    $("#menu-item-1").removeClass("current-menu-item");
    $("#menu-item-2").removeClass("current-menu-item");
    if (uri == "/search") {
        $("#menu-item-1537").addClass("current-menu-item");
    } else if (uri == "/bai-viet-moi") {
        $("#menu-item-1539").addClass("current-menu-item");
    } else if (uri == "/") {
        $("#menu-item-1792").addClass("current-menu-item");
    } else if (uri == "/danh-muc/dang-ban") {
        $("#menu-item-1").addClass("current-menu-item");
    } else if (uri == "/chia-se-kinh-nghiem") {
        $("#menu-item-2").addClass("current-menu-item");
    }
})

$(document).scroll(function() {
    console.log("ok")
    var top_current = $(window).scrollTop();
    if (top_current > 0) {
        $('#go-top').css("display", "block");
    } else {
        $('#go-top').css("display", "none");
    }
})