package ru.vallione.DAO;

import java.util.List;

public interface TownService {
	List<Shtuttgart> findAll();
	Shtuttgart findById(int id);
	Shtuttgart save(Shtuttgart place);
	void delete(int id);
}
