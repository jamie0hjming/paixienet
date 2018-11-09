$(function() {
  //从cookie中获取购物车的所有商品
				var arr = $.cookie("cart");
				
				if (arr) {
					arr = JSON.parse(arr); 

					
									var $kk = $(".cart-box-current td input[checked=checked]").eq(0).parent().siblings(".box-allprice");
									
										var kk =parseInt($kk.text());
										$(".money").text(kk);
									
									
									
//									console.log(kk+zz)

					$("tr").eq(1).find(".box-operate a").click(function(){
						$(this).parent().parent().hide();
					
//									var $zz = $(".cart-box-current td input[checked=checked]").eq(1).parent().siblings(".box-allprice");
							
//									var zz = parseInt($zz.text());
//									console.log(zz)
//									var xx = zz;
									$(".money").text(0.00);
//									console.log(kk+zz)
					})
//					$("tr").eq(2).find(".box-operate a").click(function(){
						$(this).parent().parent().hide();
					};
					
					$("#clear-cart").click(function(){
								$.cookie("cart", "", {expires:0, path:"/"}); //清空cookie
					});
//					console.log($.cookie())
					
					var num = $(".num-text").val();
					var nums = parseInt(num);
					
					$(".num-add").click(function(){
								nums = nums+1;
								$(this).siblings().val(nums);
								var y = parseInt($(this).parent().prev().html()) ;
//								console.log(y);
								var x = nums*y ;
//								console.log(x);
								$(this).parent().next().text(x);
								
								var $kk = $(".cart-box-current td input[checked=checked]").eq(0).parent().siblings(".box-allprice");
							
//									var $zz = $(".cart-box-current td input[checked=checked]").eq(1).parent().siblings(".box-allprice");
									
									
									var kk =parseInt($kk.text());
//									var zz = parseInt($zz.text());
//									var xx = kk + zz;
											$(".money").text(kk);
//							console.log($kk.text());
//							console.log($zz.text());
									
									
										var $aa = $(".cart-box-current td input[checked=checked]").eq(0).parent().siblings(".box-num input").val();
								var $gg = $(".cart-box-current td input[checked=checked]").eq(1).parent().siblings(".box-num input").val();
								
									var aa =parseInt($aa);
									var gg = parseInt($gg);
									console.log(gg)
									var cc = aa + gg;
									$(".total").text(cc);
						})
					
					
						$(".num-minus").click(function(){
							if(nums<=1){
								return;
							}
							else{
								nums = nums-1;
								$(this).siblings().val(nums);
								var y = parseInt($(this).parent().prev().html()) ;
//								console.log(y);
								var x = nums*y ;
//								console.log(x);
								$(this).parent().next().text(x);
									var $kk = $(".cart-box-current td input[checked=checked]").eq(0).parent().siblings(".box-allprice");
							
//									var $zz = $(".cart-box-current td input[checked=checked]").eq(1).parent().siblings(".box-allprice");
									
									var kk =parseInt($kk.text());
//									var zz = parseInt($zz.text());
//									var xx = kk + zz;
									$(".money").text(kk);
//							console.log($kk.text());
//						console.log($zz.text());


								var $aa = $(".cart-box-current td input[checked=checked]").eq(0).parent().siblings(".box-num");
								var $bb = $(".cart-box-current td input[checked=checked]").eq(1).parent().siblings(".box-num");
									var aa =parseInt($aa.val());
									console.log(aa);
									var bb = parseInt($bb.val());
									var cc = aa + bb;
									$(".total").text(cc);
									
										var $aa = $(".cart-box-current td input[checked=checked]").eq(0).parent().siblings(".box-num input").val();
								var $gg = $(".cart-box-current td input[checked=checked]").eq(1).parent().siblings(".box-num input").val();
								
									var aa =parseInt($aa);
									var gg = parseInt($gg);
									console.log(gg)
									var cc = aa + gg;
									$(".total").text(cc);
							}
								
						})
						
						$("#js-go-pay").click(function(){
							alert("请确认是否购买该商品");
						})
							


				}
				
							
							
)




























