package com.cn.utils;

import java.net.InetAddress;
import java.util.Calendar;

import org.apache.catalina.util.StringParser;

public class CodeTeacherUtil {
    private static final int IP;
    static {
        int ipadd;
        try {
            ipadd = toInt(InetAddress.getLocalHost().getAddress());
        } catch (Exception e) {
            ipadd = 0;
        }
        IP = ipadd;
    }
    private static short counter = (short) 0;
    private static final int JVM = (int) (System.currentTimeMillis() >>> 8);

    public static int toInt(byte[] bytes) {
        int result = 0;
        for (int i = 0; i < 4; i++) {
            result = (result << 8) - Byte.MIN_VALUE + (int) bytes[i];
        }
        return result;
    }

    /**
     * Unique in a local network
     */
    protected int getIP() {
        return IP;
    }

    /**
     * Unique down to millisecond
     */
    protected short getHiTime() {
        return (short) (System.currentTimeMillis() >>> 32);
    }

    protected int getLoTime() {
        return (int) System.currentTimeMillis();
    }

    /**
     * Unique across JVMs on this machine (unless they load this class in the
     * same quater second - very unlikely)
     */
    protected int getJVM() {
        return JVM;
    }

    protected String format(int intval) {
        String formatted = Integer.toHexString(intval);
        StringBuffer buf = new StringBuffer("00000000");
        buf.replace(8 - formatted.length(), 8, formatted);
        return buf.toString();
    }

    protected String format(short shortval) {
        String formatted = Integer.toHexString(shortval);
        StringBuffer buf = new StringBuffer("0000");
        buf.replace(4 - formatted.length(), 4, formatted);
        return buf.toString();
    }

    public String generate() {
    	Calendar calendar = Calendar.getInstance();
    	//System.out.println("现在："+calendar.getTime().getTime());
    	calendar.add(Calendar.YEAR, 10);
    	//System.out.println("10年后："+calendar.getTime().getTime());
    	String aString=String.valueOf(calendar.getTime().getTime()) ;
    	 return aString;
    }

    protected short getCount() {
        synchronized (CodeTeacherUtil.class) {
            if (counter < 0)
                counter = 0;
            return counter++;
        }
    }

    public static void main(String[] args) {
        CodeTeacherUtil uuidHexGenerator = new CodeTeacherUtil();
        String generate = uuidHexGenerator.generate();
        System.out.println(generate);
        int ip2 = uuidHexGenerator.getIP();
        System.out.println(ip2);
    }
}