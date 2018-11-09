$(function () {
    var count = 0
    $('#verifycode').click(function () {
       count ++
        $(this).attr('src','/verifycode/'+count+'/')
})





})
