package com.barry.study_ui.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yuchenglong03
 * @since 2018/1/11 下午2:41
 */
@Controller
@RequestMapping("/tools/privatenumber/vpbillcheckmail")
public class PrivacyBillCheckController {

    @GetMapping
    public String index() {
        return "tools/vpbillcheck";
    }
}
