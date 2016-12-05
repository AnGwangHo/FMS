package com.cz.fms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * AuthInterceptor는 preHandle()을 이용하여 사용자의 로그인 상태를 체크하고 컨트롤러를 호출할것인지를 결정한다.
 * 로그인한 상태가 아니라면 '/member/member_login"으로 이동하게한다.
 * @author 임영묵
 *
 */
public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	/** AuthInterceptor는 saveDest() 메소드를 이용해 사용자가 원하는 페이지의 정보를 HttpSession에 'dest라는 이름으로 저장하고
	 * 'GET'방식인 경우에는 URI정보 뒤의 파라미터들을 함께 보관한다. */
	private void saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if( query == null || query.equals("null")){
			query = "";
		}else{
			query = "?" + query;
		}
		
		if ( req.getMethod().equals("GET")){
			logger.info("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}

	/** AuthInterceptor 을 사용할시에만 반응하는 프리 핸들러.*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session =  request.getSession();
		
		/** 로그인 안했을시에는 로그인창으로 이동한다. */
		if(session.getAttribute("login") != null){
			
			logger.info("로그인한 상태가 아닙니다.");
			
			saveDest(request);
			
			response.sendRedirect("member/member_login");
			return false;
			}
		/** 로그인시 자동으로 넘어간다 */
		return true;
	}	
}
