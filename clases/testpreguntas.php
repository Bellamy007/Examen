<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 30/10/14
 * Time: 10:53 AM
 */
include "Preguntas.php";
include "../bd/bd.php";

$obj = new Preguntas();

$obj->showPreguntas();