package com.pda.rebounz.daoservice.beans.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.pda.rebounz.daoservice.beans.CommonBean;

public class RoleExtractor implements ResultSetExtractor {

    /** The Constant LOGGER. */
	private Logger LOGGER = LoggerFactory.getLogger(getClass());

    /**
     * Retrieve extractData stmt.
     *
     * @param rs the rs
     *
     * @return the prepared statement creator
     *
     * @throws SQLException the SQL exception
     */
    public final Object extractData(final ResultSet rs) throws SQLException {
        CommonBean commonBean = new CommonBean();
        if (rs.next()) {
        	commonBean.setRole(rs.getString("role"));
            LOGGER.info("Role in RoleExtractor : " + rs.getString("role"));
        }
        return commonBean;
    }
}
