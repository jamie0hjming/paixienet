$(function () {
    $('.box-nun a.num-add').click(function () {
    var $shoes_id = $(this).attr('shoes_id')
        var $that = $(this)
        var num = 1
        $.get('/addcart/', {'num': 1,'shoes_id':'shoes_id'}, function (response) {
            $that.prev().val(response.num)


            // if (response.status == 0) {
            //     // 未登录
            //     window.open('/login/', target = "_self")
            // } else if (response.status == 1) {
            //     $that.prev().val(response.num)// 添加成功
            // }
        })
    })



    //
    //
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






})

