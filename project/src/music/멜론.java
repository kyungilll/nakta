package music;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class 멜론 {

	MusicDTO dto = new MusicDTO();
	MusicDAO dao = new MusicDAO();

	public static void main(String[] args) {
		// Jsoup를 이용해서 네이버 스포츠 크롤링
		String url = "https://www.melon.com/chart/index.htm";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements element = doc.select("div.service_list_song type02 d_song_list");
		// 원하는 내용이 있는 틀(?) 입력

		MusicDAO dao = new MusicDAO();
		ArrayList list = new ArrayList();
		MusicDTO dto = new MusicDTO();
		int n = 0;
		
		for (Element artist : element.select("a")) { // 가수명
			
			try {
				dto.setArtist(artist.text());
				list.add(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		n=0;
		for (Element views : element.select("td")) { // 좋아요수
			try {
				dto = (MusicDTO) list.get(n);
				int view = Integer.parseInt(views.text());
				System.out.println(views.text());
				dto.setViews(view);
				list.add(n, dto);
				n++;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		n=0;
		for (Element title : element.select("div.wrap_song_info")) { // 노래제목
			try {
				dto = (MusicDTO) list.get(n);
				dto.setTitle(title.text());
				dao.insert(dto);
				n++;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}