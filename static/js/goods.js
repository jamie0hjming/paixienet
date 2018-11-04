$(function () {

    var bi = $(".imglist li")
    for (var i = 0; i < bi.length; i++) {
        $(".imglist li").eq(i).mouseenter(function () {

            $(".bigimg").find("img").eq($(this).index()).css("display", "block").siblings().css("display", "none");
            // $('.bbigimg').css('background-image','url('+{% static %}))

            $(this).css("border", "1px solid red").siblings().css("border", '1px solid #e7e7e7')

        })
    }

    $(".imglist li a").eq(0).mouseenter(function () {
        $(".bigimg").attr("display", "block");
    })


    $(".sumbox i.num-up").click(function () {
        var buy_num = $(".sumbox input").val();
        buy_num++;
        $(".sumbox input").val(buy_num);
    });
    $(".sumbox i.num-down-no").click(function () {

        var buy_num = $(".sumbox input").val();
        if (buy_num == 1) {
            $(".sumbox input").val();
        } else {
            buy_num--;
            $(".sumbox input").val(buy_num);
        }

    })


})

//放大镜
$(function () {

    var _smallImg = $(".bigimg"); //小图
    var _smallArea = $("#smallArea"); //小区域
    var _bigImg = $(".bbigimg"); //大图
    var _bigArea = $("#bigArea"); //大区域
    console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAA")
    //bigImg.width / smallImg.width = bigArea.width/smallArea.width
    //smallArea.width = bigArea.width * smallImg.width / bigImg.width
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

        console.log('BBBBBBBBBBBBB')
        //移动小区域
        _smallArea.css({left: x, top: y});

        //移动大图
        _bigImg.css({left: -x * scale, top: -y * scale});

    })
    _smallImg.mouseleave(function () {
        _bigImg.css("display", "none")
        console.log('MOUSELEAVE')
    })

    //mouseleave
    _smallImg.mouseleave(function () {
        _smallArea.hide(); //隐藏小区域
        $("#bigArea").hide()
        console.log('AREALEAVE')
    })


    console.log('CCCCCCCCCCCCCCCCCCCCC')
})
































