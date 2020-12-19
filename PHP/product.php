<?php 
require('top.php');
if(isset($_GET['id'])){
	$product_id=mysqli_real_escape_string($con,$_GET['id']);
	if($product_id>0){
		$get_product=get_product($con,'','',$product_id);
	}else{
		?>
		<script>
		window.location.href='index.php';
		</script>
		<?php
	}
}else{
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}
?>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <link rel="stylesheet" href="product.css">
</head>


    
       <div id="t1">
           <div class="t11">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$get_product['0']['image']?>" style="width:200px;"></div>
       </div>
       <div id="t2">
        <div class="t11"><b>Name</b><br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi at facere minima cupiditate, sed molestiae nesciunt tempora excepturi. Odit magni aliquam aspernatur, voluptates inventore ullam nisi veniam ex fugiat nobis!</div>
    </div>
    <div id="t3">
        <div class="t11"><b>Features</b><br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore molestias nisi soluta assumenda? Fuga consectetur dicta ea eos explicabo fugit laborum minus, dolore totam, hic nisi nemo adipisci dignissimos odio?
        <br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat, eius aut. Vero itaque laborum iure eius nam dolorum temporibus cupiditate debitis nisi! Quis, saepe pariatur? Repudiandae reprehenderit amet animi ducimus.
        <br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit aliquid nulla maiores, repellat mollitia incidunt adipisci voluptates? Assumenda ipsum, ad eveniet pariatur molestiae atque ex officia veniam saepe magnam accusantium?
        </div>
    </div>
    <div id="t4">
        <div class="t11"> <h3><b><?php echo $get_product['0']['name']?></b></h3><br>Starting at: <b>INR  </b><?php echo $get_product['0']['price']?><br><br> Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sequi, sunt dolorum? Tempora nobis quas consequuntur repellendus, quasi rem architecto odio doloremque, rerum delectus expedita ullam ipsa saepe non optio cumque.
		
		
		<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
		</div>
    
	</div>
    <div id="t5">
        <div class="t11"><b>Description</b><br><br> <?php echo $get_product['0']['description']?> </div>
    </div>
    <div id="t6">
        <div class="t12">
            <div class="t111"style="text-align: left; font-size: 23px;padding:10px"><b>Basic Package</b></div>
            <div class="t112" style="text-align: center; font-size: 40px;padding:10px;">Rs. 1500</div><br>
            Feature One<hr>Feature Two<hr> Feature Three<hr>Feature Four<hr>Feature Five<br><br>
           	<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
        </div>
    </div>
    <div id="t7">
        <div class="t12">
            <div class="t111"style="text-align: left; font-size: 23px;padding:10px"><b>Basic Package</b></div>
            <div class="t112" style="text-align: center; font-size: 40px;padding:10px;">Rs. 1500</div><br>
            Feature One<hr>Feature Two<hr> Feature Three<hr>Feature Four<hr>Feature Five<br><br>
            	<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
        </div>
    </div>
    <div id="t8">
        <div class="t12">
            <div class="t111"style="text-align: left; font-size: 23px;padding:10px"><b>Basic Package</b></div>
            <div class="t112" style="text-align: center; font-size: 40px;padding:10px;">Rs. 1500</div><br>
            Feature One<hr>Feature Two<hr> Feature Three<hr>Feature Four<hr>Feature Five<br><br>
            	<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
        </div>
    </div>


    
     

 <!-- Start Bradcaump area -->

               
      
        
										
<?php require('footer2.php')?>        