$(function () {
    var sing_price = 0
    var money = 0

    $('#js-go-pay').click(function () {

        var  identifier = $(this).attr('identifier')
        alert(identifier)

        $.get('/pay/',{'identifier':identifier},function (response) {
            alert(11111111111111111)
            alert(response['alipay_url'])
              window.open(response['alipay_url'], target='_self')
        })
    })


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