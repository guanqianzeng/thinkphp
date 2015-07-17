<?php
return array(

    // 模版主题
    'DEFAULT_THEME' => 'pc',

    // 模版配置
    'TMPL_PARSE_STRING'  =>array(
         '__COMMON__' => __ROOT__ . '/Public/Common/',
         '__HOME__' => __ROOT__ . '/Public/' . MODULE_NAME . '/' . 'pc' . '/',
    ),

    //URL大小写区分
    'URL_CASE_INSENSITIVE'  =>  false,
    'URL_MODEL' => 2,
    // 普通模式           0
    // PATHINFO模式       1
    // REWRITE模式        2
    // 兼容模式           3

    // 开启路由
    'URL_ROUTER_ON'   => true,

    'URL_ROUTE_RULES'=>array(
        'lists' => array('Index/lists'),
        //'n/:id\d' => 'Index/lists/catid/:1'
    ),

    // 自定义标签库
    'TAGLIB_BUILD_IN'   => 'My',
    'TAGLIB_PRE_LOAD'   => 'My',
);
