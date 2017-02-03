<?php 
    include "../frame/__data.php";
?>
<!doctype html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Language" content="zh-TW">
    <meta name="description" content="bestbook">
    <meta name="keywords" content="ebook, pdf">
    <meta property="og:site_name" content="bestbook 電子書"/>
    <meta property="og:title" content="bestbook 電子書 - <?php echo $h1_title;?>"/>
    <meta property="og:type" content="product"/>
    <meta property="og:description" content="bestbook 電子書"/>
    <meta property="og:url" content="http://bestbook.com/"/>
    <meta property="og:image" content="../assets/img/sample/mobile_hero.png"/>
    <title>bestbook 電子書 首頁</title>
    <link rel="shortcut icon" href="../assets/img/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link rel="stylesheet" type="text/css" href="../assets/css/frame/frame.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/index/index.css">
    <!--[if lt IE 9]>
        <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
        <script src="../assets/js/3rd-party/respond.js"></script>
    <![endif]-->
</head>
<body>
<?php include "../frame/_header_inn.php";?>
<div class="container">
    <div class="publish">
            <a href="#">
                <img id="picture" src="" alt="我想出書" 
                data-lg-src="../assets/img/index/publish_lg.jpg"
                data-md-src="../assets/img/index/publish_md.jpg"
                data-sm-src="../assets/img/index/publish_sm.jpg"
                >
            </a>
        </div>
    <div class="theme">
        <a href="# "class="button gray btn-more">顯示更多內容</a>
        <h2>免費閱讀專館</h2>
        <ul class="bookcase">
            <?php $index = 0; foreach ($products as $key => $value) {　?>
                <li>
                    <a href="../front/product.php">
                        <div class="bookItem">
                            <div class="ipadFrame">
                            <?php if($index==0){?>
                                <img src="../assets/img/frame/ipad_balck.png" alt=""/>
                            <?php }else{?>
                                <img src="../assets/img/frame/ipad_white.png" alt=""/>
                            <?php }?>
                            </div>
                            <div class="ipadInner">
                                <img src="<?php echo $value['images'];?>" title="<?php echo $value['name'];?>" alt="<?php echo $value['name'];?>">
                            </div>
                            <div class="detail">
                                <p class="name"><?php echo $value['name'];?></p>
                                <p class="desc"><?php echo mb_substr($value['desc'], 0, 20, "UTF-8") . "...";?></p>
                            </div>
                        </div>
                    </a>
                    <?php if($value['type']=="buy"){?>
                    <div class="actions-double">
                        <a href="#" class="button double">試閱</a>
                        <a href="#" class="button double">購買</a>
                    </div>
                    <?php }else if($value['type']=="free"){?>
                    <div class="actions">
                        <a href="#" class="button orange">免費閱讀</a>
                    </div>
                    <?php }else{?>
                    <div class="actions">
                        <a href="#" class="button green">即將上傳</a>
                    </div>
                    <?php }?>
                </li>
            <?php $index++; }?>
        </ul>
    </div>
    <hr>
    <div class="theme">
        <a href="# "class="button gray btn-more">顯示更多內容</a>
        <h2>作家最新上傳</h2>
        <ul class="bookcase bookcase_sub">
            <?php $index = 0; foreach ($products_new as $key => $value) {　?>
                <li>
                    <a href="../front/product.php">
                        <div class="bookItem">
                            <div class="ipadFrame">
                            <?php if($index==0){?>
                                <img src="../assets/img/frame/ipad_balck.png" alt=""/>
                            <?php }else{?>
                                <img src="../assets/img/frame/ipad_white.png" alt=""/>
                            <?php }?>
                            </div>
                            <div class="ipadInner">
                                <img src="<?php echo $value['images'];?>" title="<?php echo $value['name'];?>" alt="<?php echo $value['name'];?>">
                            </div>
                            <div class="detail">
                                <p class="name"><?php echo $value['name'];?></p>
                                <p class="desc"><?php echo mb_substr($value['desc'], 0, 20, "UTF-8") . "...";?></p>
                            </div>
                        </div>
                    </a>
                    <?php if($value['type']=="buy"){?>
                    <div class="actions-double">
                        <a href="#" class="button double">試閱</a>
                        <a href="#" class="button double">購買</a>
                    </div>
                    <?php }else if($value['type']=="free"){?>
                    <div class="actions">
                        <a href="#" class="button orange">免費閱讀</a>
                    </div>
                    <?php }else{?>
                    <div class="actions">
                        <a href="#" class="button green">即將上傳</a>
                    </div>
                    <?php }?>
                </li>
            <?php $index++; }?>
        </ul>
    </div>
    <div class="theme">
        <a href="# "class="button gray btn-more">顯示更多內容</a>
        <h2>人氣暢銷閱讀</h2>
        <ul class="bookcase bookcase_sub">
            <?php $index = 0; foreach ($products_hot as $key => $value) {　?>
                <li>
                    <a href="../front/product.php">
                        <div class="bookItem">
                            <div class="ipadFrame">
                            <?php if($index==0){?>
                                <img src="../assets/img/frame/ipad_white.png" alt=""/>
                            <?php }else{?>
                                <img src="../assets/img/frame/ipad_balck.png" alt=""/>
                            <?php }?>
                            </div>
                            <div class="ipadInner">
                                <img src="<?php echo $value['images'];?>" title="<?php echo $value['name'];?>" alt="<?php echo $value['name'];?>">
                            </div>
                            <div class="detail">
                                <p class="name"><?php echo $value['name'];?></p>
                                <p class="desc"><?php echo mb_substr($value['desc'], 0, 20, "UTF-8") . "...";?></p>
                            </div>
                        </div>
                    </a>
                    <?php if($value['type']=="buy"){?>
                    <div class="actions-double">
                        <a href="#" class="button double">試閱</a>
                        <a href="#" class="button double">購買</a>
                    </div>
                    <?php }else if($value['type']=="free"){?>
                    <div class="actions">
                        <a href="#" class="button orange">免費閱讀</a>
                    </div>
                    <?php }else{?>
                    <div class="actions">
                        <a href="#" class="button green">即將上傳</a>
                    </div>
                    <?php }?>
                </li>
            <?php $index++; }?>
        </ul>
    </div>
</div>

<?php include "../frame/_footer.php";?>
<?php include "../frame/_lightbox_search.php";?>
<?php include "../frame/__js_library.php";?>
<script>
</script>
</body>
</html>