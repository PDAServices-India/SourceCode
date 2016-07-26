package com.pda.rebounz.daoservice;

import com.pda.rebounz.model.LoginDetails;

public interface LoginDaoService {

    /**
     * Authentication.
     *
     * @param loginDetails
     *
     * @return true, if successful
     */
    boolean authentication(LoginDetails loginDetails);
    
    public boolean statusCheck(LoginDetails loginDetails);
    
    boolean pwdUpdate(LoginDetails loginDetails);

}
