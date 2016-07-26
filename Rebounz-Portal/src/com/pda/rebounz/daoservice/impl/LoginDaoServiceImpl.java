package com.pda.rebounz.daoservice.impl;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.pda.rebounz.constants.QueryRepo;
import com.pda.rebounz.daoservice.LoginDaoService;
import com.pda.rebounz.daoservice.LoginStmtCreator;
import com.pda.rebounz.daoservice.beans.CommonBean;
import com.pda.rebounz.daoservice.beans.rowmapper.LoginExtractor;
import com.pda.rebounz.daoservice.beans.rowmapper.RoleExtractor;
import com.pda.rebounz.daoservice.beans.rowmapper.StatusExtractor;
import com.pda.rebounz.model.LoginDetails;

public class LoginDaoServiceImpl extends JdbcDaoSupport implements
        LoginDaoService {

    /** used for Logging. */
	private Logger LOGGER = LoggerFactory.getLogger(getClass());
    
    private LoginStmtCreator loginStmtCreator;

	public LoginStmtCreator getLoginStmtCreator() {
		return loginStmtCreator;
	}

	public void setLoginStmtCreator(LoginStmtCreator loginStmtCreator) {
		this.loginStmtCreator = loginStmtCreator;
	}

	public boolean authentication(LoginDetails loginDetails) {
		LOGGER.info("Entered into Authentication");
		boolean finalStatus = Boolean.FALSE;
		LOGGER.info("Login Details bean value UNAME : " + loginDetails.getUsername());
		try {
            final PreparedStatementCreator psc1 = getLoginStmtCreator().credentialsMatch(QueryRepo.CHECK, loginDetails);
            CommonBean userValue = (CommonBean) getJdbcTemplate().query(
                    psc1, new LoginExtractor());
            if(userValue.getUsername().equalsIgnoreCase(loginDetails.getUsername())) {
            	LOGGER.info("Authentication Success");
            	finalStatus = Boolean.TRUE;
            } else {
            	LOGGER.info("Authentication Failed");
            	finalStatus = Boolean.FALSE;
            }
		} catch (SQLException e) {
			LOGGER.error(e.getMessage(), e);
		}
		LOGGER.info("Exiting LoginDaoserviceImpl Method After Validation");
		return finalStatus;
	}

	public boolean statusCheck(LoginDetails loginDetails) {
		LOGGER.info("Enetered Into statusCheck Method");
		LOGGER.debug("Login Details Bean Value statusCheck(UserName): " + loginDetails.getUsername());
		try {
			final PreparedStatementCreator psc1 = getLoginStmtCreator().statusCheck(QueryRepo.STATUS_CHECK,
					loginDetails.getUsername());
			CommonBean userStatus = (CommonBean) getJdbcTemplate().query(psc1, new StatusExtractor());
			if (userStatus != null && userStatus.getStatus().equalsIgnoreCase("Active")) {
				LOGGER.debug("Status : " + userStatus.getStatus());
				return true;
			} else {
				LOGGER.debug("Status : " + userStatus.getStatus() + " --> Redirecting to Password Restore Page");
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return false;
	}
	
	/**Password and Status Update.
	 * @param loginDetails
	 * @return sets status as active 
	 */
	public boolean pwdUpdate(LoginDetails loginDetails) {
		LOGGER.info("Enetered Into pwdUpdate Method");
		LOGGER.debug("Login Details Bean Value pwdUpdate(New Password): " + loginDetails.getPasswordNew());
		try {
			final PreparedStatementCreator psc1 = getLoginStmtCreator()
					.updatePwdStatus(QueryRepo.PWD_STATUS_UPDATE, loginDetails);
			getJdbcTemplate().update(psc1);
			LOGGER.info("Password && Status Updated");
			return true;
		  }
		 catch (Exception e) { 
			 LOGGER.error(e.getMessage(), e);
		}
		return false;
	}
	
	/**
	 * To Check Role Of Signed User & Checking Role Called From Admin flow.
	 * 
	 * @param username
	 * @return role of the user
	 */
	public String getRole(String username) {
		String role = null;
		logger.info("Entered Into RoleCheck Method");
		try {
			LOGGER.debug("username : " + username);
			final PreparedStatementCreator psc1 = getLoginStmtCreator().statusCheck(
					QueryRepo.ROLE_CHECK, username);
			CommonBean userRole = (CommonBean) getJdbcTemplate()
					.query(psc1, new RoleExtractor());
			role = userRole.getRole();
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return role;
	}

}
