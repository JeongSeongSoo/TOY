package org.toy.web.resume.service;

import java.util.List;

import org.toy.web.resume.model.PersonalHistoryVO;
import org.toy.web.resume.model.UserHistoryVO;

public interface ResumeService {

	int addPersonal(PersonalHistoryVO param);

	UserHistoryVO loadResume();

	List<PersonalHistoryVO> loadPersonalByCreator();

	int removePersonalByHid(PersonalHistoryVO param);

}
