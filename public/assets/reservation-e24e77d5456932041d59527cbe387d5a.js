$(document).ready(function() {
      $('#onewayfrom1').hide();
      $('#onewayfrom2').hide();
      $('#onewayfrom3').hide();
      $('#onewayfrom4').hide();

      $('#reservation_passengers').change(function(){
        if($('#reservation_passengers option:selected').val()=="2"){
        $('#onewayfrom1').show();
        $('#onewayfrom2').show();
        $('#onewayfrom3').show();
        $('#onewayfrom4').show();
        }
        else if($('#reservation_passengers option:selected').val()=="3")
        {
        $('#onewayfrom1').show();
        $('#onewayfrom2').show();
        $('#onewayfrom3').show();
        $('#onewayfrom4').show();
        }
        else if($('#reservation_passengers option:selected').val()=="4")
        {
        $('#onewayfrom1').show();
        $('#onewayfrom2').show();
        $('#onewayfrom3').show();
        $('#onewayfrom4').show();
        }
        else if($('#reservation_passengers option:selected').val()=="5")
        {
          $('#onewayfrom1').show();
          $('#onewayfrom2').show();
          $('#onewayfrom3').show();
          $('#onewayfrom4').show();
        }
        else if($('#reservation_passengers option:selected').val()=="6")
        {
          $('#onewayfrom1').show();
          $('#onewayfrom2').show();
          $('#onewayfrom3').show();
          $('#onewayfrom4').show();
        }
        else
        {

          $('#onewayfrom1').hide();
          $('#onewayfrom2').hide();
          $('#onewayfrom3').hide();
          $('#onewayfrom4').hide();
        }

      });

});

