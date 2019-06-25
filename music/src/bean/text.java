package bean;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class text {

	public static void main(String[] args) {
		
		
		String url = "https://www.genie.co.kr/magazine?ctid=1";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements element = doc.select("div.list-normal");
		for(Element check : element.select("li > a")){
			
			System.out.println(check.toString().substring(46,50));
			System.out.println("띄어쓰기");
		}

	}

}