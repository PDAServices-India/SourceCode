package com.pda.rebounz.controller.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.binding.message.MessageContext;
import org.springframework.webflow.action.MultiAction;
import org.springframework.webflow.context.servlet.ServletExternalContext;
import org.springframework.webflow.execution.RequestContext;

import com.pda.rebounz.daoservice.LoginDaoService;
import com.pda.rebounz.model.LoginDetails;

public class LoginController extends MultiAction {
	
	private Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	private LoginDaoService loginDaoImpl;
	
	public LoginDaoService getLoginDaoImpl() {
		return loginDaoImpl;
	}

	public void setLoginDaoImpl(LoginDaoService loginDaoImpl) {
		this.loginDaoImpl = loginDaoImpl;
	}

	/**Authenticating User.
	 * @param loginDetails
	 * @param context
	 * @param errors
	 * @return
	 */
	public Map<String, String> loginUser(LoginDetails loginDetails, 
			RequestContext context, MessageContext errors) {		 
		  LOGGER.info("LoginController.loginUser : " + loginDetails.getUsername());
		  Map<String, String> model = new HashMap<String, String>();
		  LOGGER.info("Inside Controller(loginUser)");
		  boolean result = loginDaoImpl.authentication(loginDetails);
		  if(result) {
		      model.put("view", "true");
		  } else {
			 model.put("view", "false");
		  }
		  return model;
	  }

	/**Checking The Status Of The User And Redirecting Accordingly.
	 * @param loginDetails
	 * @param context
	 * @param errors
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> availableStatus(LoginDetails loginDetails, 
			RequestContext context, MessageContext errors) throws Exception {
		  Map<String, String> model = new HashMap<String, String>();
		  LOGGER.info("Inside Controller(availableStatus)");
		  boolean res = loginDaoImpl.statusCheck(loginDetails);
		  context.getFlowScope().put("loginFormObject", loginDetails);
		  HttpServletRequest request =
		        (HttpServletRequest) ((ServletExternalContext) context
		        .getExternalContext()).getNativeRequest();
		  HttpSession session = request.getSession();
		  session.setAttribute("uname", loginDetails.getUsername());
		  LOGGER.debug("username in session: " + session.getAttribute("uname"));
		  if(res) {
		      model.put("view", "true");
		  } else {
			 model.put("view", "false");
		  }
		  return model;
	  }
	
	/** Password Restore.
	 * @param loginDetails
	 * @param context
	 * @param errors
	 * @return
	 */
	public Map<String, String> pwdRestore(LoginDetails loginDetails, 
			RequestContext context,MessageContext errors) {   
		  Map<String, String> model = new HashMap<String, String>();
		  LOGGER.info("Inside Controller(Pwd Restore)");
		  LOGGER.debug("LoginDetails Bean Value(username): " + loginDetails.getUsername() + ", " + loginDetails.getPassword());
		  LOGGER.debug("LoginDetails Bean Value(New Password): " + loginDetails.getPasswordNew());
		  LOGGER.debug("LoginDetails Bean Value(confirm Password): " + loginDetails.getPasswordConfirm());
		  boolean res = loginDaoImpl.pwdUpdate(loginDetails);
		  if(res) {
		      model.put("view", "true");
		  } else {
			 model.put("view", "false");
		  }
		  return model;
	  }
	
}
