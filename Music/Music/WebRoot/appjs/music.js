/////ÈÕÆÚ
  $(function() {
    $( "#datepicker" ).datepicker( {dateFormat: 'yy-mm-dd'} );
  });
 $.fx.speeds._default = 1000;
  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: "blind",
	  
      hide: "clip"
    });
 $( "#opener" ).click(function() {
      $( "#dialog" ).dialog( "open" );
      return false;
    });
  });
 ///////
 