<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-Requested-With');

    require("dbconfig.php");

    class ObtenerListaPedidos
    {

        private $listaPedidos = array("success" => "true", "m" => array());

        public function getListaPedidos()
        {
            return $this->listaPedidos;
        }

        public function conectar()
        {
            $conexion = mysqli_connect(SERVIDOR, USUARIO, CONTRASENA, BASEDATOS) or die (json_encode(array("success" => "false", "m" => "Error al establecer conexion con el servidor: " . SERVIDOR)));
            return $conexion;
        }

        public function desconectar($conexion)
        {
            mysqli_close($conexion);
        }

        public function consultarIdUsuario($user, $password)
        {
            $conexion = $this->conectar();
            $query = "SELECT id FROM Usuario WHERE usuario = '@U' AND passwd = '@P'";
            
            $query = str_replace("@U", $user, $query);
            $query = str_replace("@P", $password, $query);
			
            $resultado = mysqli_query($conexion, $query) or die (json_encode(array("success" => "false", "m" => "Error al ejecutar el query: " . $query)));

            $registros = mysqli_fetch_array($resultado, MYSQLI_ASSOC);
            $idUsuario = $registros["id"];

            $this->desconectar($conexion);

            if (empty($idUsuario))
            {
                return FALSE;
            }
            else
            {
                return $idUsuario;
            }
        }
        
        public function obtenerListaPedidos()
        {
            $conexion = $this->conectar();
            $query = "SELECT Venta.id,Cliente.nombreComercio as 'cliente',Cliente.id AS 'idCliente',fechaProgRecibido,subTotal,granTotal FROM Venta".
					 " JOIN Cliente ON(Cliente.id = Venta.idCliente) WHERE Venta.fechaImpresion is null  AND idEstatus = 1;";
 
            
      		$resultado = mysqli_query($conexion, $query) or die (json_encode(array("success" => "false", "m" => "Error al ejecutar el query: " . $query)));

            
            $contador = 0;
            $list=array();
            while ($registros = mysqli_fetch_array($resultado, MYSQLI_ASSOC))
            {
                $indice = strval($contador);
                //print_r($registros["valor"]);
				$valor = array(intval($registros["id"]),"$registros[cliente]",intval($registros["idCliente"]),"$registros[fechaCreacion]",floatval($registros["subTotal"]),floatval($registros["granTotal"]));
                $list[$contador] = $valor;
                $contador++;
            }
			
			
			
            $this->listaPedidos["m"] = $list;

            $this->desconectar($conexion);

            if (empty($this->listaPedidos))
            {
                return FALSE;
            }
            else
            {
                return $this->listaPedidos;
            }
        }

        public function validarEstructura($jsonEntrada)
        {
            $json = json_decode($jsonEntrada, TRUE);
            
            if (empty($json))
            {
                echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	            return FALSE;
            }

            if (!is_array($json))
            {
                echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	            return FALSE;
            }
            else
            {
                if (!array_key_exists("PED", $json))
                {
                    echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                return FALSE;
                }
                else
                {
                    if (!array_key_exists("txtUser", $json["PED"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (!array_key_exists("md5Passwd", $json["PED"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (empty($json["PED"]["txtUser"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }
                    
                    if (empty($json["PED"]["md5Passwd"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (strlen($json["PED"]["txtUser"]) > 50)
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (strlen($json["PED"]["md5Passwd"]) > 32)
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (!preg_match('/^[a-z]+$/i', $json["PED"]["txtUser"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Campo usuario no es valido"));
	                    return FALSE;
                    }

                    if (!preg_match('/^[a-z\d]+$/', $json["PED"]["md5Passwd"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Campo Contrasena no es valido"));
	                    return FALSE;
                    }
                   
                    $idUsuario = $this->consultarIdUsuario($json["PED"]["txtUser"], $json["PED"]["md5Passwd"]);
					
                    if ($idUsuario == FALSE)
                    {
                        echo json_encode(array("success" => "false", "m" => "Usuario o Contrasena no valido"));
	                    return FALSE;
                    }

                    $lista = $this->obtenerListaPedidos();
                    
                    if ($lista == FALSE)
                    {
                        echo json_encode(array("success" => "false", "m" => "Usuario o Contrasena no valido"));
	                    return FALSE;
                    }

                    return $this->getListaPedidos();
                }
            }

            
        }
    }

?>

