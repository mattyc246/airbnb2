$(document).on('turbolinks:load', function(){

  $('#verify-listing').click(function(){
    event.preventDefault();
    var listingId = event.target.value
    var verified = '<button id="verified" class="nav-item btn btn-outline-success m-1"><i class="far fa-check-circle"></i> Verified </button>'
    $.ajax({
      url:`/listings/${listingId}/verify`,
      method: 'POST',
      dataType: 'JSON',
      success: function(data){
        if (data.verified == true){
          $('#verify-listing').remove().fadeOut('slow');
          $('#unverified').replaceWith(verified).fadeIn('slow')
        }
      },
      errors: function(errors){
        console.log(errors);
      }

    })
  })

  var tags = []

  $('.custom-control-input').click(function(e){
    
    if(tags.includes(e.target.value)){

      var index = tags.indexOf(e.target.value)
      tags.splice(index, 1)

    } else {

      tags.push(e.target.value)

    }

    $('#tags-field').val(tags)

  })

})