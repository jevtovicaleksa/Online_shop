<?php

class Proizvodi_Model extends Model {

    public function getCategories() {
        $categories = array();

        $sql = "SELECT `category_id`, `name`, `number_of_items_in_category`
                FROM `categories`
                ORDER BY `name` ASC";
        $result = $this->db->query($sql);

        if ($result->rowCount() > 0) {
            while ($rs = $result->fetch(PDO::FETCH_ASSOC)) {
                $categories[] = $rs;
            }
        }

        return $categories;
    }

    public function getItems($categoryId = 0, $offset = 0, $limit = 0, $search = '') {
        $items = array();

        $where = "";
        if (!empty($categoryId) && $categoryId > 0) {
            $where = " WHERE `fk_category_id` = '$categoryId' ";
        }
        if (!empty($search)) {
            $where = !empty($where) ? $where . " AND (`title` LIKE '%$search%' OR `description` LIKE '%$search%' ) " : " WHERE `title` LIKE '%$search%' OR `description` LIKE '%$search%'  ";
        }

        $sql = "SELECT  i.`item_id`, i.`title`, i.`description`, i.`image`, i.`price`, i.`active`, i.`create_date`, i.`number_of_items`, i.`fk_category_id`,
                c.`name` AS `category`
                FROM `items` i
                INNER JOIN `categories` c ON c.category_id = i.fk_category_id
                $where
                LIMIT $offset, $limit
                ";
        $result= $this->db->query($sql);

        if ($result->rowCount() > 0) {
            while ($rs = $result->fetch(PDO::FETCH_ASSOC)) {
                if (!empty($rs['image'])) {
                    // u bazi cuvamo samo kranje ime slike sa ekstenzijom zato moramo da dodamo celu putanju do slike
                    $rs['images']['160x160'] = URL . 'images/proizvodi/' . $rs['item_id'] . '/160x160_' . $rs['image'];
                    $rs['images']['300x300'] = URL . 'images/proizvodi/' . $rs['item_id'] . '/300x300_' . $rs['image'];
                }
                $items[] = $rs;
            }
        }

        return $items;
    }

    public function getItem($itemId) {
        // metoda koja vadi iz baze podatke o proizvodu sa datim id-em
        
        $item = array();

        $sql = "SELECT  i.`item_id`, i.`title`, i.`description`, i.`image`, i.`price`, i.`active`, i.`create_date`, i.`number_of_items`, i.`fk_category_id`,
                        c.`name` AS category
                FROM `items` i
                INNER JOIN `categories` c ON c.category_id = i.fk_category_id
                WHERE `item_id` = '$itemId' ";
        $result = $this->db->query($sql);

        if ($result->rowCount() > 0) {
            $item = $result->fetch(PDO::FETCH_ASSOC);

            if (!empty($item['image'])) {
                $item['images']['160x160'] = URL . 'images/proizvodi/' . $item['item_id'] . '/160x160_' . $item['image'];
                $item['images']['300x300'] = URL . 'images/proizvodi/' . $item['item_id'] . '/300x300_' . $item['image'];
            }
        }

        return $item;
    }

 public function countItems($categoryId = 0, $search = '') {
        // metoda koja broji proizvode
        // u zavisnosti od vrednosti parametara moze da pretrazi sve proizvode ukoliko nije prosledjena kategorija ili search parametar
        // ukoliko je prosledjena kategorija onda broji proizvode iz te kategorije
        // ukoliko je prosledjen search parametar broji proizvode koji u nazivu sadrze string iz search parametra
        // ukoliko su oba parametra postavljena metoda vraca broj proizvoda koji se nalaze u datoj kategoriji ali i u svom nazivu sadrze string iz search parametra

        $num = 0;

        $where = '';
        if (!empty($categoryId) && $categoryId > 0) {
            $where = " WHERE `fk_category_id` = '$categoryId' ";
        }
        if (!empty($search)) {
            $where = !empty($where) ? $where . " AND `title` LIKE '%$search%' " : " WHERE `title` LIKE '%$search%' ";
        }

        $sql = "SELECT COUNT(*) AS num
                FROM `items`
                $where";
        $result = $this->db->query($sql);
        list($num) = $result->fetch();

        return (int)$num;
    }

    public function purchase($userId, $items) {
        $sum = 0;
        foreach ($_SESSION['korpa'] as $key => $value) {
            $sum = $sum + $value['price'];
        }

        $sql = "INSERT INTO purchases (fk_user_id, purchase_date, amount, total_price) VALUES (:fk_user_id, :purchase_date, :amount, :total_price)";
        $result = $this->db->prepare($sql);
        $result->execute([
            ":fk_user_id" => $_SESSION['user_id'],
            ":purchase_date" => time(),
            ":amount" => count($_SESSION['korpa']),
            ":total_price" => $sum
        ]);

        $purchase_id = $this->db->lastInsertId();

        $sql = "INSERT INTO items_to_purchases (fk_purchase_id, fk_item_id) VALUES (:fk_purchase_id, :fk_item_id)";
        $result = $this->db->prepare($sql);

        $sql2 = "UPDATE items SET number_of_items=number_of_items-1 WHERE item_id=:item_id";
        $result2 = $this->db->prepare($sql2);

        foreach ($_SESSION['korpa'] as $key => $value) {
            $result->execute([
                ":fk_purchase_id" => $purchase_id,
                ":fk_item_id" => $value['item_id']
            ]);

            $result2->execute([
                ":item_id" => $value['item_id']
            ]);

        }
        
    }

}

?>