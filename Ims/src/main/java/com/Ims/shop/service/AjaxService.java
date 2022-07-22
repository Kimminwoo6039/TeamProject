package com.Ims.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AjaxDao;


@Service
public class AjaxService {
	
		
		private AjaxDao ajaxdao;
		
		@Autowired
		public AjaxService(AjaxDao ajaxdao) {
			this.ajaxdao = ajaxdao;
		}

		public int checkId (String id) {
			int result = 0;
			
			result = ajaxdao.checkId(id);
			return result;
		}
		


	}

	
