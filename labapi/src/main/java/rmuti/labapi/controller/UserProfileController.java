package rmuti.labapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import rmuti.labapi.model.bean.APIResponse;
import rmuti.labapi.model.service.UserProfileRepository;
import rmuti.labapi.model.table.UserProfile;

@RestController
@RequestMapping("/user")
public class UserProfileController {

    @Autowired
    private UserProfileRepository userProfileRepository;

    @PostMapping("/register")
    public Object save(UserProfile userProfile) {
        APIResponse res = new APIResponse();
        UserProfile userProfileDb = userProfileRepository.findByUserName(userProfile.getUserName());
        if (userProfileDb == null) {
            res.setStatus(0);
            userProfileRepository.save(userProfile);
        } else {
            res.setStatus(1);
            res.setMessage("User exist");
        }
        return res;
    }

    @PostMapping("/login")
    public Object login(@RequestParam String userName, @RequestParam String passWord) {
        APIResponse res = new APIResponse();
        UserProfile userProfile = userProfileRepository.findByUserNameAndPassWord(userName, passWord);
        if (userProfile == null) {
            res.setStatus(1);
            res.setMessage("ไม่มีผู้ใช้");
        } else {
            res.setStatus(0);
            res.setData(userProfile.getId());
        }
        return res;
    }


}
