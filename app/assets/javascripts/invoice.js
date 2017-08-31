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
});