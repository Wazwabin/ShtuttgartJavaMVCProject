package ru.vallione.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;

@Repository
@Transactional
@Service("townService")
public class TownServiceImpl implements TownService {
	
	private TownRepository townRep;
	
	@Autowired
	public void setTownRepository(TownRepository townRep) {
		this.townRep = townRep;
	}

	@Transactional(readOnly=true) 
	public List<Shtuttgart> findAll() {
		return Lists.newArrayList(townRep.findAll());
	}

	@Transactional(readOnly=true)
	public Shtuttgart findById(int id) {
		return townRep.findOne(id);
	}


	public Shtuttgart save(Shtuttgart place) {
		return townRep.save(place);
	}

	public void delete(int id) {
		townRep.delete(id);
	}
}