var getTotal = function (){
  var amount = parseInt($('#quantity-input').val());
  var price = parseFloat($('#product-price span').text());
  // $('#total-amount').val((amount * price).toFixed(2));
  $('#total-amount').text("$"+(amount * price).toFixed(2));
  // $('.stripe-button').attr("data-amount", (amount * price).toFixed(2) )
}

$(document).on('turbolinks:load', function(){
  $('#quantity-input').change(function(){
    getTotal();
  });
});
