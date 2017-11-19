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
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() {
    $("#invoice_new").submit(function(e) {
        if ($("#invoice_merchant_id :selected").val() == "") {
            alert('Merchant cannot be left blank');
            return false;
        }

        if ($('input[name="selections[]"]:checked').length == 0) {
            alert('Please check at least one item');
            return false;
        }

        var $boxes = $('input[name="selections[]"]:checked');
        breakOut = false;
        $boxes.each(function(i){
            var seq = $(this).val()
            if($("#quantity" + seq).val() == ""){
                breakOut = true;
                return false;
            }
        })

        if(breakOut){
            breakOut = false;
            alert('Please enter a quantity');
            return false;
        }
    });

    $(".box_text").keyup(function(){

        $(".box_text").each(function(){

            var x = $(this).attr("id")
            var z = $("#" + x).val()
            if($("#" + x).val() != ""){
                $("." + x).prop('checked',true);

            }else{
                $("." + x).prop('checked',false);

            }
        })
    })
});
