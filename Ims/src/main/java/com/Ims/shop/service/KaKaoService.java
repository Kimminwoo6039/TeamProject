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

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=b3c90d252e0ab2e93579050eaf013549");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://192.168.0.145:8090/shop/kakao.do");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode+"확인");

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result+"결과");

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
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
			URL url = new URL(requestURL); //1.url 객체만들기
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//2.url 에서 url connection 만들기
			conn.setRequestMethod("GET"); // 3.URL 연결구성
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			//키값, 속성 적용
			int responseCode = conn.getResponseCode(); //서버에서 보낸 http 상태코드 반환
		    System.out.println("responseCode :" + responseCode+ "여긴가");
		    BufferedReader buffer = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		    // 버퍼를 사용하여 일근ㄴ것
		    String line = "";
		    String result = "";
		    while ((line = buffer.readLine()) != null) {
		    	result +=line;
		    }
		    //readLine()) ==> 입력 String 값으로 리턴값 고정 
			
		    System.out.println("response body :" +result);
		    
		    // 읽엇으니깐 데이터꺼내오기
		  JsonParser parser = new JsonParser();
		  JsonElement element = parser.parse(result); //Json element 문자열변경
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
		// 저장되어있는지 확인
		System.out.println("S :" + result);
		
		if(result ==null) {
			//result null 이면 정보가 저장 안되어있는거라서 저보를 저장.
			kakaoDao.kakaoinsert(userInfo);
			//저장하기위해 repository 로 이동
			return kakaoDao.findkakao(userInfo);
			// 정보 저장후 컨트롤러에 정보를 보냄
			//result 를 리턴으로 보내면 null 이 리턴되므로 위코드를 사용.
		}else {
			return result;
			//정보가 있으므로 result 를 리턴함
		}
		
	}
	
}
