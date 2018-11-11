$(function () {
    sing_allprice()
    allprice1()
    allcheack()
//通过ajax将选中的商品与后台的商品是否被选择一一对应
    $('.tr2-input').each(function () {
        select_status = $(this).prop('checked')
        cart_id = $(this).attr('cart_id')
        console.log(select_status)
        data = {
            'select_status': select_status,
            'cart_id': cart_id,
        }
        $.get('/changecartstatus/', data, function (response) {
            console.log(response.status)
        })
    })


    //计算单个商品的总价
    function sing_allprice() {
        var sum = 0;
        $('.ttr').each(function () {
            $num = $(this).find('input').eq(1).val();
            $price = $(this).find('td').eq(2).attr('price');
            if ($(this).find('input').eq(0).prop('checked')) {
                $sing_all = $num * $price;
                $(this).find('td').eq(4).text($sing_all)
            } else {
                $(this).find('td').eq(4).text(0)
            }
        })
    }


// 每次点击前面的选中按钮就执行一次 价格计算
    $('.ttr').find('input[class=tr2-input]').click(function () {
        sing_allprice()
        allprice1()
    })

// 计算总价函数
    function allprice1() {
        var all_sum = 0
        $('.ttr').each(function () {
            sing_allprice1 = $(this).find('td').eq(4).text()
            console.log(sing_allprice1)
            // 判断 判断单类商品是否存在，因为在购物车中减商品到0时，会出现NaN
            if (sing_allprice1) {

                all_sum += parseInt(sing_allprice1)
            }

            console.log(all_sum)
        })
        $('.area-go-pay').find('strong').html(all_sum)
    }

// 商品加操作
    $(".num-add").click(function () {
        var num = 1
        var shoes_id = $(this).attr('shoes_id')
        var $that = $(this)
        data = {
            'num': num,
            'shoes_id': shoes_id
        }
        $.get('/addcart/', data, function (response) {


            if (response.status == 0) {
                // 未登录
                window.open('/login/', target = "_self")
            } else if (response.status == 1) {
                $that.prev().val(response.num)// 添加成功


            }

            sing_allprice()
            allprice1()

        })
    });

//商品减操作
    $(".num-minus").click(function () {


        var shoes_id = $(this).attr('shoes_id')
        var $that = $(this)
        $.get('/subcart/', {'shoes_id': shoes_id}, function (response) {

            if (response.status == 1) {
                var num = response.num

                $that.next().val(num)

            } else if (response.status == 0) {
                $that.parent().parent().empty()

            }
        })


    });

// 修改单个选中状态
    $('.tr2-input').click(function () {
        select_status = $(this).prop('checked')
        cart_id = $(this).attr('cart_id')
        data = {
            'select_status': select_status,
            'cart_id': cart_id,
        }

        $.get('/changecartstatus/', data, function (response) {
            console.log(response.status)
        })
        allcheack()
    })


// 全选/取消全选
    $('.js-select-all').click(function () {
        $select_all_status = $(this).prop('checked')
        if ($select_all_status) {
            $('input[type=checkbox]').prop('checked', $select_all_status)
        } else {
            $('input[type=checkbox]').prop('checked', false)
        }
        data = {
            'select_status': $select_all_status,
        }
        $.get('/changecartselect/', data, function (response) {
            console.log(response.status)
        })
        sing_allprice()
        allprice1()
    });


    setInterval(total, 100)

    function total() {
        sing_allprice()
        allprice1()
    }

//动态刷新主页上的购物车物品种类数
    setInterval(flush, 100)

    function flush() {

        $.get('/dynflashnum/', function (response) {
            num = response.num

            $('.count_num').html(num)


        })
    }

    function allcheack() {

        var allcheack_tatus = true
        $('.tr2-input').each(function () {

            statusq = $(this).prop('checked')

            if (~statusq) {

                allcheack_tatus = false
            }
        })

        if (allcheack_tatus) {
            $('.js-select-all').prop('checked', true)
        }
        else {
            $('.js-select-all').prop('checked', false)
        }
    }
    // 下单
     $('#js-go-pay').click(function () {
        $.get('/generateorder/', function (response) {

            if (response.status == 1){  // 跳转到订单详情

                window.open('/order/'+response.identifier +
                '/', target='_self')
            }
        })
    })
})

