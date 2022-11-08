package forTourist.Api;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import forTourist.review.ReviewDao;
import forTourist.review.ReviewDto;

/**
 * Servlet implementation class AreaReviewUpdateAction
 */
@WebServlet("/AreaReviewUpdateAction")
public class AreaReviewUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public AreaReviewUpdateAction() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		ReviewDto dto = new ReviewDto(no, content);

		ReviewDao dao = ReviewDao.getInstance();
		dao.updateReview(dto);
		
		String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
		String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
		String addr1En = URLEncoder.encode(addr1De, "utf-8");
		String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
		
		response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En
				+ "&&firstimage=" + firstimage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		doGet(request, response);
	}

}
