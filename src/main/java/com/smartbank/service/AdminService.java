package com.smartbank.service;

import com.smartbank.entity.Admin;

public interface AdminService {

    Admin login(String username, String password);

}