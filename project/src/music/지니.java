package music;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class 지니 {

	MusicDTO dto = new MusicDTO();
	MusicDAO dao = new MusicDAO();

	public static void main(String[] args) {
		String url = "https://www.genie.co.kr/chart/top200";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements element = doc.select("td.info");
		// 원하는 내용이 있는 틀(?) 입력

		MusicDAO dao = new MusicDAO();
		ArrayList list = new ArrayList();
		int n = 0;
		
		for (Element artist : element.select("a.artist.ellipsis")) { // 가수명
			MusicDTO dto = new MusicDTO();
			try {
				dto.setArtist(artist.text());
				list.add(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		n=0;
		for (Element cover : element.select("span.mask")) { // 앨범커버 사진주소
			MusicDTO dto = new MusicDTO();
			try {
				dto.setGenre(cover.text());
				list.add(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		n=0;
		
		for (Element title : element.select("a.title.ellipsis")) { // 노래제목
			MusicDTO dto = new MusicDTO();
			try {
				dto = (MusicDTO) list.get(n);
				dto.setTitle(title.text());
				dao.insert(dto);
				n++;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("가수, 제목 DB저장완료");
	}

}