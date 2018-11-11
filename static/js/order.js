$(function () {
    sing_allprice()
    allprice1()
        //计算单个商品的总价
    function sing_allprice() {
        var sum = 0;
        $('.ttr').each(function () {

            var $num = $('.ttr .box-num').eq(2).text();

            var $price = $('.ttr .box-price').eq(1).prop('price');


            $sing_all = $num * $price;

            $(this).find('td').eq(3).text($sing_all)
        })
    }

  // 计算总价函数
     function allprice1() {
        var all_sum = 0
        $('.ttr').each(function () {
            sing_allprice1 = $(this).find('td').eq(4).text()

            // 判断 判断单类商品是否存在，因为在购物车中减商品到0时，会出现NaN
            if (sing_allprice1) {

                all_sum += parseInt(sing_allprice1)
            }


        })
        $('.area-go-pay').find('strong').html(all_sum)
    }

})