$(function () {
    var sing_price = 0
    var money = 0
    $('.ttr').each(function () {
        var price = $(this).find('#price').attr('price')


        var num = $(this).find('#box-num-id').text()

        sing_price = price * num
        $(this).find('.box-allprice').text('￥'+sing_price)
        money += sing_price
    })
    $('.area-go-pay .money').html(money)
    setInterval(flush, 100)

    function flush() {

        $.get('/dynflashnum/', function (response) {
            num = response.num

            $('.count_num').html(num)


        })
    }
})