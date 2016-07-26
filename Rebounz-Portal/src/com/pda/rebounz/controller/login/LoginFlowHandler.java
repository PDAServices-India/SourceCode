package com.pda.rebounz.controller.login;

import org.springframework.webflow.mvc.servlet.AbstractFlowHandler;

/** This class handles the Login flow. Any exception in the flow will be captured in this class.
 * @author Manojsundar.G
 *
 */
public class LoginFlowHandler extends AbstractFlowHandler {
  
  
   /* public String handleException(FlowException e, HttpServletRequest request, HttpServletResponse response) 
    {
    	System.out.println("Inside Login Flow Handler");
    	String view = "admin.do"; 
    	if (e.getStackTrace() != null) {
             return "login.do";
         } else {
             return view;
         }
    }*/
}
