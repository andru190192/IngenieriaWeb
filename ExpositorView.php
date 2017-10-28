<?php
require_once('ExpositorModel.php');

echo '<h1>CRUD con MVC de la Tabla Expositores</h1>';

$expositor = new ExpositorModel();

$expositor_data = $expositor->read();
var_dump($expositor_data);

$num_expositores = count($expositor_data);

echo "<h2>Número de Expositores: <mark>$num_expositores</mark></h2>";

echo '<h2>Tabla de Expositores</h2>';

echo 
'<table>
	<tr>
		<th>Id</th>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>Correo</th>
		<th>Web</th>
	</tr>';
	for ($n=0; $n < count($expositor_data); $n++) { 
		echo '<tr>
				<td>' . $expositor_data[$n]['exp_id'] . '</td>
			  	<td>' . $expositor_data[$n]['exp_nombre'] . '</td>
			  	<td>' . $expositor_data[$n]['exp_apellido'] . '</td>
			  	<td>' . $expositor_data[$n]['exp_correo'] . '</td>
			  	<td>' . $expositor_data[$n]['exp_web'] . '</td>
			  </tr>';
	}
echo '</table>';

echo '<h2>Insertando Expositores</h2>';
$new_expositor = array(
	'exp_nombre' => 'Julio',
	'exp_apellido' => 'Aguilar',
	'exp_correo' => 'jaguilar@gmail.com',
	'exp_web' => 'www.julioaguilar.com'
);

//$expositor->create($new_expositor);

echo '<h2>Actualizando Expositores</h2>';
$update_expositor = array(
	'exp_id' => 1,
	'exp_nombre' => 'Pablo',
	'exp_apellido' => 'Gutierrez',
	'exp_correo' => 'pgutierrez@gmail.com',
	'exp_web' => 'www.pablogutierrez.com'
);
//$expositor->update($update_expositor);
echo '<h2>Eliminando Expositores</h2>';
//$expositor->delete(4);