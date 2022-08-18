<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- JQuery Script -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>


<!-- STYLE Area -->
<style>
table, th, td {
  border-collapse: separate;
  border-spacing:0 5px;
  font-size:1em;
}
tr{
 border-bottom: 10px solid #fff;
}
button{
  padding: 5px;
  font-size:0.5em;
  color: #fff;
  background:#05f;
  border-radius:0.5em;
}

</style>


<link rel="shortcut icon" href="#">
<title>전자서명중계 기능테스트 </title>
</head>
<body>
	<h2 >전자서명중계-기능테스트페이지</h2>
	<h3> 간편인증</h3>
	<label > URL     :  </label>
	<input name='token_url' type='text'  style=" width: 60%;  margin-right: 5px; " placeholder="https://cx.raonsecure.co.kr:58443" value="http://localhost:8080"/>	<br/>
	<!-- <input name='token_url' type='text'  style=" width: 60%;  margin-right: 5px; " placeholder="http://localhost:8082" value="http://localhost:8082"/>	<br/> -->
	<br/>
	<button type="button" style="height: 40px; width:80%;  background:#50f;"  onclick="fncToken()">토 큰 요 청</button>
	<br/><br/>
	<table style="padding-left: -20px;padding-right: 20px;width:100%;">
		<tr>
			<th colspan="2">기본사항</th>
		</tr>
		<tr>
			<td>인증사업자  :</td>
			<td>
				<select name="s_provider">
					<option value="conaver_v1.5">네이버</option>
					<option value="cokakao_v1.5">KAKAO</option>
					<option value="copayco_v1.5">페이코</option>
					<option value="copass_v1.5">통신사PASS</option>
					<option value="cotoss-esign_v1.5">토스</option>
					<!-- <option value="cokica_v1.5">정보인증(삼성패스)</option> -->
					<!-- <option value="kb_v1.5">KB은행</option> -->
				</select><br/>
			</td>
		</tr>
		<tr>
			<td>Token : </td>
			<td>
				<input name='a_token' type='text'  style=" width: 60%;  margin-right: 5px; " placeholder="토큰요청 클릭시 자동생성" readonly="readonly" disabled="disabled"/><br/>
				<input name='a_txId' type='text'  style=" width: 60%;  margin-right: 5px; " placeholder="토큰요청 클릭시 자동생성" readonly="readonly" disabled="disabled"/>
			</td>
		</tr>
		<tr>
			<td>Name : </td>
			<td>
				<input name='a_name' type='text'  style=" width: 60%;  margin-right: 5px;" placeholder="홍길동" value=""/>
			</td>
		</tr>
		<tr>
			<td>Phone : </td>
			<td>
				<input name='a_phone' type='text'  style=" width: 60%;  margin-right: 5px; " placeholder="01012345678" value=""/>
			</td>
		</tr>
		<tr>
			<td>Birthday : </td>
			<td>
				<input name='a_birthday' type='text'  style=" width: 60%;  margin-right: 5px; " placeholder="19810101" value=""/>
			</td>
		</tr>
		<tr>
			<td>단말정보 : </td>
			<td>
				<select name="s_deviceCd">
					<option value="PC" selected>PC</option>
					<option value="MO">휴대전화</option>
					<option value="TB">테블릿</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>매체정보 : </td>
			<td>
				<select name="s_deviceBrowser">
					<option value="WB">브라우저</option>
					<option value="WBK">카카오브라우저</option>
					<option value="HY">하이브리드앱</option>
					<option value="NA">네이티브앱</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Callback URI : </td>
			<td>
				<input name='a_callbackUrl' type='text' style=" width: 60%; margin-right: 5px; " placeholder="이용기관앱스킴 등"/>
			</td>
		</tr>
		<tr>
			<th colspan="2">인증사업자별 선택사항</th>
		</tr>
		<tr>
			<td>고객센터전화번호 : </td>
			<td>
				<input name='a_reqCSPhoneNo' type='text' style=" width: 60%; margin-right: 5px; " placeholder="1800-4273"/>
			</td>
		</tr>
		<tr>
			<td>upmuGb : </td>
			<td>
				<input name='a_upmuGb' type='text' style=" width: 60%; margin-right: 5px; " value="1"/>
			</td>
		</tr>
		<tr>
			<td>telcoTycd (통신사선택) : </td>
			<td>
				<select name="s_telcoTycd">
					<option value="S">SKT / KB은행기본값</option>
					<option value="K">KT</option>
					<option value="L">LGU</option>
				</select>
			</td>
		</tr>
		<tr>
			<td> isUseTss : </td>
			<td>
				<input name='a_isUseTss' type='text' style=" width: 60%; margin-right: 5px; " value="Y"/>
			</td>
		</tr>
		<tr>
			<td>isNotification : </td>
			<td>
				<input name='a_isNotification' type='text' style=" width: 60%; margin-right: 5px; " value="Y"/>
			</td>
		</tr>
		<tr>
			<td>isPASSVerify : </td>
			<td>
				<input name='a_isPASSVerify' type='text' style=" width: 60%; margin-right: 5px; " value="Y"/>
			</td>
		</tr>
		<tr>
			<td>isUserAgreement : </td>
			<td>
				<input name='a_isUserAgreement' type='text' style=" width: 60%; margin-right: 5px; " value="Y"/>
			</td>
		</tr>
	</table>
	<h3>인증요청</h3>
	<button type="button" style="height: 40px; width:80%;  background:#50f;"  onclick="fncAuth()">인증요청</button><br/>
	<lable>인증사업자</lable><br/>
	<lable>TX ID : </lable><br/>
	<input name='res_cxid' type='text'  style=" width: 55%;  margin-right: 5px; " disabled="disabled" placeholder="CXID"/><br/>
	<lable>REQ TX ID : </lable><br/>
	<input name='res_reqtxid' type='text'  style=" width: 55%;  margin-right: 5px; " disabled="disabled" placeholder="REQTXID"/><br/>
	<lable>TELCO TX ID : </lable><br/>
	<input name='res_telcoTxid' type='text'  style=" width: 55%;  margin-right: 5px; " disabled="disabled" placeholder="TELCOTXID"/><br/>
	<input name='res_deeplinkUri' type='text'  style=" width: 55%;  margin-right: 5px; " disabled="disabled" placeholder="deeplinkUri"/><br/>
  <input name='res_returntoken' type='text'  style=" width: 55%;  margin-right: 5px; display: none; " disabled="disabled" placeholder="authToken"/><br/>
  <br/>

	<button type="button" style="height: 40px; width:80%;  background:#50f;"  onclick="call_kko_simul()">카카오 모의서명</button><br/>

	<h3 >앱호출</h3>
	<table style="padding-left: -20px;padding-right: 20px;width:100%;">
		<tr>
			<th>연계사</th>
			<th colspan="3">호출</th>
		</tr>
		<tr><td></td></tr>
		<tr>
			<th>KakaoTalk</th>
			<td colspan="2"><input name='kko_cxid' type='text' style=" width: 90%; margin-right: 5px; "  placeholder="파라미터 입력" /></td>
			<td ><button type="button"  style="width:100%" onclick="call_kko()">카카오 호출</button></td>
		</tr>
		<tr><td></td></tr>
		<tr>
			<th>PAYCO</th>
			<td colspan="2"><input name='pay_session' type='text'  style=" width: 90%;  margin-right: 5px; " placeholder="파라미터 입력" /></td>
			<td><button type="button" style="width:100%"  onclick="call_payco()">PAYCO 호출</button></td>
		</tr>
		<tr><td></td></tr>
		<tr>
			<th>SAMSUNG</th>
			<td colspan="3"><button type="button" style="width:100%"  onclick="call_samsungpass()">PASS 호출</button></td>
		</tr>
		<tr>
			<th>KB Bank</th>
			<td colspan="3"><button type="button" style="width:100%" onclick="call_kbbank()">KB 호출</button></td>

		</tr>
		<tr>
			<th>PASS</th>
			<td><button type="button" style="width:100%"  onclick="call_pass_skt()">SKT 호출</button></td>
			<td><button type="button" style="width:100%"  onclick="call_pass_kt()">KT 호출</button></td>
			<td><button type="button" style="width:100%"  onclick="call_pass_lgu()">LGU+ 호출</button></td>

		</tr>

		<tr style="border-bottom: 10px solid #fff; display: none;" >
			<th>Native</th>
			<td colspan="3"><button type="button" style="width:100%"  onclick="call_native()">Msg 전송</button></td>
		</tr>
	</table>

	<h3 >간편인증 결과확인</h3>
	<table style="padding-left: -20px;padding-right: 20px;width:100%;">
		<tr>
		<td>
			<button type="button" style="height: 40px; width:80%;  background:#50f;"  onclick="fncResult()">인증결과확인</button><br/>
			<br/>
			<button type="button" style="height: 40px; width:80%;  background:#50f;"  onclick="setKakaoCallback('kakao_test', 'WBK')">카카오콜백URI확인</button><br/>
		</td>
		</tr>
	</table>


</body>

<!-- Function Area -->
	<script>
	var oacxurl   = $('input[name=token_url]').val();
	var req_result = "/oacx/api/v1.0/authen/result";
	var req_token = "/oacx/api/v1.0/trans";
	var req_auth = "/oacx/api/v1.0/authen/request";
	var data ="";

	function fncErrorMsg(data){
		if(data.resultCode == -203){
  			alert(data.error_description);
	  		fncScope(data.resultData);
  		}else if(data.resultCode < 0){
  			alert(data.error_description);
	  		return false;
  		}else {
  			return true;
		}
	}

	function fncToken(){
		oacxurl   = $('input[name=token_url]').val();
  		$.ajax({
  			method : 'post',
	  		url  : oacxurl+req_token,
  			data : data,
  			dataType : 'json',
	  		contentType : 'application/json; charset=UTF-8',
  			success : function(d){
  				if(d.resultCode < 0){
  					alert(d.error_description);
  					return false;
	  			}
  				$('input[name=a_token]').val(d.token);
				$('input[name=a_txId]').val(d.txId);

  			},
			error: function(xhr, status, error){
	            		alert("Token err : " + error);
			}
		});
	  }

	  function call_kko_simul() {
		var kakao_url   = oacxurl + "/oacx/relay.jsp?cxid=" + $('input[name=res_cxid]').val() ;
		//var kko_data = '{"certTxId": ' + $('input[name=res_cxid]').val() + '}';

  		$.ajax({
  			method : 'get',
	  		url  : kakao_url,
  			data : '',
  			dataType : 'json',
	  		contentType : 'application/json; charset=UTF-8',
  			success : function(d){
  				if(d.resultCode < 0){
  					alert(d.error_description);
  					return false;
	  			}
  			},
			error: function(xhr, status, error){
	            		alert("kakao sign err : " + error);
			}
		});
	  }

	function fncAuth(){
		fncClear();
		setKakaoCallback($('select[name=s_provider]').val(), $('select[name=s_deviceBrowser]').val());

		var authdata = auth_data();
		oacxurl   = $('input[name=token_url]').val();
		$.ajax({
  			method : 'post',
	  		url  : oacxurl+req_auth,
  			data : authdata,
  			dataType : 'json',
	  		contentType : 'application/json; charset=UTF-8',
  			success : function(d){
				if (d.resultCode == "200") {
					$('input[name=res_cxid]').val(d.cxId);
					$('input[name=res_returntoken]').val(d.token);
					$('input[name=kko_cxid]').val(d.cxId);
					$('input[name=pay_session]').val(d.cxId);
					if(typeof d.reqTxId != 'undefined')
						$('input[name=res_reqtxid]').val(d.reqTxId);
					try {
						if(typeof d.data.extProperties != 'undefined') {
							try { $('input[name=res_telcoTxid]').val(d.data.extProperties.telcoTxid); } catch (e) {}
							try { $('input[name=res_deeplinkUri]').val(d.data.extProperties[0].deeplinkUri); } catch (e) {}
						}
					} catch (e) {}
				} else {

				}

  				if (d.resultCode > 301){
  					alert(d.providerResultCode + " : " + d.clientMessage);
  					return false;
	  			}

  			},
			error: function(xhr, status, error){
	            		alert("Auth Err : "+error);
			}
		});
	}
  function fncResult(){
    if($('input[name=res_returntoken]').val() == ''){
      alert("인증후 가능합니다.");
      return false;
    }
    var authdata = auth_res_data();
    oacxurl   = $('input[name=token_url]').val();

		$.ajax({
  			method : 'post',
	  		url  : oacxurl + req_result,
  			data : authdata,
  			dataType : 'json',
	  		contentType : 'application/json; charset=UTF-8',
  			success : function(d){
				if (d.resultCode == "200") {
				  alert(" 결과 : "+d.clientMessage + "["+d.resultCode+"]");
				} else {

				}

  				if (d.resultCode > 301){
  					alert(d.providerResultCode + " : " + d.clientMessage);
  					return false;
	  			}

  			},
			error: function(xhr, status, error){
	            		alert("Auth Err : "+error);
			}
		});
	}

  function auth_data(){
		var data = {
				"provider": $('select[name=s_provider]').val(),
				"token": $('input[name=a_token]').val(),
				"txId":$('input[name=a_txId]').val(),
				"cxId":$('input[name=res_cxid]').val(),
				"appInfo": {
				 	"code": "sample",
				 	"path": "/sample/login",
				 	"type": "simple-auth"
				},
				"userInfo": {
					"isMember": false,
					"name": btoa(unescape(encodeURIComponent($('input[name=a_name]').val()))),
					"phone": $('input[name=a_phone]').val(),
					"ssn1": "",
					"ssn2": "",
					"birthday": $('input[name=a_birthday]').val(),
					"privacy": 1,
					"terms": 1,
					"policy3": 1,
					"policy4": 1,
					"telcoTycd": $('select[name=s_telcoTycd]').val()
				},
				"deviceInfo": {
					"code": $('select[name=s_deviceCd]').val(),
					"browser": $('select[name=s_deviceBrowser]').val(),
				},
				"contentInfo": {
					"signType": "ENT_SIMPLE_AUTH",
					"signTarget": ""
				},
				"providerOptionInfo": {
					"callbackUrl": $('input[name=a_callbackUrl]').val(),
					"reqCSPhoneNo": $('input[name=a_reqCSPhoneNo]').val(),
					"upmuGb":$('input[name=a_upmuGb]').val(),
					"isUseTss": $('input[name=a_isUseTss]').val(),
					"isNotification": $('input[name=a_isNotification]').val(),
					"isPASSVerify": $('input[name=a_isPASSVerify]').val(),
					"isUserAgreement": $('input[name=a_isUserAgreement]').val()
				}
			};
		return JSON.stringify(data);
	}

  function auth_res_data(){
		var data = {
				"provider": $('select[name=s_provider]').val(),
				"token": $('input[name=res_returntoken]').val(),
				"txId":$('input[name=a_txId]').val(),
        "cxId":$('input[name=res_cxid]').val(),
				"appInfo": {
				 	"code": "sample",
				 	"path": "/sample/login",
				 	"type": "simple-auth"
				},
				"userInfo": {
					"isMember": false,
					"name": btoa(unescape(encodeURIComponent($('input[name=a_name]').val()))),
					"phone": $('input[name=a_phone]').val(),
					"ssn1": "",
					"ssn2": "",
					"birthday": $('input[name=a_birthday]').val(),
					"privacy": 1,
					"terms": 1,
					"policy3": 1,
					"policy4": 1,
          "telcoTycd": $('select[name=s_telcoTycd]').val()
				},
				"deviceInfo": {
					"code": $('select[name=s_deviceCd]').val(),
					"browser": $('select[name=s_deviceBrowser]').val(),
				},
				"contentInfo": {
					"signType": "ENT_SIMPLE_AUTH",
					"signTarget": "name=홍길동,issue=2021-01-03T14:00:34"
				},
				"providerOptionInfo": {
					"callbackUrl": $('input[name=a_callbackUrl]').val(),
					"reqCSPhoneNo": $('input[name=a_reqCSPhoneNo]').val(),
					"upmuGb":$('input[name=a_upmuGb]').val(),
					"isUseTss": $('input[name=a_isUseTss]').val(),
					"isNotification": $('input[name=a_isNotification]').val(),
					"isPASSVerify": $('input[name=a_isPASSVerify]').val(),
					"isUserAgreement": $('input[name=a_isUserAgreement]').val()
				}
			};
		return JSON.stringify(data);
	}


	function fncClear(){
		$('input[name=res_cxid]').val("");
		$('input[name=kko_cxid]').val("");
		$('input[name=pay_session]').val("");
		$('input[name=res_reqtxid]').val("");
		$('input[name=res_telcoTxid]').val("");
    $('input[name=res_returntoken]').val("");
	}


  function getTelcoData(rid,tid,cid,calback,calurl) {
    // 분류 정보
    var devtype = true;//True 개발 _ False 운영
    //OS & Browser
    var ostype = checkMobile() ;
    var bwtype =  $('select[name=s_deviceBrowser]').val();
    var telcoTycd = $('select[name=s_telcoTycd]').val()
    //
    var skpName = "com.sktelecom.tauth";
    var skscheme = "tauthlink";
    var skhost = "certauth";
    var sk_universal_link = "https://passhome-qa.minwise.co.kr/applink/certauth";

    var lgupName = "com.lguplus.smartotp";
    var lguscheme = "upluscorporation";
    var lguhost = "";
    var lgu_universal_link = "https://fidotest.uplus.co.kr/rp/lgauthPass";

    var ktpName = "kt.fido.sw.asm.api";
    var ktscheme = "ktpasslink20";
    var kthost = "requestSignCert";
    var kt_universal_link = "https://kaf.dayside.co.kr/requestSignCert";

    if(!devtype){//REAL
          ktpName = "com.kt.kauth";
          kt_universal_link = "https://fido.kt.com/requestSignCert";
          lgu_universal_link = "https://fido.uplus.co.kr/rp/lgauthPass";
          sk_universal_link = "https://www.sktpass.com/applink/certauth";
    }
    var str = "";

    if(ostype == "IOS"){
      //universal_link
      if(telcoTycd == "S"){
        str = sk_universal_link + "?reqTxId="+rid+"&certTxId="+cid+"&telcoTxId="+tid;
      }else if (telcoTycd == "K"){
        str = kt_universal_link + "?reqTxId="+rid+"&certTxId="+cid+"&telcoTxId="+tid;
      }else if(telcoTycd == "L"){
        str = lgu_universal_link + "?reqTxId="+rid+"&certTxId="+cid+"&telcoTxId="+tid;
      }
    }else{//AOS
      //URISCHEME
      //AOS SCHEME Data
        if(telcoTycd == "S"){
          str = skscheme+ "://"+skhost+"?reqTxId="+rid+"&telcoTxId="+tid+"&certTxId="+cid;
        }else if (telcoTycd == "K"){
          str = ktscheme+ "://"+kthost+"?reqTxId="+rid+"&telcoTxId="+tid+"&certTxId="+cid;
        }else if(telcoTycd == "L"){
          str = lguscheme+ "://?reqTxId="+rid+"&telcoTxId="+tid+"&certTxId="+cid+"&sc=004";
        }
    }
    //210407 아톤요청 BW 구분하여 콜백제거
    if( bwtype.indexOf('WB') != 0){
      if(ostype == "IOS"){
        if (telcoTycd == "L"){
          str += calback+"&sc=004"+calurl;
        }else{
          str += calback+calurl;
        }
      }
    }else{
      if (calback != ""){
        str += calback+calurl;
      }
    }
    return str;
  }


  function makePassData(){

    //통신사PASS인경우 앱 호출시에만 reqtxid 40자리중 위 20자리만 사용
    var reqid = $('input[name=res_reqtxid]').val().substring(20, 40);
    var telcoid = $('input[name=res_telcoTxid]').val();
    var certid = $('input[name=res_cxid]').val();
    var ostype = checkMobile() ;

    var callscheme = "&callbackScheme=app2appdummy";
    var callurl = "&packageName=com.atoncorp.app2appdummy";

    if(ostype == "IOS"){
      var callscheme = "&callbackScheme=App2AppDummy";
      var callurl = "&callBackUrl="+$('input[name=a_callbackUrl]').val();
    }

    var callurl =  getTelcoData(reqid,telcoid,certid,callscheme,callurl);

    return callurl;
  }

	function call_kko() {
		var inCxid = $('input[name=kko_cxid]').val();
		//var resStr = "kakaotalk://me/cert/sign?tx_id="+inCxid;
    var resStr = "alphatalk://me/cert/sign?tx_id="+inCxid;
		alert("Call : "+ resStr);
		location.href = resStr;
	}

	function call_payco() {
	  var pay_session = $('input[name=pay_session]').val();
		alert("payco://open/certificate?session="+pay_session );
		location.href = "payco://open/certificate?session="+pay_session;
	}

	function call_kbbank() {
		alert("KB은행 호출");
		location.href = "Kbbank://call?cmd=move_to&id=web&url=/mquics?page=C063953&urlparam=serno:JMMnk0yyHOujGtkjYLkdNtjsoIsVTwL5qkcPWcduATo,authtype:1,urlScheme:kbcard://screen=A&depth=2kind:kkbank,chnId:40,pagId:C066263";
	}

  function call_pass_skt() {
		alert("PASS SKT 호출");
		var resStr = makePassData();
		alert("call : "+resStr);
		location.href = resStr;
	}
	function call_pass_kt() {
		alert("PASS KT 호출");
		var resStr = makePassData();
		alert("call : "+resStr);
		location.href = resStr;
	}

	function call_pass_lgu() {
		alert("PASS LGU+ 호출");
    var resStr = makePassData();
		alert("call : "+resStr);
		location.href = resStr;
	}

	function call_samsungpass() {
    alert("삼성PASS 호출");
	var deeplinkUri = $('input[name=res_deeplinkUri]').val();
    //alert("call : " + "samsungpass://cert/sign?requestId="+ $('input[name=res_cxid]').val());
	//	location.href = "samsungpass://cert/sign?requestId="+ $('input[name=res_cxid]').val();
	alert("call2 : " + deeplinkUri);
	location.href = deeplinkUri;
	}

	function call_native() {
		window.Android.call_msg("Sned Script to Native ");
	}

  function call_sample() {
    alert("sample 호출");

  	// location.href = "intent://apphost/success?data=zxcv&state=success#Intent;scheme=appscheme;package=com.raonsecure.oneaccesscx.demo;S.browser_fallback_url=http%3a%2f%2fplay.google.com%2fstore%2fapps%2fdetails%3fid%3dcom.google.android.apps.maps;end";
    location.href = "ktpasslink20://requestSignCert?reqTxId=reqid&telcoTxId=telcoid&certTxId=certid&callbackScheme=kakaotalk&packageName=com.kakao.talk";
  }


	function compareVersion(verA, verB){
	  var result = true;
	  verA = verA.split( '.' ); // .을 기준으로 문자열 배열로 만든다 [6][8]
	  verB = verB.split( '.' ); // .을 기준으로 문자열 배열로 만든다 [6][7][99]

	  const length = Math.max( verA.length, verB.length ); // 배열이 긴쪽의 length를 구함

	  for ( var i = 0; i < length ; i ++ ){
		var a = verA[i] ? parseInt(verA[i], 10 ) : 0; // 10진수의 int로 변환할 값이 없을 때 0으로 값을 넣습니다.
		var b = verB[i] ? parseInt(verB[i], 10 ) : 0;
		//alert( a +' > ' + b + ' : ' + ( a > b ) );
		if ( a < b ) {
		  result = false;
		  break;
		}
	  }
	return result;
	}

	function checkMobile(){
		var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기
		if ( varUA.indexOf('android') > -1) {
		   //안드로이드
			return "AOS";
		} else if ( varUA.indexOf("iphone") > -1||varUA.indexOf("ipad") > -1||varUA.indexOf("ipod") > -1 ) {
			//IOS
			return "IOS";
		} else {
			//아이폰, 안드로이드 외
			return "other";
		}
	}

	function checkSpecialBrowser(){
		var varUA = navigator.userAgent.toLowerCase();
		if ( varUA.indexOf('kakaotalk') > -1) {
		   //카카오인앱브라우저
			return "WBK";
		} else {
			return "WB";
		}
	}

	function getKakaoWebVersion(){
		var varUA = navigator.userAgent.toLowerCase();
		var point = varUA.indexOf('kakaotalk');
		if ( point > -1) {
		   var data = varUA.substring(point+10);
		   //alert(checkMobile());
		   //alert("[" + data + "]");
		   return data;
		} else {
			//alert ("I'm not kakaobrowser");
			return "0";
		}
	}

	function setKakaoCallback(provider, browser_cd) {
    if (provider == 'kakao_test') {
      if (browser_cd == 'HY' || browser_cd == 'NA') {
        alert('설정 Callback URI Scheme');
      }else if (browser_cd == 'WB'){// 210413 WB 이면서 안드이면 CLOSE 셋팅
        if (checkMobile() == "AOS") {
          alert("callbackUrl : alphatalk://me/talk_close");
          $('input[name=a_callbackUrl]').val('alphatalk://me/talk_close');
        }
      }// END WB
      else {
        // 카카오브라우저인지 확인
        if (checkSpecialBrowser() == "WBK") {
          $('select[name=s_deviceBrowser]').val('WBK').prop('selected', true);
          var kakao_ver = getKakaoWebVersion();
          alert("kakao_ver :"+kakao_ver);
          if (checkMobile() == "IOS") {
            // 버전체크 - 9.3.0 비교 /
            if (compareVersion(kakao_ver, '9.3.0')) {
              alert("callbackUrl : empty");
              $('input[name=a_callbackUrl]').val();
            }else {
              alert("업그레이드 필요");
            }
          } else if (checkMobile() == "AOS") {
            // 버전체크 - 2109150 비교
            if (compareVersion(kakao_ver, '2109150')) {
              alert("callbackUrl is empty");
              $('input[name=a_callbackUrl]').val('');
            }else {
              alert("업그레이드 필요");
            }//END VER
          } else {
            alert('PC');
          }
        }
      }//end test
		}
	}



	</script>
</html>
