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
    <title>bestbook 電子書 館頁</title>
    <link rel="shortcut icon" href="../assets/img/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../assets/css/frame/frame.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/category/category.css">
    <!--[if lt IE 9]>
        <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>ㄊ
        <script src="../assets/js/3rd-party/respond.js"></script>
    <![endif]-->
</head>
<body>
    <?php include "../frame/_header_inn.php";?>
    <div class="category-page container">
        <!--
        <div class="search-result">
            <p>目前顯示的搜尋結果：<span class="red-text">文學小說</span> 共計：<span class="red-text">2491筆</span>，頁數<span class="red-text">1/25</span></p>
            <p>您是不是想找：<a href="#">科幻小說</a>、<a href="#">散文創作</a>、<a href="#">古典文學</a></p>
        </div>
        -->
        <?php include "../frame/_breadcrumbs.php";?>
        <div class="category-left">
            <p>全部分類：</p>
            <ul id="menu" class="menu">
                <li><a class="fristChild" href="category.php?category=1">文學小說</a>
                    <ul id="menu_1" class="second-menu">
                        <li>
                        <a class="secondChild" href="category.php?category=1&sub=1">翻譯文學</a>
                            <ul id="submenu_1" class="third-menu">
                                <li><a href="category.php?category=1&sub=1">日本</a></li>
                                <li><a href="category.php?category=1&sub=1">美國</a></li>
                                <li><a href="category.php?category=1&sub=1">歐洲</a></li>
                                <li><a href="category.php?category=1&sub=1">東南亞</a></li>
                            </ul>
                        </li>
                        <li><a href="category.php?category=1">電影/電視小說</a></li>
                        <li><a href="category.php?category=1">散文詩歌</a></li>
                        <li><a href="category.php?category=1">其他類小說</a></li>
                    </ul>
                </li>
                <li><a class="fristChild" href="category.php?category=2">愛情文藝</a></li>
                <li>
                    <a class="fristChild" href="category.php?category=3">幻俠推理</a>
                    <ul id="menu_3" class="second-menu">
                        <li><a href="category.php?category=3">科幻/奇幻小說</a></li>
                        <li><a href="category.php?category=3">懸疑/推理小說</a></li>
                        <li><a href="category.php?category=3">武俠小說</a></li>
                        <li><a href="category.php?category=3">歷史/軍事小說</a></li>
                    </ul>
                </li>
                <li>
                    <a class="fristChild" href="category.php?category=4">生活休閒</a>
                    <ul id="menu_4" class="second-menu">
                        <li><a href="category.php?category=4">寵物</a></li>
                        <li><a href="category.php?category=4">旅遊</a></li>
                        <li><a href="category.php?category=4">攝影</a></li>
                        <li><a href="category.php?category=4">美食</a></li>
                    </ul>
                </li>
                <li>
                    <a class="fristChild" href="category.php?category=5">圖文漫畫</a>
                    <ul id="menu_5" class="second-menu">
                        <li><a href="category.php?category=5">動漫畫</a></li>
                        <li><a href="category.php?category=5">圖文/插畫</a></li>
                    </ul>
                </li>
                <li>
                    <a class="fristChild" href="category.php?category=6">商業理財</a>
                    <ul id="menu_6" class="second-menu">
                        <li><a href="category.php?category=5">管理</a></li>
                        <li><a href="category.php?category=5">投資理財</a></li>
                        <li><a href="category.php?category=5">行銷</a></li>
                    </ul>
                </li>
                <li>
                    <a class="fristChild" href="category.php?category=7">親子家庭</a>
                    <ul id="menu_7" class="second-menu">
                        <li>
                            <a class="secondChild" href="category.php?category=7&sub=1">童書</a>
                            <ul id="submenu_1" class="third-menu">
                                <li><a href="category.php?category=7&sub=1">0-2歲</a></li>
                                <li><a href="category.php?category=7&sub=1">3-6歲</a></li>
                                <li><a href="category.php?category=7&sub=1">7-10歲</a></li>
                                <li><a href="category.php?category=7&sub=1">11-14歲</a></li>
                                <li><a href="category.php?category=7&sub=1">兒童繪本</a></li>
                            </ul>
                        </li>
                        <li><a href="category.php?category=7">家庭教育</a></li>
                    </ul>
                </li>
                <li>
                    <a class="fristChild" href="category.php?category=8">醫療/心靈</a>
                    <ul id="menu_8" class="second-menu">
                        <li><a href="category.php?category=8">醫療保健</a></li>
                        <li><a href="category.php?category=8">心靈養生</a></li>
                    </ul>
                </li>
                <li>
                    <a class="fristChild" href="category.php?category=9">其他</a>
                    <ul id="menu_9" class="second-menu">
                        <li>
                            <a class="secondChild" href="category.php?category=9&sub=1">人文史地</a>
                            <ul id="submenu_1" class="third-menu">
                                <li><a href="category.php?category=9&sub=1">史地</a></li>
                                <li><a href="category.php?category=9&sub=1">哲學</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="secondChild" href="category.php?category=9&sub=2">社會科學</a>
                            <ul id="submenu_2"  class="third-menu">
                                <li><a href="category.php?category=9&sub=2">心理學</a></li>
                                <li><a href="category.php?category=9&sub=2">政治/軍事</a></li>
                                <li><a href="category.php?category=9&sub=2">法律</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="secondChild" href="category.php?category=9&sub=3">自然科普</a>
                            <ul id="submenu_3" class="third-menu">
                                <li><a href="category.php?category=9&sub=3">應用科學</a></li>
                                <li><a href="category.php?category=9&sub=3">自然科學</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="secondChild" href="category.php?category=9&sub=4">藝術設計</a>
                            <ul id="submenu_4" class="third-menu">
                                <li><a href="category.php?category=9&sub=4">藝術</a></li>
                                <li><a href="category.php?category=9&sub=4">設計</a></li>
                            </ul>
                        </li>
                        <li><a href="category.php?category=9">語言學習</a></li>
                        <li><a href="category.php?category=9">考試用書</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="category-right">
            <!--
            <div class="filter">
                <div class="column">
                    <div class="filter-tpye">分類</div>
                    <div class="filter-content">
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>" class="all">全部</span>
                        </label>
                        <?php foreach ($search_category as $key => $value) {?>
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>"><?php echo $value['name'];?></span>
                        </label>
                        <?php }?>
                    </div>
                </div>
                <div class="column">
                    <div class="filter-tpye">語言</div>
                    <div class="filter-content">
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>" class="all">全部</span>
                        </label>
                        <?php foreach ($search_language as $key => $value) {?>
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>"><?php echo $value['name'];?></span>
                        </label>
                        <?php }?>
                    </div>
                </div>
                <div class="column">
                    <div class="filter-tpye">出版年份</div>
                    <div class="filter-content">
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>" class="all">全部</span>
                        </label>
                        <?php foreach ($search_year as $key => $value) {?>
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>"><?php echo $value['name'];?></span>
                        </label>
                        <?php }?>
                    </div>
                </div>
                <div class="column">
                    <div class="filter-tpye">出版社</div>
                    <div class="filter-content">
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>" class="all">全部</span>
                        </label>
                        <?php foreach ($search_press as $key => $value) {?>
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>"><?php echo $value['name'];?></span>
                        </label>
                        <?php }?>
                        <?php foreach ($search_press as $key => $value) {?>
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>"><?php echo $value['name'];?></span>
                        </label>
                        <?php }?>
                    </div>
                    <a href="#" class="expand">展開</a>
                </div>
                <div class="column">
                    <div class="filter-tpye">價格</div>
                        <div class="filter-content">
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>" class="all">全部</span>
                        </label>
                        <?php foreach ($search_price as $key => $value) {?>
                        <label>
                            <input type="checkbox">
                            <span title="<?php echo $value['name'];?>"><?php echo $value['name'];?></span>
                        </label>
                        <?php }?>
                    </div>
                </div>
            </div>
            <div class="filter-m">
                <div class="row">
                    <select>
                        <option selected disabled>分類</option>
                        <?php foreach ($search_category as $key => $value) {?>
                        <option><?php echo $value['name'];?></option>
                        <?php }?>
                    </select>
                    <select>
                        <option selected disabled>出版年份</option>
                        <?php foreach ($search_year as $key => $value) {?>
                        <option><?php echo $value['name'];?></option>
                        <?php }?>
                    </select>
                    <select>
                        <option selected disabled>分類</option>
                        <?php foreach ($search_category as $key => $value) {?>
                        <option><?php echo $value['name'];?></option>
                        <?php }?>
                    </select>
                    <select>
                        <option selected disabled>出版社</option>
                        <?php foreach ($search_press as $key => $value) {?>
                        <option><?php echo $value['name'];?></option>
                        <?php }?>
                    </select>
                    <select>
                        <option selected disabled>價格</option>
                        <?php foreach ($search_press as $key => $value) {?>
                        <option><?php echo $value['name'];?></option>
                        <?php }?>
                    </select>
                </div>
            </div>
            <ul class="sort">
                <li class="active"><a href="">默認排序</a></li>
                <li><a href="">免費閱讀</a></li>
                <li><a href="">最新上載</a></li>
                <li><a href="">暢銷閱讀</a></li>
                <li><a href="">價格由高到低</a></li>
                <li><a href="">價格由低到高</a></li>
            </ul>
            <div class="sortby-m">
                <select>
                    <option>默認排序</option>
                    <option>銷量排行</option>
                    <option >新品上市</option>
                    <option>價格由高到低</option>
                    <option>價格由低到高</option>
                </select>
            </div>
            -->
            <div class="row">
                <?php foreach ($products as $key => $value) {?>
                <div class="col-3">
                    <figure itemscope itemtype="http://data-vocabulary.org/Product" class="product">
                    <a href="../front/product.php" itemprop="offerurl" class="photo">
                        <img src="<?php echo $value['images'];?>" title="<?php echo $value['name'];?>" alt="<?php echo $value['name'];?>">
                    </a>
                    <figcaption>
                        <a title="" target="_blank" href="" itemprop="offerURL">
                            <p itemprop="name" class="name"><?php echo $value['name'];?></p>
                        </a>
                        <ul class="msg">
                            <li>作者：東野圭吾</li>
                            <li>出版日期：2013/08/05 </li>
                        </ul>
                        <p itemprop="price" class="price"><span class="dollar">$</span>990</p>
                        <div class="actions-double">
                            <!--<a class="button double" href="#">試閱</a>-->
                            <!--<a class="button double" href="#">購買</a>-->
                        </div>
                    </figcaption>
                </figure>
                </div>
                <?php }?>
            </div>
            <!--
            <ul class="pagination">
                <li> &lt;&lt;</li>
                <li><a href=""> &lt;</a></li>
                <li class="page"><a href="?page=1" class="current">1</a></li>
                <li class="page"><a href="?page=2">2</a></li>
                <li class="page"><a href="?page=3">3</a></li>
                <li><a href=""> &gt;</a></li>
                <li><a href=""> &gt;&gt;</a></li>
            </ul>
            -->
        </div>
    </div>
    <?php include "../frame/_footer.php";?>
    <?php include "../frame/_lightbox_search.php";?>
    <?php include "../frame/__js_library.php";?>

    <script>

    </script>
    <script>
    $(document).ready(function() {
        var urlNum_1,urlNum_2;
        urlNum_1=<?php if($_GET["category"]){echo$_GET["category"];}else{echo "undefined";} ?>;
        urlNum_2=<?php if($_GET["sub"]){echo$_GET["sub"];}else{echo "undefined";} ?>;
        if(urlNum_1){
            var tempItem_1="#menu_"+urlNum_1;
            $(tempItem_1).show();
        }
        if(urlNum_2){
            var tempItem_2="#menu_"+urlNum_1+" #submenu_"+urlNum_2;
            $(tempItem_2).show();
            $(tempItem_2).parent().find('.secondChild').css("color", "#00a8ff");
        }
        var tempNum=urlNum_1-1;
        $('.menu>li').eq(tempNum).find('.fristChild').css("color", "#00a8ff");
    });
    </script>
</body>
</html>