<h1>PROIZVODI</h1>


<div>
    <a class="button" href="<?php echo ADMIN_URL . 'proizvodi/noviProizvod'; ?>" >Novi proizvod</a>

    <div class="search" >
    <form action="<?php echo $this->paginationUrl; ?>" method="get">
        Pretraga: <input type="text" name="pretraga" value="<?php echo $this->search; ?>"/>
        <input class="button" type="submit" value="ok" />
    </form>
    </div>
    
    <table class="mt15" border="1">
        <tr>
            <td>ID</td>
            <td>Naziv</td>
            <td>Opis</td>
            <td>Slika</td>
            <td>Cena</td>
            <td>Aktivan</td>
            <td>Datum</td>
            <td>Kategorija</td>
            <td>&nbsp;</td>
        </tr>
        <?php
        foreach ($this->items as $item) {
            echo '<tr>';
            echo '<td><a href="' . ADMIN_URL . 'proizvodi/azuriranjeProizvoda/' . $item['item_id'] . '">' . $item['item_id'] . '</td>';
            echo '<td>' . $item['title'] . '</td>';
            echo '<td>' . $item['description'] . '</td>';
            if (!empty($item['images']['160x160'])) {
                echo '<td><img width="100" src="' . $item['images']['160x160'] . '" /></td>';
            } else {
                echo '<td></td>';
            }
            
            echo '<td>' . $item['price'] . '</td>';
            echo '<td>' . $item['active'] . '</td>';
            echo '<td>' . $item['create_date'] . '</td>';
            echo '<td>' . $item['category'] . '</td>';
            echo '<td><span class="deleteItem" id="' . $item['item_id'] . '"><img src="' . URL . 'images/icon_delete.png' . '"></span></td>';
            echo '</tr>';
        }
        ?>
    </table>

     <?php if ($this->pagesCount > 1) { ?>
        <ul class="pagination">
            <?php for ($i = 1; $i <= $this->pagesCount; $i++) { ?>
                <li>
                    <a <?php if ($i == $this->currentPage) {
                            echo 'class="current"';
                        }?>
                        href="<?php echo $this->paginationUrl . '?page=' . $i ?>"><?php echo $i; ?></a>
                </li>
            <?php } ?>
        </ul>
    <?php } ?>
</div>

<div class='background'>

    <div id='question'>
        <div id='btnClose'><img src="<?php echo URL . 'images/icon_close.png'; ?>" /></div>
        Da li ste sigurni da zelite da obrisete proizvod?
        <div class="buttons">
            <div id="btnYes" class="button">
                <a href="">
                    Da
                </a>
            </div>
            <div id="btnNo" class="button">Ne</div>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function($){

        $('.deleteItem').click(function(){
            $('.background').fadeIn('fast');
            var id = $(this).attr('id');
            var link = "<?php echo ADMIN_URL .'proizvodi/obrisiProizvod?item_id='; ?>" + id;
            $('#btnYes a').attr('href', link);
        });

        function closeBackground(speed) {
            $('.background').fadeOut(speed);
        }
        $('#btnClose').click(function() {
            closeBackground('fast');
        });
        $('#btnNo').click(function() {
            closeBackground('fast');
        });
    });
</script>