package controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import forTourist.review.ReviewDao;

/**
 * Servlet implementation class ReviewDeleteAction
 */
@WebServlet("/ReviewDeleteAction")
public class ReviewDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String userId = request.getParameter("userId");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");


		ReviewDao dao = ReviewDao.getInstance();
		if(userId.equals(id)){
			dao.deleteReview(no);
			response.sendRedirect("/forTourist/detailFestival?contentId="+ contentId);
		}else{
			response.sendRedirect("/forTourist/detailFestival?contentId="+ contentId);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
