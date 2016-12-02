package com.cz.fms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * MemberController 에서 HttpSession과 관련된 작업이 처리된적이 없기때문에
 * HttpSession에 관련된 모든 설정은 인터셉터에서 처리해야한다.
 * LoginInterceptor는 /loginPost 로 접근하도록 설정하는게 주 목적이다.
 * @author 임영묵
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	
/*	static final String[] EXCLUDE_URL_LIST = {
		"/login"
		,"/join"
	};
	*/
	
	@Override  /** MemberController 에서 MemberVo라는 이름으로 객체를 담아둔 상태로, 이 상태를 체크해서 HttpSession에 저장한다. */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{	
		HttpSession session = request.getSession();
		ModelMap modelMap =  modelAndView.getModelMap();
		Object memberVo = modelMap.get("memberVo");
		logger.info(memberVo.toString());
		if(memberVo != null){		
			logger.info("새로운 로그인이 성공하였습니다 new login success!");
			session.setAttribute(LOGIN, memberVo);
			//response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest:"/");
		}
	}
	
	
	@Override   /** preHandled 에서는 HttpSession 에 남아있는 정보를 삭제하기위해 만들었다. */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session =  request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
			}
		return true;
	}	
}
