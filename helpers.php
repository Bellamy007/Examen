<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 16/10/14
 * Time: 05:56 PM
 */
function view($plantilla,$variables=array()){
        extract($variables);
    require'view/'.$plantilla.'.tpl.php';
}
function controller($nombre){
    if(empty($nombre))
        $nombre='home';
        $archivo="controller/".$nombre.".php";
    if(file_exists($archivo))
        require $archivo;
    else
        echo"Error archivo  no encontrado";
}