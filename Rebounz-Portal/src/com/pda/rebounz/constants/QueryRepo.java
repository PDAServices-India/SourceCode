package com.pda.rebounz.constants;

public final class QueryRepo {

    /**
     * private constructor - restricts Instantiation of this class.
     */
    private QueryRepo() {
    }

    /** The CHEC k1. */
    public static final String CHECK = "select uname from nuser where "
    + "uname=? and pwd=?";

    public static final String STATUS_CHECK = "select status from nuser where uname=?";
    
    public static final String PWD_STATUS_UPDATE = "update nuser set pwd=?,status=? where uname=?";
    
    public static final String ROLE_CHECK = "select role from nuser where uname=?";

}
