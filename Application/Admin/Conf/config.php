<?php
return array(
	// Layout配置
    'LAYOUT_ON' => true,
    'LAYOUT_NAME' => 'Layout/main',

    // 模版主题
    'DEFAULT_THEME' => 'Bjjfsd',

    // 模版配置
    'TMPL_PARSE_STRING'  =>array(
         '__COMMON__' => __ROOT__ . '/Public/Common/',
         '__ADMIN__' => __ROOT__ . '/Public/' . MODULE_NAME . '/'
    ),


    'URL_MODEL' => 0,
);
