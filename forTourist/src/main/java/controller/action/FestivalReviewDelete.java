package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import forTourist.review.ReviewDao;

public class FestivalReviewDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int no = Integer.parseInt(request.getParameter("no"));
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String userId = request.getParameter("userId");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ReviewDao dao = ReviewDao.getInstance();
		if (userId.equals(id)) {
			dao.deleteReview(no);
			try {
				response.sendRedirect("/forTourist/detailFestival?contentId=" + contentId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			try {
				response.sendRedirect("/forTourist/detailFestival?contentId=" + contentId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
