package ru.mail.libverify.accounts;
/* loaded from: classes3.dex */
public final class a {
    public String a;
    public String b;

    /* renamed from: ru.mail.libverify.accounts.a$a  reason: collision with other inner class name */
    /* loaded from: classes3.dex */
    public enum EnumC0281a {
        WHATSAPP_ACCOUNT("com.whatsapp"),
        TELEGRAM_S_ACCOUNT("org.telegram.messenger.account"),
        TELEGRAM_S_EDITION_ACCOUNT("org.telegram.android.account"),
        VIBER_ACCOUNT("com.viber.voip.account"),
        ICQ_ACCOUNT("com.icq.mobile.client"),
        ODKL_ACCOUNT("ru.ok.android");
        
        String mPackageName;

        EnumC0281a(String str) {
            this.mPackageName = str;
        }
    }

    public a(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final String toString() {
        return "package: " + this.a + ", name:" + this.b;
    }
}
