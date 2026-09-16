package com.smartbank.service.impl;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.smartbank.entity.Admin;
import com.smartbank.repository.AdminRepository;
import com.smartbank.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

    private final AdminRepository adminRepository;

    private final BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();

    public AdminServiceImpl(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public Admin login(String username, String password) {

        Admin admin =
                adminRepository
                .findByUsername(username)
                .orElse(null);

        if (admin == null) {
            return null;
        }

        if (!passwordEncoder.matches(
                password,
                admin.getPassword())) {

            return null;
        }

        return admin;
    }
}