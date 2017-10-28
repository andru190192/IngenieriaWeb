<?php
require_once('Model.php');

class ExpositorModel extends Model {
	public $exp_id;
	public $exp_nombre;
	public $exp_apellido;
	public $exp_correo;
	public $exp_web;

	public function __construct() {
		//$this->db_name = 'evento';
	}

	public function create($expositor_data = array() ) {
		foreach ($expositor_data as $key => $value) {
			$$key = $value;
		}

		$this->query = "INSERT INTO expositores (exp_nombre, exp_apellido, exp_correo, exp_web) VALUES ('$exp_nombre', '$exp_apellido', '$exp_correo', '$exp_web')";
		$this->set_query();
	}
	public function read($expositor_id = '') {
		$this->query = ($expositor_id != '')
			?"SELECT * FROM expositores WHERE exp_id = $expositor_id"
			:"SELECT * FROM expositores";

		$this->get_query();
		//var_dump($this->rows);
		$num_rows = count($this->rows);
		//echo $num_rows;

		$data = array();

		foreach ($this->rows as $key => $value) {
			array_push($data, $value);
		}

		return $data;
	}
	public function update($expositor_data = array() ) {
		foreach ($expositor_data as $key => $value) {
			$$key = $value;
		}

		$this->query = "UPDATE expositores SET exp_nombre = '$exp_nombre', exp_apellido = '$exp_apellido', exp_correo = '$exp_correo', exp_web = '$exp_web' WHERE exp_id = $exp_id";
		$this->set_query();
	}
	public function delete($expositor_id = '') {
		$this->query = "DELETE FROM expositores WHERE exp_id = $expositor_id";
		$this->set_query();
	}

	public function __destruct() {
		//unset($this);
	}





}