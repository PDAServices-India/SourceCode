package com.pda.rebounz.utils;

import java.sql.Connection;
import java.sql.DriverManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**Class Used To Create DataBase Connection.
 * @author Manojsundar.G
 *
 */
public class DaoConnection {
	
	private Connection conn;
	private Logger LOGGER = LoggerFactory.getLogger(getClass());

	/**DataBase Connection Creation.
	 * @return
	 * @throws Exception
	 */
	public Connection getConnection() throws Exception {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:SampleJava4");
		LOGGER.info("Connection Established");    
		return conn;
	}
}
