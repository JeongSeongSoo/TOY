package org.toy.web.resume.mapper;

import java.util.List;

import org.toy.web.resume.model.PersonalHistoryVO;

public interface ResumeMapper {

	int addPersonal(PersonalHistoryVO param);

	List<PersonalHistoryVO> loadPersonalByCreator(String creator);

	int removePersonalByHid(PersonalHistoryVO param);

}
