<?php 
require('top.php');



$cat_res2=mysqli_query($con, "select sub_categories.* from sub_categories,categories where categories.id=sub_categories.categories_id");
$cat_arr2=array();

while($row2=mysqli_fetch_assoc($cat_res2)){
	$cat_arr2[]=$row2;	
}

if(!isset($_GET['sub_id']) && $_GET['sub_id']!=''){
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}

$cat_id=mysqli_real_escape_string($con,$_GET['sub_id']);

$pro_id=mysqli_query($con, "select product.* from product");
$pro_ids=array();
while($row2=mysqli_fetch_assoc($pro_id)){
	$pro_ids[]=$row2;	
}

$price_high_selected="";
$price_low_selected="";
$new_selected="";
$old_selected="";
$sort_order="";
if(isset($_GET['sort'])){
	$sort=mysqli_real_escape_string($con,$_GET['sort']);
	if($sort=="price_high"){
		$sort_order=" order by product.price desc ";
		$price_high_selected="selected";	
	}if($sort=="price_low"){
		$sort_order=" order by product.price asc ";
		$price_low_selected="selected";
	}if($sort=="new"){
		$sort_order=" order by product.id desc ";
		$new_selected="selected";
	}if($sort=="old"){
		$sort_order=" order by product.id asc ";
		$old_selected="selected";
	}

}

if($cat_id>0){
	$get_product=get_product($con,'',$cat_id,'','',$sort_order);
}else{
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}										
?>


<style>
    .sidenav{
		position:absolute;
		left:90%;
		right:0%;
		top:0;
	}
    #form {
        position: relative;
        right: 0%;
        transition: 0.3s;
        padding: 15px;
        height: 420px;
        width: 100px;
        text-decoration: none;
        font-size: 20px;
        color: white;
      }

.mt--30{
position:absolute;top:300px;left:15%;
height:400px;
 width: 70%;
    overflow-x: auto;
    overflow-y: none;
display:inline-flex;

}
  .mt--30::-webkit-scrollbar{
          width:0;
      }
 div#web2 {
        position: relative;
        top: 30%; left: 54%;  
       
    }
    img#web2d {
        position: relative;
        width: 240%;
        top: 10px; left: 10px; right: 10px; bottom: 10px;
    }
	
	  
      
</style> 




	  <?php if( $cat_id==2){								  ?>
									<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="web.css">
</head>
<body>
 <div id="web2" style="    position: relative;
        left: 54%;        width: 300px; ">
                <img id="web2d" src="images/app.png" style=" position: relative;
        top: 100px; left: 10px; right: 10px; bottom: 10px;">
            </div>
 
<div id="wr1">
            <h1>App Development Dynamic</h1><br>
            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos consectetur itaque ducimus! Nam alias facere minima quia beatae. Adipisci minus cupiditate suscipit, inventore a quisquam magni libero vel praesentium expedita!
            </p>
         
            </div>
       
                        <div class=" mt--30" >
							<?php
							$get_product=get_product($con,10);

							foreach($get_product as $list){
								if($list['sub_id']==2){
							?>
                            <!-- Start Single Category -->
                            <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12" style="width:40%; height:100px;">
                                <div class="category" style="width:200%; padding-right:80px;">
                                    <div class="ht__cat__thumb"style="width:100%; padding-right:80px;">
                                        <a href="product.php?id=<?php echo $list['id']?>">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$list['image']?>" alt="product images" style="align:center;width:150px;">
                                        </a>
                                    </div>
                                    <div class="fr__hover__info">
										<ul class="product__action" >
										</ul>
									</div>
                                    <div class="fr__product__inner"style="font-size:10px;width:45%;">
                                        <a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a>
										
                                        <ul class="fr__pro__prize">
                                            <li class="old__prize"style="font-size:10px;"><?php echo $list['mrp']?></li>
                                            <li style="font-size:10px;"><?php echo $list['price']?></li>
											
											
						
                                        </ul><a href="javascript:void(0)"class="buto" style="width:70%;"onclick="manage_cart('<?php echo $list['id']?>','add')">Add to Cart</a>
									
									
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Category -->
							<?php }
							}
													?>
                        
                    
                
           
    </div> 
    

      <div id="mySidenav" class="sidenav">
  <a href="#" id="about"> <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <button class="button">Enquire</button>
  </a>

 
</div>
		
              <div id="buto" style="position: absolute;
        top: 25%; left: 0%; width: 60%; height: 100px;">
				
					<a href="sub_categories.php?sub_id=1" class="buto">Static<a>
					<a href="sub_categories.php?sub_id=2" class="buto">Dynamic<a>
            
        </div>

</body>
</html>
									
								  <?php }								  ?>
								  
							
								  
								    <?php if( $cat_id==1){								  ?>
									
									<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="web.css">
</head>
<body>
<div id="web2" style="    position: relative;
        left: 54%;        width: 300px; ">
                <img id="web2d" src="images/web.png" style=" position: relative;
        top: 100px; left: 10px; right: 10px; bottom: 10px;">
            </div>
    
 
        <div id="wr1">
            <h1>App Development Static</h1><br>
            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos consectetur itaque ducimus! Nam alias facere minima quia beatae. Adipisci minus cupiditate suscipit, inventore a quisquam magni libero vel praesentium expedita!
            </p>
            
            </div>
         
                        <div class=" mt--30" >
							<?php
							$get_product=get_product($con,10);

							foreach($get_product as $list){
								if($list['sub_id']==1){
							?>
                            <!-- Start Single Category -->
                            <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12" style="width:40%; height:100px;">
                                <div class="category" style="width:200%; padding-right:80px;">
                                    <div class="ht__cat__thumb"style="width:100%; padding-right:80px;">
                                        <a href="product.php?id=<?php echo $list['id']?>">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$list['image']?>" alt="product images" style="align:center;width:150px;">
                                        </a>
                                    </div>
                                    <div class="fr__hover__info">
										<ul class="product__action" >
											</ul>
									</div>
                                    <div class="fr__product__inner"style="font-size:10px;width:45%;">
                                        <a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a>
										
                                        <ul class="fr__pro__prize">
                                            <li class="old__prize"style="font-size:10px;"><?php echo $list['mrp']?></li>
                                            <li style="font-size:10px;"><?php echo $list['price']?></li>
											
											
                                        </ul>
										<a href="javascript:void(0)"class="buto" style="width:70%;"onclick="manage_cart('<?php echo $list['id']?>','add')">Add to Cart</a>
									
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Category -->
							<?php }
							}
													?>
                        
                    
                
           
    </div> 


     <div id="mySidenav" class="sidenav">
  <a href="#" id="about"> <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <button class="button">Enquire</button>
  </a>

 
</div>
		
		

    
		
		
		
		
		
		
        <div id="buto" style="position: absolute;
        top: 25%; left: 0%; width: 60%; height: 100px;">
            
          
					<a href="sub_categories.php?sub_id=1" class="buto">Static<a>
					<a href="sub_categories.php?sub_id=2" class="buto">Dynamic<a>
        </div>
    



</body>
</html>
									
										
								  <?php }								  ?>
								  
								  
								  
								  
								  
								  
								    <?php if( $cat_id==4){								  ?>
									
									<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="web.css">
</head>
<body>
    <div id="web2" style="    position: relative;
        left: 54%;        width: 300px; ">
                <img id="web2d" src="images/design.png" style=" position: relative;
        top: 100px; left: 10px; right: 10px; bottom: 10px;">
            </div>
        <div id="wr1">
            <h1>Web Development Dynamic</h1><br>
            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos consectetur itaque ducimus! Nam alias facere minima quia beatae. Adipisci minus cupiditate suscipit, inventore a quisquam magni libero vel praesentium expedita!
            </p>
            
            </div>
         
                        <div class=" mt--30" >
							<?php
							$get_product=get_product($con,10);

							foreach($get_product as $list){
								if($list['sub_id']==4){
							?>
                            <!-- Start Single Category -->
                            <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12" style="width:40%; height:100px;">
                                <div class="category" style="width:200%; padding-right:80px;">
                                    <div class="ht__cat__thumb"style="width:100%; padding-right:80px;">
                                        <a href="product.php?id=<?php echo $list['id']?>">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$list['image']?>" alt="product images" style="align:center;width:150px;">
                                        </a>
                                    </div>
                                    <div class="fr__hover__info">
										<ul class="product__action" >
											</ul>
									</div>
                                    <div class="fr__product__inner"style="font-size:10px;width:45%;">
                                        <a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a>
										
                                        <ul class="fr__pro__prize">
                                            <li class="old__prize"style="font-size:10px;"><?php echo $list['mrp']?></li>
                                            <li style="font-size:10px;"><?php echo $list['price']?></li>
											
											
                                        </ul>
										<a href="javascript:void(0)"class="buto" style="width:70%;"onclick="manage_cart('<?php echo $list['id']?>','add')">Add to Cart</a>
									
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Category -->
							<?php }
									}
													?>
                        
                    
                
           
    </div> 


   <div id="mySidenav" class="sidenav">
  <a href="#" id="about"> <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <button class="button">Enquire</button>
  </a>

 
</div>
		
		
		
        <div id="buto" style="position: absolute;
        top: 25%; left: 0%; width: 60%; height: 100px;">
            
          
					<a href="sub_categories.php?sub_id=3" class="buto">Static<a>
					<a href="sub_categories.php?sub_id=4" class="buto">Dynamic<a>
        </div>
		

    



</body>
</html>
									
										
								  <?php }								  ?>
								  
								   <?php if( $cat_id==3){								  ?>
									
									<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="web.css">
</head>
<body>
    <div id="web2" style="    position: relative;
        left: 54%;        width: 300px; ">
                <img id="web2d" src="images/digi.png" style=" position: relative;
        top: 100px; left: 10px; right: 10px; bottom: 10px;">
            </div>
        <div id="wr1">
            <h1>Web Development Static</h1><br>
            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos consectetur itaque ducimus! Nam alias facere minima quia beatae. Adipisci minus cupiditate suscipit, inventore a quisquam magni libero vel praesentium expedita!
            </p>
            
            </div>
         
                        <div class=" mt--30" >
							<?php
							$get_product=get_product($con,10);

							foreach($get_product as $list){
								if($list['sub_id']==3){
							?>
                            <!-- Start Single Category -->
                            <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12" style="width:40%; height:100px;">
                                <div class="category" style="width:200%; padding-right:80px;">
                                    <div class="ht__cat__thumb"style="width:100%; padding-right:80px;">
                                        <a href="product.php?id=<?php echo $list['id']?>">
                                            <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$list['image']?>" alt="product images" style="align:center;width:150px;">
                                        </a>
                                    </div>
                                    <div class="fr__hover__info">
										<ul class="product__action" >
											</ul>
									</div>
                                    <div class="fr__product__inner"style="font-size:10px;width:45%;">
                                        <a href="product.php?id=<?php echo $list['id']?>"><?php echo $list['name']?></a>
										
                                        <ul class="fr__pro__prize">
                                            <li class="old__prize"style="font-size:10px;"><?php echo $list['mrp']?></li>
                                            <li style="font-size:10px;"><?php echo $list['price']?></li>
											
											
                                        </ul>
										<a href="javascript:void(0)"class="buto" style="width:70%;"onclick="manage_cart('<?php echo $list['id']?>','add')">Add to Cart</a>
									
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Category -->
							<?php }
							}
													?>
                        
                    
                
           
    </div> 


   <div id="mySidenav" class="sidenav">
  <a href="#" id="about"> <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <input type="text" value="Name" name="fname"><br>
  <button class="button">Enquire</button>
  </a>

 
</div>
		
		
		  
		
        <div id="buto" style="position: absolute;
        top: 25%; left: 0%; width: 60%; height: 100px;">
            
          
					<a href="sub_categories.php?sub_id=3" class="buto">Static<a>
					<a href="sub_categories.php?sub_id=4" class="buto">Dynamic<a>
        </div>
		
    



</body>
</html>
									<?php } ?>
									
									 
								  
   
		<input type="hidden" id="qty" value="1"/>
<?php require('footer.php')?>    

   