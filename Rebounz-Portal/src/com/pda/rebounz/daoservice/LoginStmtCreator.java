package com.pda.rebounz.daoservice;

import java.sql.SQLException;

import org.springframework.jdbc.core.PreparedStatementCreator;

import com.pda.rebounz.model.LoginDetails;

/**
 * The Interface LoginStmtCreator.
 */
public interface LoginStmtCreator {

    /**
     * Credentials Match.
     *
     * @param sql the sql
     * @param loginDetails loginDetails
     *
     * @return the prepared statement creator
     *
     * @throws SQLException the SQL exception
     */
    PreparedStatementCreator credentialsMatch(final String sql,
            final LoginDetails loginDetails) throws SQLException;

    PreparedStatementCreator statusCheck(final String sql,
            final String userName) throws SQLException;

	PreparedStatementCreator updatePwdStatus(final String sql, 
			final LoginDetails loginDetails) throws SQLException;
   
}
