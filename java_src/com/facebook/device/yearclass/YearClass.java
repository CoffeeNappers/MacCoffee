package com.facebook.device.yearclass;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
/* loaded from: classes.dex */
public class YearClass {
    public static final int CLASS_2008 = 2008;
    public static final int CLASS_2009 = 2009;
    public static final int CLASS_2010 = 2010;
    public static final int CLASS_2011 = 2011;
    public static final int CLASS_2012 = 2012;
    public static final int CLASS_2013 = 2013;
    public static final int CLASS_2014 = 2014;
    public static final int CLASS_2015 = 2015;
    public static final int CLASS_UNKNOWN = -1;
    private static final long MB = 1048576;
    private static final int MHZ_IN_KHZ = 1000;
    private static volatile Integer mYearCategory;

    public static int get(Context c) {
        if (mYearCategory == null) {
            synchronized (YearClass.class) {
                if (mYearCategory == null) {
                    mYearCategory = Integer.valueOf(categorizeByYear2016Method(c));
                }
            }
        }
        return mYearCategory.intValue();
    }

    private static void conditionallyAdd(ArrayList<Integer> list, int value) {
        if (value != -1) {
            list.add(Integer.valueOf(value));
        }
    }

    private static int categorizeByYear2016Method(Context c) {
        long totalRam = DeviceInfo.getTotalMemory(c);
        if (totalRam == -1) {
            return categorizeByYear2014Method(c);
        }
        return totalRam <= 805306368 ? DeviceInfo.getNumberOfCPUCores() <= 1 ? CLASS_2009 : CLASS_2010 : totalRam <= 1073741824 ? DeviceInfo.getCPUMaxFreqKHz() < 1300000 ? CLASS_2011 : CLASS_2012 : totalRam <= 1610612736 ? DeviceInfo.getCPUMaxFreqKHz() >= 1800000 ? CLASS_2013 : CLASS_2012 : totalRam <= 2147483648L ? CLASS_2013 : totalRam <= 3221225472L ? CLASS_2014 : CLASS_2015;
    }

    private static int categorizeByYear2014Method(Context c) {
        ArrayList<Integer> componentYears = new ArrayList<>();
        conditionallyAdd(componentYears, getNumCoresYear());
        conditionallyAdd(componentYears, getClockSpeedYear());
        conditionallyAdd(componentYears, getRamYear(c));
        if (componentYears.isEmpty()) {
            return -1;
        }
        Collections.sort(componentYears);
        if ((componentYears.size() & 1) == 1) {
            return componentYears.get(componentYears.size() / 2).intValue();
        }
        int baseIndex = (componentYears.size() / 2) - 1;
        return ((componentYears.get(baseIndex + 1).intValue() - componentYears.get(baseIndex).intValue()) / 2) + componentYears.get(baseIndex).intValue();
    }

    private static int getNumCoresYear() {
        int cores = DeviceInfo.getNumberOfCPUCores();
        if (cores < 1) {
            return -1;
        }
        return cores == 1 ? CLASS_2008 : cores <= 3 ? CLASS_2011 : CLASS_2012;
    }

    private static int getClockSpeedYear() {
        long clockSpeedKHz = DeviceInfo.getCPUMaxFreqKHz();
        if (clockSpeedKHz == -1) {
            return -1;
        }
        return clockSpeedKHz <= 528000 ? CLASS_2008 : clockSpeedKHz <= 620000 ? CLASS_2009 : clockSpeedKHz <= 1020000 ? CLASS_2010 : clockSpeedKHz <= 1220000 ? CLASS_2011 : clockSpeedKHz <= 1520000 ? CLASS_2012 : clockSpeedKHz <= 2020000 ? CLASS_2013 : CLASS_2014;
    }

    private static int getRamYear(Context c) {
        long totalRam = DeviceInfo.getTotalMemory(c);
        if (totalRam <= 0) {
            return -1;
        }
        return totalRam <= 201326592 ? CLASS_2008 : totalRam <= 304087040 ? CLASS_2009 : totalRam <= 536870912 ? CLASS_2010 : totalRam <= 1073741824 ? CLASS_2011 : totalRam <= 1610612736 ? CLASS_2012 : totalRam <= 2147483648L ? CLASS_2013 : CLASS_2014;
    }
}
