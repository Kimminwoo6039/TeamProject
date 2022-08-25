package com.Ims.shop.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
@Service
public class CertifiedPhoneNumber {

	 public void certifiedPhoneNumber(String phoneNumber, String numStr) {

		  String api_key = "NCSPAGW5WC70AQMS";
	        String api_secret = "QO4TS68VSYVGGNZAKMFFSU8T4WQ2AHZF";
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    // �닔�떊�쟾�솕踰덊샇
	        params.put("from", "01031233773");    // 諛쒖떊�쟾�솕踰덊샇. �뀒�뒪�듃�떆�뿉�뒗 諛쒖떊,�닔�떊 �몮�떎 蹂몄씤 踰덊샇濡� �븯硫� �맖
	        params.put("type", "SMS");
	        params.put("text", "아임즈 휴대폰 인증번호는" + "["+numStr+"]" + "입니다.");
	        params.put("app_version", "test app 1.2"); // application name and version

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }

	 }
}
