package forTourist.Api;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import forTourist.review.ReviewDao;

/**
 * Servlet implementation class KeywordReviewDeleteAction
 */
@WebServlet("/KeywordReviewDeleteAction")
public class KeywordReviewDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KeywordReviewDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int no = Integer.parseInt(request.getParameter("no"));
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String userId = request.getParameter("userId");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");


		String title=URLEncoder.encode(request.getParameter("title"),"utf-8");
		String addr1De = URLDecoder.decode(request.getParameter("addr1"), "utf-8");
		String addr1En = URLEncoder.encode(addr1De, "utf-8");
		String firstimage=URLEncoder.encode(request.getParameter("firstimage"),"utf-8");

		ReviewDao dao = ReviewDao.getInstance();
		if(userId.equals(id)){
			dao.deleteReview(no);
			response.sendRedirect("/forTourist/detailKeyword?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En
					+ "&&firstimage=" + firstimage);
		}else{
			response.sendRedirect("/forTourist/detailKeyword?contentid=" + contentId + "&&title=" + title + "&&addr1=" + addr1En
					+ "&&firstimage=" + firstimage);
		}
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
