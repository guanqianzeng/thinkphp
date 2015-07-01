<?php
/**
 *    后台共用函数库  2015年6月29日 16:15:03
 */

 /**
  * 获取配置的类型
  * @param string $type 配置类型
  * @return string
  */
 function get_config_type($type=0){
     $list = C('CONFIG_TYPE_LIST');
     return $list[$type];
 }

 /**
  * 获取配置的分组
  * @param string $group 配置分组
  * @return string
  */
 function get_config_group($group=0){
     $list = C('CONFIG_GROUP_LIST');
     return $group?$list[$group]:'';
 }
