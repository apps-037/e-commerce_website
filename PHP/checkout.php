<?php 
require('top.php');
if(!isset($_SESSION['cart']) || count($_SESSION['cart'])==0){
	?>
	<script>
		window.location.href='index.php';
	</script>
	<?php
}

$cart_total=0;

if(isset($_POST['submit'])){
	$address=get_safe_value($con,$_POST['address']);
	$city=get_safe_value($con,$_POST['city']);
	$pincode=get_safe_value($con,$_POST['pincode']);
	$payment_type=get_safe_value($con,$_POST['payment_type']);
	$user_id=$_SESSION['USER_ID'];
	foreach($_SESSION['cart'] as $key=>$val){
		$productArr=get_product($con,'','',$key);
		$price=$productArr[0]['price'];
		$qty=$val['qty'];
		$cart_total=$cart_total+($price*$qty);
		
	}
	$total_price=$cart_total;
	$payment_status='pending';
	if($payment_type=='cod'){
		$payment_status='success';
	}
	$order_status='pending';
	$added_on=date('Y-m-d h:i:s');
	
	mysqli_query($con,"insert into `order`(user_id,address,city,pincode,payment_type,payment_status,order_status,added_on,total_price) values('$user_id','$address','$city','$pincode','$payment_type','$payment_status','$order_status','$added_on','$total_price')");
	
	$order_id=mysqli_insert_id($con);
	
	foreach($_SESSION['cart'] as $key=>$val){
		$productArr=get_product($con,'','',$key);
		$price=$productArr[0]['price'];
		$qty=$val['qty'];
		
		mysqli_query($con,"insert into `order_detail`(order_id,product_id,qty,price) values('$order_id','$key','$qty','$price')");
	}
	
	unset($_SESSION['cart'])
	?>
	<script>
		window.location.href='thank_you.php';
	</script>
	<?php
	
	
}
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <link rel="stylesheet" href="checkout.css">
</head>

       
       <div id="t2">
        <div class="t11"><b>Your Order</b>
                                    <?php
								$cart_total=0;
								foreach($_SESSION['cart'] as $key=>$val){
								$productArr=get_product($con,'','',$key);
								$pname=$productArr[0]['name'];
								$mrp=$productArr[0]['mrp'];
								$price=$productArr[0]['price'];
								$image=$productArr[0]['image'];
								$qty=$val['qty'];
								$cart_total=$cart_total+($price*$qty);
								?>
        <hr><br><img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$image?>" style="width:70px;" />
                                        <a href="#"><?php echo $pname?></a><a href="javascript:void(0)" onclick="manage_cart('<?php echo $key?>','remove')" style="float:right;"><i class="icon-trash icons"></i></a>
                                        <span class="price" style="float:right;"><b>Price INR: &nbsp&nbsp&nbsp&nbsp  <?php echo $price*$qty?></b></span><br><br>
										     <?php } ?>
        <hr><b><a style="float: right;font-size:24px;">Subtotal: INR <span class="price"><?php echo $cart_total?></span></a></b>
        </div>
    </div>
   
   
    













        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
                                <div class="accordion" style="width:40%;position:absolute;top:30%;left:5%;">
                                    
									<?php 
									$accordion_class='accordion__title';
									if(!isset($_SESSION['USER_LOGIN'])){
									$accordion_class='accordion__hide';
									?>
									<div class="accordion__title">
                                        Checkout Method
                                    </div>
                                    <div class="accordion__body" style="width:100%">
                                        <div class="accordion__body__form">
                            
                                                <div class="col-md" style="width:100%;">
                                                    <div class="checkout-method__login">
                                                        <form id="login-form" method="post">
                                                            <h5 class="checkout-method__title"><b>Login</b></h5>
                                                            <div class="single-input" style="width:60%;">
                                                                <input type="text" name="login_email" id="login_email" placeholder="Your Email*" style="width:100%">
																<span class="field_error" id="login_email_error"></span>
                                                            </div>
															
                                                            <div class="single-input">
                                                                <input type="password" name="login_password" id="login_password" placeholder="Your Password*" style="width:60%">
																<span class="field_error" id="login_password_error"></span>
                                                            </div>
															
                                                            <p class="require">* Required fields</p>
                                                            <div class="dark-btn">
                                                                <button type="button" class="fv-btn" style="background-color:black;" onclick="user_login()">Login</button>
                                                            </div>
															<div class="form-output login_msg">
																<p class="form-messege field_error"></p>
															</div>
                                                        </form>
                                                    <br>
                                              
                                                <div class="col-md" style="width:100%;">
                                                    <div class="checkout-method__login">
                                                        <form action="#">
                                                            <h2 class="checkout-method__title"><h3><b>Register</b></h3></h2><br>
                                                            <div class="single-input">
                                                                <input type="text" name="name" id="name" placeholder="Your Name*" style="width:60%">
																<span class="field_error" id="name_error"></span>
                                                            </div>
															<div class="single-input">
                                                                <input type="text" name="email" id="email" placeholder="Your Email*" style="width:60%">
																<span class="field_error" id="email_error"></span>
                                                            </div>
															
                                                            <div class="single-input">
                                                                <input type="text" name="mobile" id="mobile" placeholder="Your Mobile*" style="width:60%">
																<span class="field_error" id="mobile_error"></span>
                                                            </div>
															<div class="single-input">
                                                                <input type="password" name="password" id="password" placeholder="Your Password*" style="width:60%">
																<span class="field_error" id="password_error"></span>
                                                            </div>
                                                            <div class="dark-btn">
                                                                <button type="button" class="fv-btn" style="background-color:black;" onclick="user_register()">Register</button><br>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
												<br>
                                          
									<?php } ?>
                                  
									<form method="post">
									
										<div class="<?php echo $accordion_class?>">
											payment information
										</div>
										<div class="accordion__body">
											<div class="paymentinfo">
												<div class="single-method">
													COD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="radio" style="width:10%;" name="payment_type" value="COD" required/>
													<br><br><br>PayU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" style="width:10%;" name="payment_type" value="payu" required/>
												</div>
												<div class="single-method">
												  
												</div>
											</div>
										</div>
										 <input style="width:40%;" type="submit" name="submit"/>
									</form>
                                </div>
                          
                   
        						
<?php require('footer.php')?>        