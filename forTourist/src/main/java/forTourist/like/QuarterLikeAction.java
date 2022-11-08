package forTourist.like;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import forTourist.util.RequestUtil;

/**
 * Servlet implementation class FestivalReviewAction
 */
@WebServlet("/QuarterLikeAction")
public class QuarterLikeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuarterLikeAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		String userId = (String)request.getSession().getAttribute("id");
		int contentId = Integer.parseInt(request.getParameter("contentId"));

		LikeDao dao = LikeDao.getInstance();

		LikeDto dto = dao.getLikebyTwoId(contentId, userId);
		List<LikeDto> list = dao.getLikeAllbyContentId(contentId);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("count", list.size());
		result.put("dto", dto);

		PrintWriter res = response.getWriter();
		res.println(new Gson().toJson(result));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		// result data
		Map<String, Object> result = new HashMap<String, Object>();

		// get body in request inputStream
		String body = RequestUtil.getBody(request);

		// get body params in body json
		Map<String, String> params = new Gson().fromJson(body, Map.class);

		// get userid in session
		final String userId = (String) request.getSession().getAttribute("id");

		// get params from body
		final int contentId = Integer.parseInt(params.get("contentId"));

		LikeDao dao = LikeDao.getInstance();

		LikeDto dto = dao.getLikebyTwoId(contentId, userId);

		if(dto != null) { // 좋아요 있으면 삭제
			dao.deleteLike(contentId, userId);
			result.put("msg", "DELETED");
		} else { // 좋아요 없으면 등록
			dto = new LikeDto(dao.getLastNo(), contentId, userId);
			dao.createLike(dto);
			result.put("msg", "CREATED");
		}

		result.put("result", "OK");
		PrintWriter res = response.getWriter();
		res.println(new Gson().toJson(result));
	}

}
