package forTourist.want;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
@WebServlet("/QuarterWantAction")
public class QuarterWantAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuarterWantAction() {
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
		
		// get userid in session
		final String userId = (String) request.getSession().getAttribute("id");

		// get params from body
		final int contentId = Integer.parseInt(request.getParameter("contentId"));

		// connect db
		WantDao dao = WantDao.getInstance();

		// 찜 정보가 있는지 체크
		WantDto dto = dao.getWantbyTwoId(contentId, userId);

		PrintWriter res = response.getWriter();
		res.println(new Gson().toJson(dto));
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
		final String title = params.get("title");
		final String addr1 = params.get("addr1");
		final String firstimage = params.get("firstimage");

		final String url = String.format("/forTourist/detailQuarters?contentId=%d&title=%s&addr1=%s&firstimage=%s"
			, contentId
			, title
			, addr1
			, firstimage);

		WantDao dao = WantDao.getInstance();

		// 찜 정보가 있는지 체크
		WantDto dto = dao.getWantbyTwoId(contentId, userId);

		if (dto != null) { // 있으면 찜 해제(찜 데이터 삭제)
			dao.deleteWant(contentId, userId);
			result.put("msg", "DELETED");
		} else { // 없으면 찜 등록(찜 데이터 등록)
			dto = new WantDto(dao.getLastNo(), true, contentId, userId, title, url);
			dao.createWant(dto);
			result.put("msg", "CREATED");
		}

		result.put("result", "OK");
		PrintWriter res = response.getWriter();
		res.println(new Gson().toJson(result));
	}

}
