<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
	function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
    }
    
    function apps($app_name) {
		$dbapps = $this->load->database('default', TRUE);

		if ($app_name == "ukmpbg") {
			$args = func_get_args();
			if (count($args) > 1) unset($args[0]);
			else { echo "API support for Usaha Kecil Menengah Kabupaten Purbalingga.<br><a href='https://apps.alriftech.com/ukmpbg'>https://apps.alriftech.com/ukmpbg</a>"; exit; }

			if ($args[1] == "version") {
				$json = array(
					'versionCode' => 1,
					'versionName' => "1.0.0.0"
				);

				$this->output
            		->set_content_type('application/vnd.api+json')
					->set_output(json_encode($json, JSON_PRETTY_PRINT));
			}

			// User Login
			else if ($args[1] == "user_login_google") {

			}

			// Lowongan
			else if ($args[1] == "ukm_lowongan") {
				$query = $dbapps->get_where("ukmpbg_lowongan", array('id_ukm' => $args[2]));
				$json = array(
					'status' => 'success',
					'data' => $query->result()
				);

				$this->output
            		->set_content_type('application/vnd.api+json')
					->set_output(json_encode($json, JSON_PRETTY_PRINT));
			}

			// UKM
			else if ($args[1] == "ukm_list") {
				$query = $dbapps->get("ukmpbg_ukm");
				$json = array(
					'status' => 'success',
					'data' => $query->result()
				);

				$this->output
            		->set_content_type('application/vnd.api+json')
					->set_output(json_encode($json, JSON_PRETTY_PRINT));
			}
			else if ($args[1] == "ukm_detail") {
				$query = $dbapps->get_where("ukmpbg_ukm", array("id_ukm" => $args[2]));
				$json = array(
					'status' => 'success',
					'data' => $query->result()
				);

				$this->output
            		->set_content_type('application/vnd.api+json')
					->set_output(json_encode($json, JSON_PRETTY_PRINT));
			}
			// Produk
			else if ($args[1] == "ukm_produk_list") {
				$query = $dbapps->get_where("ukmpbg_produk", array("id_ukm" => $args[2]));
				$json = array(
					'status' => 'success',
					'data' => $query->result()
				);

				$this->output
            		->set_content_type('application/vnd.api+json')
					->set_output(json_encode($json, JSON_PRETTY_PRINT));
			}
			else {
				printf("Perintah '" . $args[1] . "' tidak ditemukan!");
			}
		}
		else {
			$json = array(
				'status' => 'error',
				'data' => '[APPS] Dukungan API untuk aplikasi \'' . $app_name . '\' tidak ditemukan!'
			);
			
			$this->output->set_status_header(404);

			$this->output
            	->set_content_type('application/vnd.api+json')
				->set_output(json_encode($json, JSON_PRETTY_PRINT));
		}

		$dbapps->close();
	}
}
