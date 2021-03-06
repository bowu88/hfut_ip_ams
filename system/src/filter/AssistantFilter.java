package filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import user.Assistant;

/**
 * Servlet Filter implementation class AssistantFilter
 */
@WebFilter("/assistant/*")
public class AssistantFilter implements Filter {

    public AssistantFilter() {
    }
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		Assistant ass = (Assistant) req.getSession().getAttribute("assistant");
		Boolean judge = (Boolean)req.getSession().getAttribute("judge");
		if(ass!=null)
		{
		  @SuppressWarnings("unchecked")
		  Map<String, Boolean> idMap = (Map<String, Boolean>) request.getServletContext().getAttribute("ID");
		  Boolean tmp = idMap.get(ass.getAsID());
		  if(tmp!=judge)
		  {
			request.setAttribute("msg", "在别的地方已被登陆，请重新登陆");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		  }
		  chain.doFilter(request, response);
		}
		else {
			request.setAttribute("msg", "请先登陆");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
