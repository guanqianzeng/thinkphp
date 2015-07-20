<?php


/**
 * seo方法未完成
 * @param   string
 * @return  string
 */
function seo() {

    return '';
}

function thumb($img = '', $width = 0, $height = 0) {
    if (empty($img)) {
        return 'default.jpg';
    }
    $Uploads = __ROOT__ . 'Uploads/';
    $file = $Uploads . $img;
    if (file_exists($file)) {
        if (empty($width)) {
            return WEB_URL . $file;
        } else {
            $pathinfo = pathinfo($file);
            $thumb_file = $pathinfo['dirname'] . '/' . $pathinfo['filename'] . '_' . $width . '-' . $height . '.' . $pathinfo['extension'];
            if (file_exists($thumb_file)) {
                return WEB_URL . $thumb_file;
            } else {
                $image = new \Think\Image();
                $image->open($file);
                if (empty($height)) {
                    $height = $image->height();
                }
                $image->thumb($width, $height,\Think\Image::IMAGE_THUMB_CENTER)->save($thumb_file);
                return WEB_URL . $thumb_file;
            }
        }
    }
    return 'default.jpg';
}

/**
 * 获取父级栏目
 * @param   int       $catid  栏目catid
 * @return  array
 */
function get_category($catid = 0, $num = 0) {
    $data = array();
    foreach ( D('Category')->getAll() as $key => $val) {
        if ($val['pid'] == $catid && $val['display']) {
            $data[$key] = $val;
            if ($num && count($data) >= $num) {
                break;
            }
        }
    }
    return $data;
}

/**
 * 当前路径
 * 返回指定栏目路径层级
 * @param $catid 栏目id
 * @param $ext 栏目间隔符
 */
function catpos($catid = 0, $ext = ' - ') {
    $categorys = D('Category')->getAll();
    $html = '';
    if ($catid == 0) {
        $html = '<a href="'. U('Index/index') .'">首页</a>' . $html;
        return $html;
    } else {
        $html = $ext . '<a href="' . $categorys[$catid]['url'] . '">' . $categorys[$catid]['title'] . '</a>' . $html;
        $html = catpos($categorys[$catid]['pid'], $ext) . $html;
    }
    return $html;
}
