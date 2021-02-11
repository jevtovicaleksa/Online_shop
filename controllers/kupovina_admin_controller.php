<?php

class Kupovina_Admin_Controller extends Admin_Controller {
    public function index(){
        $this->view->activeNavigation = 'kupovina';
        $allOfPurchases = $this->model->getPurchases();
        $this->view->allOfPurchases = $allOfPurchases;
        $this->view->render('kupovina/kupovina_page.php');
    }
    public function getDetail(){
        $purchaseDetail = $this->model->getDetailsOfPurchase();
        $this->view->purchaseDetails = $purchaseDetail;
        $this->view->load('kupovina/detalji_kupovine.php');        
    }
}

?>
