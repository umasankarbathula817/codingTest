package com.hwinterview.ecommerce.data.repository;

import com.hwinterview.ecommerce.data.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
