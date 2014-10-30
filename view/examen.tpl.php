<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 30/10/14
 * Time: 10:28 AM
 */
if(isset($_COOKIE['idxas3d']) or isset($_COOKIE['acceso']))
{
    $idu=$_COOKIE['idxas3d'];
    $acceso=$_COOKIE['acceso'];
    if($idu=="" or $acceso=="")
    {
        print"<meta http-equiv='refresh' content='0;
url=login.php'>";
        exit();
    }
    include("bd/bd.php");
    $sql=mysql_query("SELECT * FROM usuario WHERE iduser='$idu'") or die ("errrode conuslta");
    $type=mysql_result($sql,0,'lvl');
    $idusuario=mysql_result($sql,0,'iduser');
    $usuario=mysql_result($sql,0,'name');
}else{
    print"<meta http-equiv='refresh' content='0;
url=login.php'>";
    exit();
}//aqui valido que exista una sesion
//y obtengo el "id" de el usuario ($idusuario)

$preg = new Preguntas();
if(isset($_POST['mandar'])){
    $ids=$_POST['ids'];
    $preg->calificacion($ids);
    $calificacion=$preg->califiacion;
    $preg=new Preguntas();
    $preg->updateCalificacion($idusuario,$calificacion);
}
?>
<h1 class="page-header"><?=$titulo?></h1>
<h3><?php echo$contenido ?></h3>
<div class="table-responsive">
<form role="form" method="post">
    <div class="form-group">
        <?=$preg->showPreguntas(); ?>
    </div>
    <button type="submit" class="btn btn-success" name="mandar">Enviar</button>
</form>
</div>

