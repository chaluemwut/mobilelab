package rmuti.labapi.model.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import rmuti.labapi.model.table.UserProfile;

import java.util.List;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {

    UserProfile findByUserNameAndPassWord(String userName, String passWord);

    UserProfile findByUserName(String userName);

}
