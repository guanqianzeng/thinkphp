<?php
return array(
	// Layout配置
    'LAYOUT_ON' => true,
    'LAYOUT_NAME' => 'Layout/main',

    // 模版主题
    'DEFAULT_THEME' => 'Bjjfsd',

    // 模版配置
    'TMPL_PARSE_STRING'  =>array(
         '__PUBLIC__' => '/Public/Admin/', // 更改默认的/Public 替换规则
         '__UPLOAD__' => '/Uploads/Admin/', // 增加新的上传路径替换规则
    ),
);
