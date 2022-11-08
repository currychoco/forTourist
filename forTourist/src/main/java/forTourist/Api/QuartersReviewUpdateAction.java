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
 * Servlet implementation class QuartersReviewUpdateAction
 */
@WebServlet("/QuartersReviewUpdateAction")
public class QuartersReviewUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuartersReviewUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		String tel = request.getParameter("tel");
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		ReviewDto dto = new ReviewDto(no, content);
		
		ReviewDao dao = ReviewDao.getInstance();
		dao.updateReview(dto);
		String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
		String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
		String addr1En = URLEncoder.encode(addr1De, "utf-8");
		String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");
		
		response.sendRedirect("/forTourist/detailArea?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En
				+ "&&firstimage=" + firstimage + "&tel=" + tel);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

	}

}
