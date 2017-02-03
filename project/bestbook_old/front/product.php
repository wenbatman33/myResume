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
    <title>bestbook 電子書 單品頁</title>
    <link rel="shortcut icon" href="../assets/img/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../assets/css/frame/frame.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/product/product.css">
    <!--[if lt IE 9]>
        <link rel="stylesheet" type="text/css" href="../assets/css/shop/ie8.css">
        <script src="../assets/js/3rd-party/respond.js"></script>
        <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
    <![endif]-->
</head>
<body>
    <?php include "../frame/_header_inn.php";?>
    <div class="main-product container">
        <?php include "../frame/_breadcrumbs.php";?>
        <div class="row">
            <h1 itemprop="name" class="name-mobile">解憂雜貨店 - ナミヤ雑貨店の奇蹟</h1>
            <figure itemscope itemtype="http://data-vocabulary.org/Product">
                <!--<img itemprop="image" src="http://placehold.it/300x400" alt="書名">-->
                <div class="bookWrap">
                    <div class="bookItem">
                        <div class="ipadFrame">
                        <img src="../assets/img/frame/ipad_white.png" alt="">
                        </div>
                        <div class="ipadInner">
                        <img src="../assets/img/sample/book_01.jpg" title="完美" alt="完美">
                        </div>
                    </div>
                </div>
                <figcaption>
                    <h1 itemprop="name">解憂雜貨店 - ナミヤ雑貨店の奇蹟</h1>
                    <ul class="feature">
                        <li>作者：東野圭吾 譯者：王蘊潔 </li>
                        <li>出版日期：2013/08/05</li>
                    </ul>
                    <div class="buy">
                        <div itemprop="price" class="price"><span class="currency">$</span>199</div>
                        <a href="#" itemprop="offerurl" class="button large full red">購買</a>
                        <!-- <a href="#" class="button large orange">免費閱讀</a>
                        <a href="#" itemprop="offerurl" class="button large full red">加入購物車</a>-->
                        <a href="#" itemprop="offerurl" class="button large">試閱</a>
                        <a href="#" itemprop="offerurl" class="button large gray">下次再買</a>
                    </div>
                </figcaption>
            </figure>
        </div>
        <div class="row">
            <div class="book-info">
                <h3>內容簡介</h3>
                <h4>如果有一個地方，可以解決我們所有的煩惱……<br>日本熱銷突破30萬冊！東野圭吾最令人感動落淚的作品！結局更出人意表！已改編成舞台劇！</h4>
                <p>這裡不只賣日常生活用品，還提供消煩解憂的諮詢。困惑不安的你，糾結不已的你，歡迎來信討論心中的問題。<br>靜僻的街道旁，佇立著一家「解憂雜貨店」。只要在晚上把寫了煩惱的信丟進鐵捲門上的投遞口，隔天就可以在店後面的牛奶箱拿到回信解答。<br><br>男友罹患不治之症，陷入愛情與夢想兩難的女孩；一心想成為音樂人，不惜離家又休學，卻面臨理想與現實掙扎的魚店老闆兒子；<br>爸爸的公司倒閉，打算帶著全家捲款潛逃，在親情與未來之間游移不定的少年……<br>當他們紛紛寫信到雜貨店，不可思議的事情也接二連三發生。而那些一瞬間的交會，又將如何演變成一生一世的救贖？跨越三十年時空，雜貨店恆常散放著溫暖奇異的光芒...... 
                <a href="">更多內容〉</a>
                </p>
            </div>
        </div>

        <div class="row">
            <div class="relate">
                <h3>相關類別電子書推薦</h3>
                <ul class="bookcase">
                    <?php foreach ($products as $key => $value) {?>
                    <li>
                        <a href="../front/product.php">
                            <div class="bookItem">
                                <div class="ipadFrame"><img src="../assets/img/frame/ipad_white.png" alt=""/></div>
                                <div class="ipadInner">
                                    <img src="<?php echo $value['images'];?>" title="<?php echo $value['name'];?>" alt="<?php echo $value['name'];?>">
                                </div>
                                <div class="detail">
                                    <p class="name"><?php echo $value['name'];?></p>
                                    <p class="desc"><?php echo mb_substr($value['desc'], 0, 50, "UTF-8") . "...";?></p>
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
                    <?php }?>
                </ul>
                <a href="#" class="icon-relate-arrow-left"></a>
                <a href="#" class="icon-relate-arrow-right"></a>
            </div>
        </div>
        <div class="bottom-buy">
            <div class="price">$199</div>
            <a href="#" class="button large full red productBuy">購買</a>
            <a href="#" class="button large white productNextTime">下次買</a>
            <a href="#" class="button large white productFree">試閱</a>
        </div>
    </div>
    <?php include "../frame/_footer.php";?>
    <?php include "../frame/_lightbox_search.php";?>
    <?php include "../frame/__js_library.php";?>
    <script>
    </script>
</body>
</html>