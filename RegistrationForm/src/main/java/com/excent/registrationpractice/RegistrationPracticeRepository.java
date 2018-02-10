package com.excent.registrationpractice;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface RegistrationPracticeRepository extends CrudRepository<RegistrationPractice, Long> {
	@Transactional
	@Query(value="select * from registrationtable where id=?1",nativeQuery=true)
    public List<RegistrationPractice> findById(long id);
}
