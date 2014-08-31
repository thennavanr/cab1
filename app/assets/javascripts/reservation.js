$(document).ready(function() {
      $('#onewayfrom2').hide();
      $('#onewayfrom3').hide();
      $('#onewayfrom4').hide();
      

      $('#reservation_servicetype').change(function(){
        if($('#reservation_servicetype option:selected').val()=="1"){
        $('#onewayfrom2').hide();
        $('#onewayfrom3').hide();
        $('#onewayfrom4').hide();
        }
        else if($('#reservation_servicetype option:selected').val()=="2")
        {
        $('#onewayfrom2').show();
        $('#onewayfrom3').show();
        $('#onewayfrom4').show();
        }
        else if($('#reservation_servicetype option:selected').val()=="3")
        {
        $('#onewayfrom2').hide();
        $('#onewayfrom3').hide();
        $('#onewayfrom4').hide();
        }
        else
        {

        $('#onewayfrom2').hide();
        $('#onewayfrom3').hide();
        $('#onewayfrom4').hide();
        }

      });

});

