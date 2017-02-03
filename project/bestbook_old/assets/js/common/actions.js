/*
 *  Anthor      Ken.huang
 *  Mail        ken.huang@uitox.com
 *  Create date 2014/04/25 14:30 Ken Huang
 *  Last update 2014/07/01 11:06 Ken Huang
 *
 * function     1.categoryItem() - header 主要書籍分類
 *              2.accountItem() - h\eader 登入/註冊/查訂單/帳戶/閱讀清單/最愛
 *              3.cartItem() - header 購物車預覽區塊
 *              4.cateSideMenu() - 分類頁左側
 *              5.lightboxSearch() - 手機/平板時，搜尋改為lightbox方式呈現
 *              6.relateScroll() - 單品頁下方相關書籍推薦
 *              7.rwdPic() - 首頁我想出書換圖
*/
(function($){
    var mediaWidth = Math.max( $(window).width(), window.innerWidth);
    $(window).resize(function(){
        mediaWidth = Math.max( $(window).width(), window.innerWidth);
    });
    //top category button in header_inn.php
    var node = {};
    node.root = $('.main-category');
    node.item = node.root.find('.category-item');
    node.icon = node.root.find('.icon-menu');
    node.mobileMask = node.root.find('.category-mask');
    var userAgent=changeUserAgent();
    var isOpen = false;
    function changeUserAgent(){
        if( navigator.userAgent.match(/Android/i)
        || navigator.userAgent.match(/webOS/i)
        || navigator.userAgent.match(/iPhone/i)
        || navigator.userAgent.match(/iPad/i)
        || navigator.userAgent.match(/iPod/i)
        || navigator.userAgent.match(/BlackBerry/i)
        || navigator.userAgent.match(/Windows Phone/i)){
            return true;
        }else {
            return false;
        }
    }

    function categoryItem(){
        if(userAgent==true){
            isMobile();
        }else{
            isPC();
        }
    }
    function isMobile(){
        node.icon.on('touchend',function(event){
            if(isOpen==false){
                isOpen=true;
                openCategoryItem();
            }else{
                isOpen=false;
                closeCategoryItem();
            }
        });
        $('.categoryBG').on('touchstart',function(event){
            closeCategoryItem();
        });
    }

    function isPC(){
        node.mobileMask.off();
        node.mobileMask.off();
        node.icon.off();
        if(mediaWidth<=767){
            node.mobileMask.show();
            node.icon.on({
                "click": function () {
                openPCCategoryItem();
                }
            });
        }else{
            node.mobileMask.show();
            node.mobileMask.css("z-index","30");
            node.mobileMask.on({
                "mouseover": function () {
                    openPCCategoryItem();
                    console.log(">767");
                },
                "mouseleave": function () {
                    closePCCategoryItem()
                }
            });
        }
        $('.categoryBG').on('click',function(event){  closeCategoryItem(); });
    }
    function closePCCategoryItem(){
        if(mediaWidth<=999){
            node.item.show().animate({left: "0px"}, 100,function() {
                node.mobileMask.hide();
                node.item.hide();
                $('.categoryBG').hide();
            });
        }else{
            node.item.hide();
            $('.categoryBG').hide();
        }
    }
    function openCategoryItem(){
        isOpen = false;
        if(userAgent==true && mediaWidth<=990){
            node.mobileMask.show();
            node.item.show();
            node.item.animate({left: 0}, 300);
            $('.categoryBG').show();
        }else{
            node.mobileMask.show();
            node.item.show();

            node.item.animate({left: 0}, 300);
            $('.categoryBG').show();
        }
        $(window).scroll(function() {
            //closeCategoryItem();
        });
    }
    function closeCategoryItem(){
        isOpen=false;
        if(userAgent==true && mediaWidth<=999){
            node.item.show().animate({left: "-300px"}, 100,function() {
                node.mobileMask.hide();
                node.item.hide();
                $('.categoryBG').hide();
            });
        }else{
            node.mobileMask.hide();
            node.item.hide();
        }
        $('.categoryBG').hide();
    }
    categoryItem();
    accountItem();
    //header_inn.php
    function accountItem(){
        $("#function .link-account").hover(function(){
            $('.account-item').removeClass('hide');
        },function(){
            $('.account-item').addClass('hide');
        });
    }
    cartItem();
    //header_inn.php
	function cartItem(){
        $("#function .link-cart").hover(function(){
            $('.cart-item').removeClass('hide');
        },function(){
            $('.cart-item').addClass('hide');
        });
    }
    cateSideMenu();
    //category.php
    function cateSideMenu(){
        var node = {};
        node.root = $("#menu");
        node.li = node.root.find(".main");
        node.li.on('click', function(){
            if($(this).next().find('.second-menu')){
                target.slideToggle().removeClass('hide');
            }
        });
    }
    lightboxSearch();
    //toggle by search button when pad mode or phone mode
    function lightboxSearch(){
        var node = {};
        node.root = $("#lb-search");
        if(mediaWidth <= 999){
            $("#function .icon-search").on('click',function(){
                node.root.fadeIn('fast').removeClass('hide');
            });
            node.root.on('click',function(event){
                if(event.target.id == $(this).attr('id')){
                    node.root.fadeOut();
                }
            });
        }
    }
    relateScroll();
    //bottom scroll product in product.php
    function relateScroll(){
        var node = {};
        node.root = $('.bookcase');
        node.width = node.root.width();
        node.leftArrow = $('.icon-relate-arrow-left');
        node.rightArrow = $('.icon-relate-arrow-right');
        node.leftArrow.on('click',function(event){
            event.preventDefault();
            node.root.animate({scrollLeft: "-" + node.width}, 800);
        });
        node.rightArrow.on('click',function(event){
            event.preventDefault();
            node.root.animate({scrollLeft: node.width}, 800);
        });
    }
    rwdPic($("#picture"));
    //responsive image for index.php
    function rwdPic(root){
        var node = {};
        prepare();
        observe();
        function prepare(){
            node.root = root;
            node.lg = node.root.data('lg-src');
            node.md = node.root.data('md-src');
            node.sm = node.root.data('sm-src');
        }
        function observe(){
             if (mediaWidth >= 1000) {
                node.root.attr('src', node.lg);
            } else if((mediaWidth >= 768) && (mediaWidth <= 999)){
                node.root.attr('src', node.md);
            } else if(mediaWidth <= 767){
                node.root.attr('src', node.sm);
            } else{
                node.root.attr('src', node.xl);
            }
        }
        $(window).resize(function(){
            categoryItem();
            observe();
        });
    }
})(jQuery);