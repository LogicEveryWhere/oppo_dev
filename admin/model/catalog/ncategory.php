<?php
class ModelCatalogNcategory extends Model {
	public function addNcategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");
	
		$ncategory_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "ncategory SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		}
		
		foreach ($data['ncategory_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory_description SET ncategory_id = '" . (int)$ncategory_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
		
		if (isset($data['ncategory_store'])) {
			foreach ($data['ncategory_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory_to_store SET ncategory_id = '" . (int)$ncategory_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['ncategory_layout'])) {
			foreach ($data['ncategory_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory_to_layout SET ncategory_id = '" . (int)$ncategory_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
						
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'ncategory_id=" . (int)$ncategory_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('ncategory');
	}
	
	public function editNcategory($ncategory_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "ncategory SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE ncategory_id = '" . (int)$ncategory_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "ncategory SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory_description WHERE ncategory_id = '" . (int)$ncategory_id . "'");

		foreach ($data['ncategory_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory_description SET ncategory_id = '" . (int)$ncategory_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "', seo_title = '" . $this->db->escape($value['seo_title']) . "', seo_h1 = '" . $this->db->escape($value['seo_h1']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory_to_store WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		
		if (isset($data['ncategory_store'])) {		
			foreach ($data['ncategory_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory_to_store SET ncategory_id = '" . (int)$ncategory_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory_to_layout WHERE ncategory_id = '" . (int)$ncategory_id . "'");

		if (isset($data['ncategory_layout'])) {
			foreach ($data['ncategory_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "ncategory_to_layout SET ncategory_id = '" . (int)$ncategory_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
						
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'ncategory_id=" . (int)$ncategory_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'ncategory_id=" . (int)$ncategory_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		
		$this->cache->delete('ncategory');
	}
	
	public function deleteNcategory($ncategory_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory_description WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory_to_store WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ncategory_to_layout WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_to_ncategory WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'ncategory_id=" . (int)$ncategory_id . "'");
		
		$query = $this->db->query("SELECT ncategory_id FROM " . DB_PREFIX . "ncategory WHERE parent_id = '" . (int)$ncategory_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteNcategory($result['ncategory_id']);
		}
		
		$this->cache->delete('ncategory');
	} 

	public function getNcategory($ncategory_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'ncategory_id=" . (int)$ncategory_id . "') AS keyword FROM " . DB_PREFIX . "ncategory WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		
		return $query->row;
	} 
	
	public function getNcategories($parent_id = 0) {
		$ncategory_data = $this->cache->get('ncategory.' . (int)$this->config->get('config_language_id') . '.' . (int)$parent_id);
	
		if (!$ncategory_data) {
			$ncategory_data = array();
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ncategory c LEFT JOIN " . DB_PREFIX . "ncategory_description cd ON (c.ncategory_id = cd.ncategory_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
			foreach ($query->rows as $result) {
				$ncategory_data[] = array(
					'ncategory_id' => $result['ncategory_id'],
					'name'        => $this->getNcat($result['ncategory_id'], $this->config->get('config_language_id')),
					'status'  	  => $result['status'],
					'sort_order'  => $result['sort_order']
				);
			
				$ncategory_data = array_merge($ncategory_data, $this->getNcategories($result['ncategory_id']));
			}	
	
			$this->cache->set('ncategory.' . (int)$this->config->get('config_language_id') . '.' . (int)$parent_id, $ncategory_data);
		}
		
		return $ncategory_data;
	}
	
	public function getNcat($ncategory_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "ncategory c LEFT JOIN " . DB_PREFIX . "ncategory_description cd ON (c.ncategory_id = cd.ncategory_id) WHERE c.ncategory_id = '" . (int)$ncategory_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getNcat($query->row['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}
	
	public function getNcategoryDescriptions($ncategory_id) {
		$ncategory_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ncategory_description WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		
		foreach ($query->rows as $result) {
			$ncategory_description_data[$result['language_id']] = array(
				'seo_title'        => $result['seo_title'],
				'seo_h1'           => $result['seo_h1'],
				'name'             => $result['name'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $ncategory_description_data;
	}	
	
	public function getNcategoryStores($ncategory_id) {
		$ncategory_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ncategory_to_store WHERE ncategory_id = '" . (int)$ncategory_id . "'");

		foreach ($query->rows as $result) {
			$ncategory_store_data[] = $result['store_id'];
		}
		
		return $ncategory_store_data;
	}

	public function getNcategoryLayouts($ncategory_id) {
		$ncategory_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ncategory_to_layout WHERE ncategory_id = '" . (int)$ncategory_id . "'");
		
		foreach ($query->rows as $result) {
			$ncategory_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $ncategory_layout_data;
	}
		
	public function getTotalNcategories() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ncategory");
		
		return $query->row['total'];
	}	
		
	public function getTotalNcategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ncategory WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalNcategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ncategory_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}		

	public function getNcategoriesByParentId($parent_id = 0) {
		$query = $this->db->query("SELECT *, (SELECT COUNT(parent_id) FROM " . DB_PREFIX . "ncategory WHERE parent_id = c.ncategory_id) AS children FROM " . DB_PREFIX . "ncategory c LEFT JOIN " . DB_PREFIX . "ncategory_description cd ON (c.ncategory_id = cd.ncategory_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name");
		
		return $query->rows;
	}

	public function getAllNcategories() {
		$ncategory_data = $this->cache->get('ncategory.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$ncategory_data || !is_array($ncategory_data)) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ncategory c LEFT JOIN " . DB_PREFIX . "ncategory_description cd ON (c.ncategory_id = cd.ncategory_id) LEFT JOIN " . DB_PREFIX . "ncategory_to_store c2s ON (c.ncategory_id = c2s.ncategory_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  ORDER BY c.parent_id, c.sort_order, cd.name");

			$ncategory_data = array();
			foreach ($query->rows as $row) {
				$ncategory_data[$row['parent_id']][$row['ncategory_id']] = $row;
			}

			$this->cache->set('ncategory.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $ncategory_data);
		}

		return $ncategory_data;
	}
}
?>