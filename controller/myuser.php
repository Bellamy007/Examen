<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 17/10/14
 * Time: 06:22 PM
 */
$usuario = new Usuario();

$titulo = "Bienvenido al Myuser";
$contenido = "Contenido de la variable";

$variables = array('titulo'=>$titulo,'contenido'=>$contenido,'nombre'=>$usuario->setUsurio());

view('myuser',$variables);