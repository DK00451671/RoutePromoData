<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-Requested-With'); 
error_reporting(E_ALL);
    // $Entrada = array("CLI" => array("fun" => "obtenerListaCliente", "txtUser" => "jrico", "md5Passwd" => "qwerty"));
    // $Entrada = array("CLI" => array("fun" => "obtenerInfoCliente", "txtUser" => "jrico", "md5Passwd" => "qwerty", "intId" =>1));
    // $Entrada = array("CLI" => array("fun" => "modificarCliente", "txtUser" => "jrico", "md5Passwd" => "qwerty", "idCliente" => "1", "data" => array("txtReferencia" => "Sin referencia")));

    //if (isset($_POST["enviar"]))
    //{
        if (empty($_POST["json"]))
        {
            echo json_encode(array("success" => "false", "m"=> "Estructura Json Malformada"));
        }
        else
        {
          $decodificado = json_decode($_POST["json"], TRUE);

            //
            //
            //  SERVICIOS CLIENTE
            //
            if (array_key_exists("CLI", $decodificado) && array_key_exists("fun", $decodificado["CLI"]))
            {
              $servicio = $decodificado["CLI"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
									
					case "obtenerCSVhorarios":
						require("obtenerCSVhorarios.php");

                        $CLI = new ObtenerCSVhorarios();
                        $retorno = $CLI->validarEstructura($jsonCodificado);

                        if ($retorno)
                        {
							header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
					break;
					
					case "obtenerCSVclientes":
						require("obtenerCSVclientes.php");

                        $CLI = new ObtenerCSVclientes();
                        $retorno = $CLI->validarEstructura($jsonCodificado);

                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
					break;
					
                    case "obtenerListaCliente":
                        require("ObtenerListaClientes.php");

                        $OLC = new ObtenerListaClientes();
                        $retorno = $OLC->validarEstructura($jsonCodificado);

                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    case "obtenerInfoCliente":
                        require("ObtenerInfoCliente.php");

                        $OIC = new ObtenerInfoCliente();
                        $retorno = $OIC->validarEstructura($jsonCodificado);

                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    case "modificarCliente":
                        require("ModificarCliente.php");

                        $MC = new ModificarCliente();
                        $retorno = $MC->validarEstructura($jsonCodificado);
                
                        if ($retorno)
                        {
                            echo json_encode(array("success" => "true"));
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    case "eliminarCliente":
                        require("EliminarCliente.php");
                        $EC = new EliminarCliente();
                        $retorno = $EC->validarEstructura($jsonCodificado);
                
                        if ($retorno)
                        {
                            echo json_encode(array("success" => "true"));
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    case "nuevoCliente":
                        require("NuevoCliente.php");
                        $NC = new NuevoCliente();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    default:
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                    break;
                }
            }
            //
            //
            //   SERVICIOS ZONA
            //
            else if (array_key_exists("ZON", $decodificado) && array_key_exists("fun", $decodificado["ZON"]))
            {
              $servicio = $decodificado["ZON"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "obtenerCSVzonas":
                        //echo "obtenerListaClases test";
                        require("obtenerCSVzonas.php");
                        $NC = new ObtenerCSVzonas();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;
                  case "obtenerListaZonas":
                        //echo "obtenerListaZonas test";
                        require("ObtenerListaZonas.php");
                        $NC = new ObtenerListaZonas();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    default:
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        break;
                }
            }
            //
            //
            //   SERVICIOS CLASE
            //
            else if (array_key_exists("CLA", $decodificado) && array_key_exists("fun", $decodificado["CLA"]))
            {
              $servicio = $decodificado["CLA"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
				  case "obtenerCSVclases":
                        //echo "obtenerListaClases test";
                        require("obtenerCSVclases.php");
                        $NC = new ObtenerCSVclases();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;
				
                  case "obtenerListaClases":
                        //echo "obtenerListaClases test";
                        require("ObtenerListaClases.php");
                        $NC = new ObtenerListaClases();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    default:
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        break;
                }
            }
            //
            //
            //   SERVICIOS GIRO COMERCIAL
            //
            else if (array_key_exists("GCM", $decodificado) && array_key_exists("fun", $decodificado["GCM"]))
            {
              $servicio = $decodificado["GCM"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
                  case "obtenerListaGiroComer":
                        //echo "obtenerListaGiroComer test";
                        require("ObtenerListaGiroComer.php");
                        $NC = new ObtenerListaGiroComer();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;

                    default:
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        break;
                }
            }
			else if (array_key_exists("PRO", $decodificado) && array_key_exists("fun", $decodificado["PRO"]))
			{
				$servicio = $decodificado["PRO"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "obtenerCSVprecios":
                        //echo "obtenerListaClases test";
                        require("obtenerCSVprecios.php");
                        $NC = new ObtenerCSVprecios();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;
					
					case "obtenerCSVproductos":
                        //echo "obtenerListaClases test";
                        require("obtenerCSVproductos.php");
                        $NC = new ObtenerCSVproductos();
                        $retorno = $NC->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
                    break;
                  case "obtenerListaProductos":
                        //echo "obtenerListaProductos test";
                        require("obtenerListaProductos.php");
						$PRO = new ObtenerListaProductos();
                        $retorno = $PRO->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
						break;
				  case "obtenerInfoProductos":
					
                        require("obtenerInfoProductos.php");
						$PRO = new ObtenerInfoProductos();
                        $retorno = $PRO->validarEstructura($jsonCodificado);
						
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
						break;
				  
				  case "modificarProducto":
						require("ModificarProducto.php");
						$PRO = new ModificarProducto();
                        $retorno = $PRO->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
						break;
						
				  case "eliminarProducto":
						require("EliminarProducto.php");
						$PRO = new EliminarProducto();
                        $retorno = $PRO->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
						break;
				
				  case "nuevoProducto":
						require("NuevoProducto.php");
						$PRO = new NuevoProducto();
                        $retorno = $PRO->validarEstructura($jsonCodificado);
                        if ($retorno)
                        {
                            echo json_encode($retorno);
                        }
                        else
                        {
                            //echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
						break;
				  default:
                        echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        break;
                }
					
			}
			else if (array_key_exists("CAT", $decodificado) && array_key_exists("fun", $decodificado["CAT"]))
			{
				$servicio = $decodificado["CAT"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "obtenerCSVcategorias":
						require("obtenerCSVcategorias.php");

                        $CLI = new ObtenerCSVcategorias();
                        $retorno = $CLI->validarEstructura($jsonCodificado);

                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
					break;
					
					case "obtenerCSVsubCat":
						require("obtenerCSVsubCat.php");

                        $CAT = new ObtenerCSVsubCat();
                        $retorno = $CAT->validarEstructura($jsonCodificado);

                        if ($retorno)
                        {
                            header('Content-Type: application/json');
                            foreach($retorno as $line)
							{
								echo $line."\n";
							}
                        }
                        else
                        {
                            // echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
                        }
					break;
					
					case "obtenerListaSubCat":
							require("obtenerListaSubCat.php");
							$CAT = new ObtenerListaSubCat();
							$retorno = $CAT->validarEstructura($jsonCodificado);
							if ($retorno)
							{
								echo json_encode($retorno);
							}
							else
							{
								//echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							}
							break;
					case "obtenerListaCategorias":
							require("obtenerListaCategorias.php");
							$CAT = new ObtenerListaCategorias();
							$retorno = $CAT->validarEstructura($jsonCodificado);
							if ($retorno)
							{
								echo json_encode($retorno);
							}
							else
							{
								//echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							}
							break;
							
					  default:
							echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							break;
				}
			}else if (array_key_exists("UNI", $decodificado) && array_key_exists("fun", $decodificado["UNI"]))
			{
				$servicio = $decodificado["UNI"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "obtenerListaUnidades":
							require("obtenerListaUnidades.php");
							$UNI = new ObtenerListaUnidades();
							$retorno = $UNI->validarEstructura($jsonCodificado);
							if ($retorno)
							{
								echo json_encode($retorno);
							}
							else
							{
								//echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							}
							break;

					  default:
							echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							break;
				}
			}
			else if (array_key_exists("MAR", $decodificado) && array_key_exists("fun", $decodificado["MAR"]))
			{
				$servicio = $decodificado["MAR"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "obtenerListaMarcas":
							require("obtenerListaMarcas.php");
							$UNI = new ObtenerListaMarcas();
							$retorno = $UNI->validarEstructura($jsonCodificado);
							if ($retorno)
							{
								echo json_encode($retorno);
							}
							else
							{
								//echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							}
							break;

					  default:
							echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
							break;
				}
			}
			else if (array_key_exists("USR", $decodificado) && array_key_exists("fun", $decodificado["USR"]))
			{
							$servicio = $decodificado["USR"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "validarUsuario":
						require("validarUsuario.php");

						$CLI = new ValidarUsuario();
						$retorno = $CLI->validarEstructura($jsonCodificado);

						if ($retorno)
						{
							echo json_encode($retorno);
						}
						else
						{
							// echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
						}
					break;
					
					case "obtenerPermisosUsr":
						require("obtenerPermisosUsr.php");

						$CLI = new ObtenerPermisosUsr();
						$retorno = $CLI->validarEstructura($jsonCodificado);

						if ($retorno)
						{
							echo json_encode($retorno);
						}
						else
						{
							// echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
						}
					break;
				}
			}else if (array_key_exists("PED", $decodificado) && array_key_exists("fun", $decodificado["PED"]))
			{
				$servicio = $decodificado["PED"]["fun"];

                $jsonCodificado = json_encode($decodificado, TRUE);

                switch ($servicio)
                {
					case "enviarPedido":
						require("enviarPedido.php");

						$PED = new EnviarPedido();
						$retorno = $PED->validarEstructura($jsonCodificado);
						
						if ($retorno)
						{
							echo json_encode($retorno);
						}
						else
						{
							// echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
						}
					break;
					
					case "obtenerListaPedidos":
						require("obtenerListaPedidos.php");

						$PED = new ObtenerListaPedidos();
						$retorno = $PED->validarEstructura($jsonCodificado);

						if ($retorno)
						{
							echo json_encode($retorno);
						}
						else
						{
							// echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
						}
					break;
					
					case "obtenerInfoPedido":
					
						require("obtenerInfoPedidos.php");

						$PED = new ObtenerInfoPedido();
						$retorno = $PED->validarEstructura($jsonCodificado);

						if ($retorno)
						{
							echo json_encode($retorno);
						}
						else
						{
							// echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
						}
					break;
				}
			}
            else
            {
                echo json_encode(array("success" => "false", "m" => "Estructura Json Malformada"));
            }
        } // else if (isset ...)
    /*} //if (isset ...)
    else
    {
        echo json_encode(array("success" => "false", "m" => "Acceso Denegado."));
    }*/

    

?>
