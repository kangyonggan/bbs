package com.kangyonggan.util;

/**
 * 字符串工具类
 *
 * @author kangyonggan
 * @since 16/4/29
 */
public class StringUtil {

    /**
     * 判断字符串是否为空
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }

    /**
     * 判断字符串是否不为空
     *
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        return str != null && str.trim().length() > 0;
    }

    /**
     * 判断字符串是否有空
     *
     * @param arr
     * @return
     */
    public static boolean isNotEmpty(String... arr) {
        for (String str : arr) {
            if (isEmpty(str)) {
                return true;
            }
        }
        return false;
    }
}
