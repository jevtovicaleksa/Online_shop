<script type="text/javascript" src="<?php echo URL . 'libs/javascript/tinymce/tinymce.min.js' ?>"></script>

<script type="text/javascript">
tinymce.init({
    selector: "textarea",
    theme: "modern",
    width: 600,
    height: 500,
    
    plugins: [
        "emoticons", "textcolor", "print", 'wordcount', "table", "link", "image", "pagebreak"
    ],
    toolbar : "newdocument bold italic underline strikethrough alignleft aligncenter alignright alignjustify styleselectbullist numlist | formatselect fontselect fontsizeselect | emoticons | hr forecolor backcolor print | image | link | pagebreak | table "
    
 });
</script>

<p>
    Dobro došli u Online Shop Administraciju!
</p>

<form action="<?php echo ADMIN_URL . 'home/azuriraj'; ?>" method="post" >

    Naslov: <input type="text" name="title" value="<?php echo $this->homePage['title']; ?>" /> <br />
    Opis:   <textarea rows="20" cols="100" name="description" ><?php echo $this->homePage['description']; ?></textarea> <br />

    <input type="submit" value="azuriraj" />
</form>