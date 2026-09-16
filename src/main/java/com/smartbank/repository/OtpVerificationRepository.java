package com.smartbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartbank.entity.OtpVerification;

public interface OtpVerificationRepository 
        extends JpaRepository<OtpVerification, Long> {

    Optional<OtpVerification> findTopByEmailOrderByIdDesc(String email);
}