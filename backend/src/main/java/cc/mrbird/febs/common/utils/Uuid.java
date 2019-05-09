package cc.mrbird.febs.common.utils;

import java.util.UUID;

/**
 * @author 123
 * @create 2019/4/15
 */
public class Uuid {
    public static String getUUID() {
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        return uuid;
    }
}
