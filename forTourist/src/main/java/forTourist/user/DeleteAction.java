package forTourist.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteAction
 */
@WebServlet("/DeleteAction")
public class DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDao userDao = UserDao.getInstance();
		UserDto user = null;

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		user = userDao.getUserById(id);
		userDao.deleteUser(id);

		if (user != null) {
			String checkPassword = user.getPassword();
			String checkId = user.getId();

			if (id.equals(checkId) && password.equals(checkPassword)) {
				userDao.deleteUser(id);
				HttpSession session = request.getSession();
				session.setAttribute("id", null);
				response.sendRedirect("home");
			} else {
				response.sendRedirect("home");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
	}

}
