<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-Requested-With');

    require("dbconfig.php");

    class ValidarUsuario
    {
		private $nombreUsuario = "";
	
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
            $query = "SELECT id,usuario FROM Usuario WHERE usuario = '@U' AND passwd = '@P'";
            
            $query = str_replace("@U", $user, $query);
            $query = str_replace("@P", $password, $query);
			
            $resultado = mysqli_query($conexion, $query) or die (json_encode(array("success" => "false", "m" => "Error al ejecutar el query: " . $query)));

            $registros = mysqli_fetch_array($resultado, MYSQLI_ASSOC);
            $idUsuario = $registros["id"];
			$this->nombreUsuario = $registros["usuario"];
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
                if (!array_key_exists("USR", $json))
                {
                    echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                return FALSE;
                }
                else
                {
                    if (!array_key_exists("txtUser", $json["USR"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (!array_key_exists("md5Passwd", $json["USR"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (empty($json["USR"]["txtUser"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }
                    
                    if (empty($json["USR"]["md5Passwd"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (strlen($json["USR"]["txtUser"]) > 50)
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (strlen($json["USR"]["md5Passwd"]) > 32)
                    {
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
	                    return FALSE;
                    }

                    if (!preg_match('/^[a-z]+$/i', $json["USR"]["txtUser"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Campo usuario no es valido"));
	                    return FALSE;
                    }

                    if (!preg_match('/^[a-z\d]+$/', $json["USR"]["md5Passwd"]))
                    {
                        echo json_encode(array("success" => "false", "m" => "Campo Contrasena no es valido"));
	                    return FALSE;
                    }
                   
                    $idUsuario = $this->consultarIdUsuario($json["USR"]["txtUser"], $json["USR"]["md5Passwd"]);
					
                    if ($idUsuario == FALSE)
                    {
                        echo json_encode(array("success" => "false", "m" => "Usuario o Contrasena no valido"));
	                    return FALSE;
                    }
					
					return array("success" => "true", "nombre" => $this->nombreUsuario);
                }
            }

            
        }
    }

?>

