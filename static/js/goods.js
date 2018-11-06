$(function () {

    var bi = $(".imglist li");
    var $big_img_path = bi.find('img').eq(0).attr('src');
    $('.bbigimg img').attr('src', $big_img_path).css('display', 'block');
    for (var i = 0; i < bi.length; i++) {
        bi.eq(i).mouseenter(function () {
            $(".bigimg").find("img").eq($(this).index()).css("display", "block").siblings().css("display", "none");

            $(this).css("border", "1px solid red").siblings().css("border", '1px solid #e7e7e7');
            var $big_img_path = $(this).find('img').eq(0).attr('src');
            $('.bbigimg img').attr('src', $big_img_path).css('display', 'block');

        })
    }
// 增加商品

////////////////////////////////////////////////////////////////////////////////////////


    // $(".num-up").click(function () {
    //
    //
    //     var shoes_id = $(this).attr('shoes_id')
    //
    //     var $that = $(this)
    //
    //     $.get('/addcart/', {'shoes_id': shoes_id}, function (response) {
    //
    //
    //         if (response.status == 0) {
    //             // 未登录
    //             window.open('/login/', target = "_self")
    //         } else if (response.status == 1) {
    //             $that.prev().val(response.num)// 添加成功
    //
    //
    //         }
    //
    //     })
    //
    //
    // })
    //
    // $(".num-down").click(function () {
    //
    //
    //     var shoes_id = $(this).attr('shoes_id')
    //     var $that = $(this)
    //     $.get('/subcart/', {'shoes_id': shoes_id}, function (response) {
    //         if (response.status == 1) {
    //             var num = response.num
    //             if (num > 0) {
    //                 $that.next().val(num)
    //             }
    //         }
    //
    //     })
    //
    // })


////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////


    // 本地添加商品数量

    $(".sumbox i.num-up").click(function () {
        var num_up = $(".sumbox input").val();
        num_up++;
        $(".sumbox input").val(num_up);
    });
    $(".sumbox i.num-down-no").click(function () {

        var num_down = $(".sumbox input").val();
        if (num_down == 1) {
            $(".sumbox input").val();
        } else {
            num_down--;
            $(".sumbox input").val(num_down);
        }

    });

    // 点击加入购物车按钮将商品信息及商品数量添加到数据库中
    $('.buttonbox .borg').click(function () {
        var $num = $(".sumbox input").val()
        var shoes_id = $('.num-up').attr('shoes_id')
        $.get('/addcart/', {'shoes_id': shoes_id,'num':$num}, function (response) {
            if (response.status ==1){
                $(".sumbox input").val(0)
            }else {
                window.open('/login/', target="_self")
            }

        })

    })


       $('.buttonbox a').click(function () {
        var $num = $(".sumbox input").val()
        var shoes_id = $('.num-up').attr('shoes_id')
        $.get('/addcart/', {'shoes_id': shoes_id,'num':$num}, function (response) {
            if (response.status ==1){
                $(".sumbox input").val(0)
            }else {
                window.open('/login/', target="_self")
            }

        })

    })


///////////////////////////////////////////////////////////////////////////////////////


//放大镜
    $(function () {

        var _smallImg = $(".bigimg"); //小图
        var _smallArea = $("#smallArea"); //小区域
        var _bigImg = $(".bbigimg"); //大图
        var _bigArea = $("#bigArea"); //大区域

        //计算小区域的宽高
        //width() == innnerWidth() == outerWidth()
        _smallArea.width(_bigArea.width() * _smallImg.width() / _bigImg.width());
        _smallArea.height(_bigArea.height() * _smallImg.height() / _bigImg.height());

        //放大系数/放大倍数
        var scale = _bigImg.width() / _smallImg.width();
        //scale = 4


        //mousemove
        _smallImg.mousemove(function (e) {
            _smallArea.show(); //显示小区域
            _bigArea.show();
            _bigImg.css("display", "block")

            //clientX: 可视区域的x值
            //pageX: 距离窗口左边的x值
            var x = e.pageX - _smallImg.offset().left - _smallArea.width() / 2;
            var y = e.pageY - _smallImg.offset().top - _smallArea.height() / 2;
            //console.log(e.clientX);
            //console.log(e.pageX);

            //控制小区域范围在小图内
            if (x <= 0) { //不超出左边
                x = 0;
            }
            else if (x >= _smallImg.width() - _smallArea.width()) { //不超出右边
                x = _smallImg.width() - _smallArea.width();
            }
            if (y <= 0) { //不超出上边
                y = 0;
            }
            else if (y >= _smallImg.height() - _smallArea.height()) { //不超出下边
                y = _smallImg.height() - _smallArea.height();
            }

            //移动小区域
            _smallArea.css({left: x, top: y});

            //移动大图
            _bigImg.css({left: -x * scale, top: -y * scale});

        })
        _smallImg.mouseleave(function () {
            _bigImg.css("display", "none")

        })

        //mouseleave
        _smallImg.mouseleave(function () {
            _smallArea.hide(); //隐藏小区域
            $("#bigArea").hide()

        })


    })

})































