package com.smartbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartbank.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {

    Optional<Admin> findByUsername(String username);
}