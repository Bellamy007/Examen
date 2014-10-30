<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 16/10/14
 * Time: 05:47 PM
 */
require('bd/bd.php');
require("template/header.php");
require('helpers.php');
require("clases/Usuario.php");
require("clases/Preguntas.php");

if(empty($_GET['url']))
    $_GET['url']='home';
    controller($_GET['url']);
require("template/footer.php");