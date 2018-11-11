$(function(){
    var $form = $(".form");
    var $formdiv = $(".form .base-text");
    console.log($formdiv.length);
    var $reguserinput = $(".register-area .login-text:eq(0)");
    var $regpwdinput = $(".register-area .login-text:eq(1)");
    var $regpwdinputVerify_ = $(".register-area .login-text:eq(2)");
    var $codearea = $(".register-area .login-text:eq(3)");




    //同意服务协议
    var $agreement = $(".agreement input");
    $agreement.click(function(){
        //console.log(!$agreement.attr('checked'));
        //if(!$agreement.attr('checked')){
        //    alert(1)
        //}
    });
    
    //注册按钮
    var $registerbtn = $(".blue-button");
    $registerbtn.click(function(){
        var $regusername = $reguserinput.val();
        var $regpassword = $regpwdinput.val();


        console.log($regusername)
        if($regusername == "" && $regpassword == ""){
            $formdiv.addClass("base-text error").next().removeClass("v-info").addClass("v-error");
            return false;
        } else {
            $.cookie("name", $regusername);
            $.cookie("password", $regpassword);
            alert("注册成功!");
            // window.location.href = "login.html";
            window.location.href = '';
        }
    });





    var $loginbtn = $(".orange-button");
    var $loginuserinput = $(".login-area .login-text:eq(0)");
    var $loginpwdinput = $(".login-area .login-text:eq(1)");
    var $loginusernamebox = $(".login-area .username");
    var $loginusernamev = $loginusernamebox.next();
    var $loginpwdbox = $(".login-area .password");
    var $loginpwdv = $loginpwdbox.next();

    //登录按钮




    //微信登录二维码
    var $way = $(".way");
    var $wechatbox = $(".wechatbox");
    $way.click(function(){
        $form.hide();
        $wechatbox.fadeIn();
    })

});










