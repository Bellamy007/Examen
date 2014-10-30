<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 17/10/14
 * Time: 06:28 PM
 */
$usuario02 = new Usuario();
?>
<html>
<head></head>
<body>
    <p><?=$titulo?></p>
    <p><?php echo$contenido ?></p>
    <p><?= $nombre ?></p>
    <p>
        <?php
            $usuario02->setUsurio();
            $usuario02->getUsurio();
            $usuario02->readUsuario();
        ?>
    </p>
</body>
</html>