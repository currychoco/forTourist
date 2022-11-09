package forTourist.festival;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import forTourist.review.ReviewDao;
import forTourist.review.ReviewDto;

/**
 * Servlet implementation class ReviewUpdateAction
 */
@WebServlet("/FestivalReviewUpdateAction")
public class FestivalReviewUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalReviewUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("no : " + request.getParameter("no"));
		System.out.println("content : " + request.getParameter("content"));
		System.out.println("contentId : " + request.getParameter("contentId"));

		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		ReviewDto dto = new ReviewDto(no, content);

		ReviewDao dao = ReviewDao.getInstance();
		dao.updateReview(dto);

		response.sendRedirect("/forTourist/detailFestival?contentId=" + contentId);
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
