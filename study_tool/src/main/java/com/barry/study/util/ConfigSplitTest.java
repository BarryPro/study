package com.barry.study.util;

import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * @author yuchenglong03
 * @since 2019-04-26 17:05
 */
public class ConfigSplitTest {
    private static final String under_line = "_";

    private Map<String,String> sources;
    private Map<String,String> actions;
    private Map<String,String> timeouts;

    @Before
    public void init() {
        sources = new HashMap();
        sources.put("ZHONGLIAN","中联");
        sources.put("DONGXIN","东信");
        sources.put("TENCENT","腾讯");
        sources.put("CHINA_MOBILE","移动");

        actions = new HashMap<>();
        actions.put("unbind_axb","AXB解绑");
        actions.put("unbind_ax","AX解绑");
        actions.put("update_ax","AX更新");

        timeouts = new HashMap<>();
        timeouts.put("conn_request_timeout=400","请求链接超时时间");
        timeouts.put("conn_timeout=100","链接超时时间");
        timeouts.put("socket_timeout=400","读取超时时间");
    }

    @Test
    public void config() {

        for (String source : sources.keySet()) {
            for (String action : actions.keySet()) {
                for (String timeout : timeouts.keySet()) {
                    StringBuilder sbComment = new StringBuilder();
                    StringBuilder sbKey = new StringBuilder();
                    sbComment.append("# ").append(sources.get(source)).append(under_line).append(actions.get(action)).append(under_line).append(timeouts.get(timeout));
                    sbKey.append(source).append(under_line).append(action).append(under_line).append(timeout);
                    System.out.println(sbComment.toString());
                    System.out.println(sbKey.toString());
                }
            }
        }
    }
}
