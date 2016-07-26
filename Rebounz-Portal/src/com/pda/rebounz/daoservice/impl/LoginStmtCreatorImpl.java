package com.pda.rebounz.daoservice.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.pda.rebounz.constants.Constants;
import com.pda.rebounz.daoservice.LoginStmtCreator;
import com.pda.rebounz.model.LoginDetails;

public class LoginStmtCreatorImpl implements LoginStmtCreator {

    /** used for Logging. */
	private Logger LOGGER = LoggerFactory.getLogger(getClass());

	public PreparedStatementCreator credentialsMatch(final String sql,
			final LoginDetails loginDetails) throws SQLException {
		PreparedStatementCreator psc = new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(
                    final Connection conn) throws SQLException {
                PreparedStatement statement = conn.prepareStatement(sql);
                try {
                    statement.setString(Constants.ONE, loginDetails.getUsername());
                    statement.setString(Constants.TWO, loginDetails.getPassword());
                } catch (SQLException e) {
                    LOGGER.error(e.getMessage(), e);
                }
                return statement;
            }
        };
        return psc;
	}

	public PreparedStatementCreator statusCheck(final String sql,
			final String userName) throws SQLException {
		PreparedStatementCreator psc = new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(
                    final Connection conn) throws SQLException {
                PreparedStatement statement = conn.prepareStatement(sql);
                try {
                    statement.setString(Constants.ONE, userName);
                } catch (SQLException e) {
                    LOGGER.error(e.getMessage(), e);
                }
                return statement;
            }
        };
        return psc;
	}

	@Override
	public PreparedStatementCreator updatePwdStatus(final String sql,
			final LoginDetails loginDetails) throws SQLException {
		PreparedStatementCreator psc = new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(
                    final Connection conn) throws SQLException {
                PreparedStatement statement = conn.prepareStatement(sql);
                try {
                    statement.setString(Constants.ONE, loginDetails.getPasswordNew());
                    statement.setString(Constants.TWO, "Active");
                    statement.setString(Constants.THREE, loginDetails.getUsername());
                } catch (SQLException e) {
                    LOGGER.error(e.getMessage(), e);
                }
                return statement;
            }
        };
        return psc;
	}
	
}
