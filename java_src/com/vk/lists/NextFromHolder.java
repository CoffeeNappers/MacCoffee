package com.vk.lists;

import com.facebook.appevents.AppEventsConstants;
/* loaded from: classes2.dex */
class NextFromHolder {
    private volatile String nextFrom = AppEventsConstants.EVENT_PARAM_VALUE_NO;
    private int pageSize = 30;

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public synchronized void setIntNextFrom(int nextFrom) {
        setNextFrom(String.valueOf(nextFrom));
    }

    public synchronized int getIntNextFrom() {
        int i;
        try {
            i = Integer.parseInt(getNextFrom());
        } catch (Exception e) {
            i = 0;
        }
        return i;
    }

    public synchronized String getNextFrom() {
        return this.nextFrom;
    }

    public synchronized void setNextFrom(String nextFrom) {
        this.nextFrom = nextFrom;
    }

    public synchronized void incrementNextFrom(int totalCount) {
        if (getIntNextFrom() + this.pageSize >= totalCount) {
            setNextFrom(null);
        } else {
            setIntNextFrom(getIntNextFrom() + this.pageSize);
        }
    }
}
