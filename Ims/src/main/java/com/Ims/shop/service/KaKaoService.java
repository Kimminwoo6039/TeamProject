package com.Ims.shop.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.KaKaoDao;
import com.Ims.shop.vo.KakaoVo;
import com.Ims.shop.vo.MemberVo;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
@Service
public class KaKaoService {

	

	private KaKaoDao kakaoDao;
	
	
	@Autowired
	public KaKaoService(KaKaoDao kakaoDao) {
		this.kakaoDao = kakaoDao;
	}
	
	
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST ��û�� ���� �⺻���� false�� setDoOutput�� true��

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=b3c90d252e0ab2e93579050eaf013549");  //������ �߱޹��� key
            sb.append("&redirect_uri=192.168.0.145:8090/shop/kakao.do");     // ������ ������ ���� ���
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    ��� �ڵ尡 200�̶�� ����
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode+"Ȯ��");

            //    ��û�� ���� ���� JSONŸ���� Response �޼��� �о����
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result+"���");

            //    Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
 
            e.printStackTrace();
        }

        return access_Token;
    }
	
	
	
	
	
	
	
	
	
	public MemberVo getuserinfo(String access_Token) {
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String requestURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(requestURL); //1.url ��ü�����
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//2.url ���� url connection �����
			conn.setRequestMethod("GET"); // 3.URL ���ᱸ��
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			//Ű��, �Ӽ� ����
			int responseCode = conn.getResponseCode(); //�������� ���� http �����ڵ� ��ȯ
		    System.out.println("responseCode :" + responseCode+ "���䰡");
		    BufferedReader buffer = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    // ���۸� ����Ͽ� �ϱ٤���
		    String line = "";
		    String result = "";
		    while ((line = buffer.readLine()) != null) {
		    	result +=line;
		    }
		    //readLine()) ==> �Է� String ������ ���ϰ� ���� 
			
		    System.out.println("response body :" +result);
		    
		    // �о����ϱ� �����Ͳ�������
		  JsonParser parser = new JsonParser();
		  JsonElement element = parser.parse(result); //Json element ���ڿ�����
		  JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		  JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		  
		  String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		  String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
		    	    
		    
		} catch (Exception e) {
           e.printStackTrace();
		}
		
		MemberVo result = kakaoDao.findkakao(userInfo); 
		// ����Ǿ��ִ��� Ȯ��
		System.out.println("S :" + result);
		
		if(result ==null) {
			//result null �̸� ������ ���� �ȵǾ��ִ°Ŷ� ������ ����.
			kakaoDao.kakaoinsert(userInfo);
			//�����ϱ����� repository �� �̵�
			return kakaoDao.findkakao(userInfo);
			// ���� ������ ��Ʈ�ѷ��� ������ ����
			//result �� �������� ������ null �� ���ϵǹǷ� ���ڵ带 ���.
		}else {
			return result;
			//������ �����Ƿ� result �� ������
		}
		
	}
	
}
