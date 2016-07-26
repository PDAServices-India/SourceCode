package com.pda.rebounz.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;

import com.pda.rebounz.model.LoginDetails;

/**
 * Validation For Login Details.
 * 
 * @author Manojsundar.G
 *
 */
public class LoginDetailsValidator {

	/** The Constant LOGGER. */
	private Logger LOGGER = LoggerFactory.getLogger(getClass());

	/**
	 * Validation For SignIn View.
	 * 
	 * @param loginDetails
	 * @param mContext
	 */
	public void validateSignInView(LoginDetails loginDetails, MessageContext mContext) {
		LOGGER.info("Entered ValidateSignInView Method");
		LOGGER.debug("UserName " + loginDetails.getUsername());
		LOGGER.debug("Password " + loginDetails.getPassword());
		Pattern pattern1 = Pattern.compile("[A-Za-z0-9]+");
		Matcher matUsername = pattern1.matcher(loginDetails.getUsername());
		boolean matchUsername = matUsername.matches();
		Matcher matPassword = pattern1.matcher(loginDetails.getPassword());
		boolean matchPassword = matPassword.matches();
		if (!matchUsername) {
			mContext.addMessage(
					new MessageBuilder().error().source("username").code("loginDetails.username.invalid").build());
			LOGGER.info("Invalid username");
		}
		if (!matchPassword) {
			mContext.addMessage(
					new MessageBuilder().error().source("password").code("loginDetails.password.invalid").build());
			LOGGER.info("Invalid password");
		}
		LOGGER.info("Exiting Validate Method");
	}

	/**
	 * Validation For Password Reset Page.
	 * 
	 * @param loginDetails
	 * @param mContext
	 */
	public void validatePwdReset(LoginDetails loginDetails, MessageContext mContext) {
		LOGGER.info("Entered ValidatePwdReset Method");
		LOGGER.debug("UserName " + loginDetails.getUsername());
		LOGGER.debug("New Password " + loginDetails.getPasswordNew());
		LOGGER.debug("Confirm Password " + loginDetails.getPasswordConfirm());
		LOGGER.info("Exiting Validate Method");
		Pattern pattern1 = Pattern.compile("[A-Za-z0-9]+");
		Matcher matPassword = pattern1.matcher(loginDetails.getPasswordNew());
		boolean matchPassword = matPassword.matches();
		if (!matchPassword) {
			mContext.addMessage(new MessageBuilder().error().source("passwordNew")
					.code("loginDetails.passwordNew.invalid").build());
			LOGGER.info("New Password invalid");
		}
		if (!loginDetails.getPasswordNew().equals(loginDetails.getPasswordConfirm())) {
			mContext.addMessage(new MessageBuilder().error().source("passwordConfirm")
					.code("loginDetails.passwordConfirm.invalid").build());
			LOGGER.info("Password And Confirm Passwords Do Not Match");
		}
	}
}
