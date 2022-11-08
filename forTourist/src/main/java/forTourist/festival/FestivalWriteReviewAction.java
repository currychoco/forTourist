package forTourist.festival;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import forTourist.review.ReviewDao;
import forTourist.review.ReviewDto;

/**
 * Servlet implementation class FestivalWriteReviewAction
 */
@WebServlet("/FestivalWriteReviewAction")
public class FestivalWriteReviewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalWriteReviewAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null){
			response.sendRedirect("login");
		}else{
			int contentId=Integer.parseInt(request.getParameter("contentId"));
			String content=request.getParameter("content");
			String userid = (String)session.getAttribute("id");

			ReviewDao dao = ReviewDao.getInstance();
			ReviewDto dto = new ReviewDto(contentId, userid, content);
			dao.setReview(dto);

			response.sendRedirect("/forTourist/detailFestival?contentId=" + contentId);
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
