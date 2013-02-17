/////搜索建议项
 $(function() {
    var availableTags = [
      "周杰伦",
      "林俊杰",
      "阿桑",
      "张敬轩",
      "李玖哲",
      "孙燕姿",
      "梁静茹",
      "李宇春",
      "张靓颖",
      "萧亚轩",
      "王若琳",
      "蔡健雅",
      "JS",
      "五月天",
      "SHE",
      "王力宏",
      "陈奕迅",
      "范玮琪",
      "by2",
      "许嵩",
      "徐良",
      "蔡依林",
	  '萧敬腾',
	  '林宥嘉',
	  '方大同',
	  '张震岳',
	  '光良',
	  '陶喆',
	  '方炯镔',
	  '张国荣',
	  '李克勤',
	  '萧煌奇',
	  '张学友'
    ];
    $( "#search" ).autocomplete({
      source: availableTags
    });
  }); 
  ////自动填充提示
    $(function() {
    $( document ).tooltip({
	  track: true,
      position: {
        my: "center bottom-20",
        at: "center top",
	    
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        }
      }
    });
  });
  
  /////注册使用
   $(function() {
    var name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips(  n + "的长度必须在" +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 350,
      width: 350,
      modal: true,
      buttons: {
        "注册Ting": function() {
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
 
          bValid = bValid && checkLength( name, "用户名", 3, 16 );
          bValid = bValid && checkLength( email, "邮箱", 6, 80 );
          bValid = bValid && checkLength( password, "密码", 5, 16 );
 
          bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "用户名可以包含a-z, 0-9, 下划线, 以字母开头." );
          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
          bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "邮箱格式如 hello@music.com" );
          bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "密码只可以包含 : a-z 0-9" );
 
          if ( bValid ) {
            $( "#users tbody" ).append( "<tr>" +
              "<td>" + name.val() + "</td>" + 
              "<td>" + email.val() + "</td>" + 
              "<td>" + password.val() + "</td>" +
            "</tr>" ); 
            $( this ).dialog( "close" );
          }
        },
        "取消": function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
 
    $( "#create-user" )
      .button()
      .click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  /////日期
  $(function() {
    $( "#datepicker" ).datepicker( {dateFormat: 'yy-mm-dd'} );
  });
  
  /////登录
   $(function() {
    var email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( email ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips(  n + "的长度必须在" +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    $( "#dialog-form1" ).dialog({
      autoOpen: false,
      height: 350,
      width: 350,
      modal: true,
      buttons: {
        "登录Ting": function() {
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
          bValid = bValid && checkLength( email, "邮箱", 6, 80 );
          bValid = bValid && checkLength( password, "密码", 5, 16 );
 
          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
          bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "邮箱格式如 hello@music.com" );
          bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "密码只可以包含 : a-z 0-9" );
 
          if ( bValid ) {
            $( "#users tbody" ).append( "<tr>" +
              
              "<td>" + email.val() + "</td>" + 
              "<td>" + password.val() + "</td>" +
            "</tr>" ); 
            $( this ).dialog( "close" );
          }
        },
        "取消": function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
 
    $( "#login-user" )
      .button()
      .click(function() {
        $( "#dialog-form1" ).dialog( "open" );
      });
  });
  ////关于提示框
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
  