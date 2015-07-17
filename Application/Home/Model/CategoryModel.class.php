<?php
namespace Home\Model;
use Think\Model;
class CategoryModel extends Model {

    protected $order = 'sort desc, id asc'; //统一排序

    /* 获取所有栏目 */
    public function getAll() {
        $data = S('CATEGORYS');
        if (!$data) {
            $map = array();
            $categorys = $this->where($map)->field($field)->order($this->order)->select();
            foreach ($categorys as $key => $val) {
                $data[$val['id']] = $val;
                $data[$val['id']]['setting'] = unserialize($val['setting']);
                $data[$val['id']]['url'] = U('lists?catid='. $val['id']);
            }
            S('CATEGORYS', $data);
        }
        return $data;
    }


}
