$(document).ready(function() {
  $('#onewayfrom2').hide();
  $('#onewayfrom3').hide();
  $('#onewayfrom4').hide();


  $('#reservation_service_type').change(function(){
    if($('#reservation_service_type option:selected').val()=="2"){
      $('#onewayfrom2').show();
      $('#onewayfrom3').show();
      $('#onewayfrom4').show();
    }
    else if($('#reservation_service_type option:selected').val()=="3")
  {
    $('#onewayfrom2').hide();
    $('#onewayfrom3').hide();
    $('#onewayfrom4').hide();

  }
    else
  {$('#onewayfrom2').hide();
    $('#onewayfrom3').hide();
    $('#onewayfrom4').hide();


  }

  });

});
