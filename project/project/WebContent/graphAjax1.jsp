<%@page import="bean.ChartDTO"%><%@page import="bean.ChartDAO"%><%@page import="java.io.Console"%><%@page import="bean.MusicDTO"%><%@page import="java.util.ArrayList"%><%@page import="bean.MusicDAO"%><%@page import="org.jsoup.Jsoup"%><%@page import="org.jsoup.nodes.Document"%><%@page import="org.jsoup.nodes.Element"%><%@page import="org.jsoup.select.Elements"%><%@page import="java.io.IOException"%><%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%><%
		ChartDAO dao = new ChartDAO();
		ChartDTO dto = new ChartDTO();
		Document doc = null;
		String song = ("89095473;89126699;88965638;89059621;87928158;88915147;88261335;88947057;88965633;89091983;88727092;88773173;89117145;88987356;89011319;88978973;88824340;89091924;88707240;88686378;88709300;89119858;89058209;88501296;87840106;88890308;88965632;88732246;88965627;88336380;89126695;89064462;88281290;88607738;88511064;88728543;88504833;88510820;88933143;88740321;88674285;87506735;88965631;88510821;86941521;88353506;88732247;88948788;88707238;88773174;88951935;88074702;86925465;88323996;86868163;87998685;87752744;88725289;88559277;86380457;89059750;88562939;82779996;88773175;88352905;88194599;88909978;88098432;86432095;88421579;88773178;88316432;88244288;85803478;86496239;87512697;88355491;87315030;87034188;85433670;88914149;87957296;88773176;88697586;88295011;88611219;86978532;88286541;88557156;87101034;88728375;88468830;88419409;88689633;87628996;88678985;86468828;88542731;88684311;88353726;86083393;89101027;88363609;88417558;88564550;87579522;87683188;87463712;87360263;88773177;87298263;88040624;87647017;86978777;87271938;89059697;88776558;88391129;88690398;88251225;88971182;87946017;88646493;87240368;88162019;88253990;88965635;85448749;84861691;87270282;88234302;88149389;88703035;89056956;87470580;87115262;88928855;87526820;82689882;88573751;85902355;86868102;88773172;88280580;87699632;87993384;88117581;87538960;88470489;87101441;87931536;88914905;88736570;87893782;88732249;89096273;89021253;87444264;87440992;88671402;89127237;89097560;88965628;86855495;88350489;88062821;88953188;82784658;88656476;88401806;88740322;89126696;88913981;88857817;89139222;89117146;88040625;89126573;86311323;18082664;87403636;88656700;87663449;88579548;87730738;86594795;86589601;87466348;89126578;87235670;87413975;88336403;88528811;87815703;88413854;87421474;89125327;88701549;87479651;88293633;");
		String[] value = song.split(";");
		//200곡의 각 번호 / 장르, 재생횟수 탐색시 사용 / 수시로 업데이트
		//0번이 200위 / 199번이 1위

		String url1 = "https://www.genie.co.kr/detail/songInfo?xgnm=";
		dao.delete();

		String title = null;
		String genre = null;
		int count = 0;
		String time = null;

		int n = 0;
		for (int i = 0; i < 200; i++) { //1위부터 200위까지 반복
			String url = url1 + String.valueOf(value[199 - i]); // 각 노래 상세페이지
			doc = Jsoup.connect(url).get();

			for (Element el : doc.select("div.info-zone h2.name")) { // title 가져옴
				title = el.text();
				break;
			}

			n = 0;
			for (Element el : doc.select("div.info-zone li span.value")) { // 재생시간 가져올 것 !!!
				if (n < 3) {
					n++;
				} else {
					String xx = el.text();
					time =xx.replaceAll("\\:", "");
					break;
				}
			}

			n = 0;
			for (Element el : doc.select("div.info-zone li span.value")) { // genre 가져옴
				if (n < 2) {
					n++;
				} else {
					genre = el.text();
					break;
				}
			}
			
			n = 0;
			for (Element el : doc.select("div.total p")) { // 재생횟수 가져옴
				if (n < 1) {
					n++;
				} else {
					String xx = el.text();
					count = Integer.parseInt(xx.replaceAll("\\,", "")); // 천단위 콤마 없애고 숫자로 만듦
					break;
				}
			}
			dao.update(title, time, genre, count);
		}

		ArrayList<ChartDTO> list = dao.selectAll();

		ArrayList temp = null;
		ChartDTO dto1 = new ChartDTO();
		int[] popCount = new int[2];
		int[] genreCount = new int[8];
		
		for (int i = 0; i < 2; i++) {
			temp = dao.pop(i);
			popCount[i]=temp.size();
		} // 가요와 팝 각각의 노래수 배열
		
		for (int i = 0; i < 8; i++) {
			temp = dao.genre(i);
			genreCount[i]=temp.size();
		} // 8개 장르별 노래수 배열
	%><%=popCount[0]%>,<%=popCount[1]%>,<%=genreCount[0]%>,<%=genreCount[1]%>,<%=genreCount[2]%>,<%=genreCount[3]%>,<%=genreCount[4]%>,<%=genreCount[5]%>,<%=genreCount[6]%>,<%=genreCount[7]%>