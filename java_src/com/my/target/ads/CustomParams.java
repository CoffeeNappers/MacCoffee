package com.my.target.ads;

import android.content.Context;
import com.my.target.Tracer;
import com.my.target.core.providers.a;
import com.my.target.core.utils.c;
/* loaded from: classes2.dex */
public final class CustomParams extends a {
    private String[] emails;
    private String[] icqIds;
    private String[] okIds;
    private String[] vkIds;

    /* loaded from: classes2.dex */
    public interface Gender {
        public static final int FEMALE = 2;
        public static final int MALE = 1;
        public static final int UNKNOWN = 0;
        public static final int UNSPECIFIED = -1;
    }

    public final String getMrgsAppId() {
        return getParam("mrgs_app_id");
    }

    public final void setMrgsAppId(String str) {
        addParam("mrgs_app_id", str);
    }

    public final String getMrgsUserId() {
        return getParam("mrgs_user_id");
    }

    public final void setMrgsUserId(String str) {
        addParam("mrgs_user_id", str);
    }

    public final String getMrgsId() {
        return getParam("mrgs_device_id");
    }

    public final void setMrgsId(String str) {
        addParam("mrgs_device_id", str);
    }

    public final String getEmail() {
        if (this.emails == null || this.emails.length <= 0) {
            return null;
        }
        return this.emails[0];
    }

    public final void setEmail(String str) {
        this.emails = new String[]{str};
        addParam("email", str);
    }

    public final String[] getEmails() {
        return this.emails;
    }

    public final void setEmails(String[] strArr) {
        this.emails = strArr;
        addParam("email", c.a(strArr));
    }

    public final String getIcqId() {
        if (this.icqIds == null || this.icqIds.length <= 0) {
            return null;
        }
        return this.icqIds[0];
    }

    public final void setIcqId(String str) {
        this.icqIds = new String[]{str};
        addParam("icq_id", str);
    }

    public final String[] getIcqIds() {
        return this.icqIds;
    }

    public final void setIcqIds(String[] strArr) {
        this.icqIds = strArr;
        addParam("icq_id", c.a(strArr));
    }

    public final String getOkId() {
        if (this.okIds == null || this.okIds.length <= 0) {
            return null;
        }
        return this.okIds[0];
    }

    public final void setOkId(String str) {
        this.okIds = new String[]{str};
        addParam("ok_id", str);
    }

    public final String[] getOkIds() {
        return this.okIds;
    }

    public final void setOkIds(String[] strArr) {
        this.okIds = strArr;
        addParam("ok_id", c.a(strArr));
    }

    public final String getVKId() {
        if (this.vkIds == null || this.vkIds.length <= 0) {
            return null;
        }
        return this.vkIds[0];
    }

    public final void setVKId(String str) {
        this.vkIds = new String[]{str};
        addParam("vk_id", str);
    }

    public final String[] getVKIds() {
        return this.vkIds;
    }

    public final void setVKIds(String[] strArr) {
        this.vkIds = strArr;
        addParam("vk_id", c.a(strArr));
    }

    public final void collectData(Context context) {
    }

    public final void setLang(String str) {
        addParam("lang", str);
    }

    public final String getLang(String str) {
        return getParam("lang");
    }

    public final int getGender() {
        String param = getParam("g");
        if (param == null) {
            return -1;
        }
        try {
            return Integer.parseInt(param);
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public final void setGender(int i) {
        switch (i) {
            case -1:
                removeParam("g");
                return;
            case 0:
            case 1:
            case 2:
                addParam("g", String.valueOf(i));
                return;
            default:
                Tracer.d("unable to set gender " + i + " please use 0,1,2 or -1 to remove gender param");
                return;
        }
    }

    public final int getAge() {
        String param = getParam("a");
        if (param == null) {
            return 0;
        }
        try {
            return Integer.parseInt(param);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    public final void setAge(int i) {
        if (i == -1) {
            removeParam("a");
        } else {
            addParam("a", String.valueOf(i));
        }
    }

    public final void setCustomParam(String str, String str2) {
        addParam(str, str2);
    }

    public final String getCustomParam(String str) {
        return getParam(str);
    }
}
