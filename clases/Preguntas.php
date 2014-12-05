<?php
/**
 * Created by PhpStorm.
 * User: Jairo
 * Date: 30/10/14
 * Time: 10:29 AM
 */

class Preguntas {
    private   $id_pregunta;
    private   $nombre;
    private   $estatus;
    private   $avatar;
    public    $ids;
    public    $califiacion;

    public function  showPreguntas(){
        $this->ids="";
        $Contador = 1;
        While($Contador<=10){
            //Obtener un número aleatorio entre 1 y el máximo de preguntas (id más grande tabla preguntas $max).
            // Y lo guardamos en $id.
            $sql=mysql_query("SELECT count(*) AS numero FROM preguntas") or die ("error de consulta");
            $max=mysql_result($sql,0,'numero');
                $this->id_pregunta=rand(1,$max);
                $preguntas=mysql_query("SELECT * FROM preguntas WHERE id_pregunta=$this->id_pregunta")or die ("error de consulta 2");
            $pregunta=mysql_result($preguntas,0,'nombre');
            //AQUI CONCADENO TODAS LAS IDS Y ABAJO LAS MANDO EN UN HIDDEN
            //PARA POSTERIORMENTE USARLAS EN MI OTRA CLASE QUE VALIDARA
            $this->ids.=$this->id_pregunta." ";
            echo "<label>$Contador .- $pregunta</label>";
            //IMPRIMO LAS PREGUNTAS Y LA VARIBALE CONTADOR PARA IDETIFICARLAS
            echo"<div class='radio'>
                     <label>
                        <input type='radio' value='V' name='res$Contador' checked>Verdadero
                      </label>";
                      echo"<label>
                         <input type='radio' value='F' name='res$Contador'>Falso
                      </label>
                </div>";
            /*For( $x=1;x<=$max;$x++)
                $preguntas[$x]=0;
                If($preguntas[$Contador]==0){
                    $preguntas[$Contador]=1;
                    echo mysql_result($preguntas,$x,'nombre');*/
                    //Imprimimos la pregunta obtenedidade la consulta MySQL.
                $Contador++;
            //}
        }
        echo"<input type='hidden' name='ids' value='$this->ids'>";//AQUI MANDO TODAS LAS IDS CONCADENADAS
    }
    public  function calificacion($ids){
        $y=1;
        $this->califiacion=0;
        $arreglo = explode(" ",$ids);
        foreach ( $arreglo as $id_pregunta ) {
            $id_pregunta;
            if($y!=11){
                $respuesta=$_POST['res'.$y];
                $y++;
                $sql=mysql_query("SELECT * FROM preguntas where id_pregunta='$id_pregunta' AND respuesta='$respuesta'")or die ("error de consulta");
                if(mysql_num_rows($sql)!=0){
                    $this->califiacion=$this->califiacion+1;
                }
            }
        }
        echo "<h1>Tu calificacion es:".$this->califiacion."</h1>";
        echo'<input type="button" class="btn btn-block alert-success" value="Regresar" onClick="javascript:history.back()" />';

    }
    public function updateCalificacion($id_user,$califiacion2){
        $sql=mysql_query("SELECT * FROM examen where id_user=$id_user")or die ("error de consulta");
        if(mysql_num_rows($sql)==0){
            mysql_query("INSERT INTO examen (id_user,calificacion) VALUES ($id_user,$califiacion2)")or die ("error de consulta");
            echo"Tu calificaci&oacute;n se actualizo";
        }else{
                $califiacion1=mysql_result($sql,0,'calificacion');
                if($califiacion2>$califiacion1){
                    mysql_query("UPDATE examen SET calificacion=$califiacion2 WHERE id_user=$id_user");
                    echo"Tu calificaci&oacute;n se actualizo";
                }
        }
        exit;
    }
} 