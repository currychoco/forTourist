package forTourist.festival;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SyncFestivalAction
 */
@WebServlet("/SyncFestivalAction")
public class SyncFestivalAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SyncFestivalAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String areacode = request.getParameter("areacode");
		String booktour = request.getParameter("booktour");
		String cat1 = request.getParameter("cat1");
		String cat2 = request.getParameter("cat2");
		String cat3 = request.getParameter("cat3");
		String eventEndDate = request.getParameter("eventEndDate");
		String eventStartDate = request.getParameter("eventStartDate");
		String posterImage = request.getParameter("posterImage");
		double mapX = Double.parseDouble(request.getParameter("mapX"));
		double mapY = Double.parseDouble(request.getParameter("mapY"));
		
		String mlevelStr = request.getParameter("mlevel");
		int mlevel = 0;
		if(mlevelStr!=null && !"".equals(mlevelStr)){
			mlevel = Integer.parseInt(request.getParameter("mlevel"));
		}
		
		String sigungucode = request.getParameter("sigungucode");
		String tel = request.getParameter("tel");
		String title = request.getParameter("title");
			
		FestivalDto dto = new FestivalDto(
				contentId,
				addr1,
				addr2,
				areacode,
				booktour,
				cat1,
				cat2,
				cat3,
				eventEndDate,
				eventStartDate,
				posterImage,
				mapX,
				mapY,
				mlevel,
				sigungucode,
				tel,
				title
			);
		
		FestivalDao dao = FestivalDao.getInstance();
		
		FestivalDto exists = dao.findById(contentId);
		if(exists == null){
			dao.insertFestival(dto);
		}else{
			System.out.println(exists);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		doGet(request, response);
	}

}
