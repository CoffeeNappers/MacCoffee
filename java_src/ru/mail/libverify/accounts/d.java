package ru.mail.libverify.accounts;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber;
import java.util.ArrayList;
import java.util.Iterator;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public final class d extends ArrayList<e> {
    volatile String a;
    private volatile String b;
    private volatile String c;
    private volatile String d;
    private volatile String e;
    private volatile String f;
    private volatile String g;
    private volatile String h;
    private volatile String i;
    private volatile String j;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
    /* loaded from: classes3.dex */
    public static final class a extends Enum<a> {
        public static final int a = 1;
        public static final int b = 2;
        public static final int c = 3;
        private static final /* synthetic */ int[] d = {a, b, c};
    }

    private void n() {
        String str = "";
        Iterator<e> it = iterator();
        String str2 = "";
        while (it.hasNext()) {
            e next = it.next();
            if (!TextUtils.isEmpty(next.e)) {
                if (!TextUtils.isEmpty(str2)) {
                    str2 = str2 + ",";
                }
                str2 = str2 + next.e;
            }
            if (!TextUtils.isEmpty(next.d)) {
                if (!TextUtils.isEmpty(str)) {
                    str = str + ",";
                }
                str = str + next.d;
            }
        }
        this.g = str2;
        this.f = str;
    }

    public final int a(@NonNull String str) {
        if (!l() || isEmpty()) {
            return a.c;
        }
        try {
            Iterator<e> it = iterator();
            PhoneNumberUtil phoneNumberUtil = null;
            while (it.hasNext()) {
                e next = it.next();
                if (TextUtils.isEmpty(next.e)) {
                    return a.b;
                }
                String str2 = next.e;
                int length = str2.length() - 1;
                int length2 = str.length() - 1;
                int i = 0;
                while (length >= 0 && length2 >= 0) {
                    int i2 = length;
                    char charAt = str2.charAt(length);
                    while (i2 > 0 && !Character.isDigit(charAt)) {
                        int i3 = i2 - 1;
                        i2 = i3;
                        charAt = str2.charAt(i3);
                    }
                    int i4 = i2 - 1;
                    char charAt2 = str.charAt(length2);
                    while (length2 > 0 && !Character.isDigit(charAt2)) {
                        length2--;
                        charAt2 = str.charAt(length2);
                    }
                    length2--;
                    if (charAt == charAt2 && Character.isDigit(charAt)) {
                        i++;
                        length = i4;
                    }
                }
                ru.mail.libverify.utils.d.c("Utils", "equal digits from end %s %s = %d", str2, str, Integer.valueOf(i));
                if (i != next.e.length() || i != str.length()) {
                    if (i >= Math.max(next.e.length(), str.length()) / 2) {
                        PhoneNumberUtil phoneNumberUtil2 = phoneNumberUtil == null ? PhoneNumberUtil.getInstance() : phoneNumberUtil;
                        switch (phoneNumberUtil2.isNumberMatch(phoneNumberUtil2.parseAndKeepRawInput(next.e, next.d), str)) {
                            case SHORT_NSN_MATCH:
                            case NSN_MATCH:
                            case EXACT_MATCH:
                                return a.a;
                            default:
                                phoneNumberUtil = phoneNumberUtil2;
                                break;
                        }
                    }
                } else {
                    return a.a;
                }
            }
            return a.c;
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SimCardData", "failed to check sim phone number");
            return a.b;
        }
    }

    public final ru.mail.libverify.accounts.a a() {
        try {
            PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil.getInstance();
            Iterator<e> it = iterator();
            while (it.hasNext()) {
                e next = it.next();
                if (!TextUtils.isEmpty(next.e)) {
                    Phonenumber.PhoneNumber parseAndKeepRawInput = phoneNumberUtil.parseAndKeepRawInput(next.e, next.d);
                    if (phoneNumberUtil.isValidNumber(parseAndKeepRawInput)) {
                        return new ru.mail.libverify.accounts.a("", parseAndKeepRawInput.getRawInput());
                    }
                }
            }
        } catch (NumberParseException e) {
            ru.mail.libverify.utils.d.a("SimCardData", "error during phone validation process", e);
        } catch (Exception e2) {
            ru.mail.libverify.utils.d.a("SimCardData", "error during libphonenumber usage", e2);
        }
        return null;
    }

    public final String b() {
        if (this.b == null) {
            synchronized (this) {
                if (this.b == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.b)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(m.a(next.b));
                        }
                    }
                    this.b = sb.toString();
                }
            }
        }
        return this.b;
    }

    public final String c() {
        if (this.a == null) {
            synchronized (this) {
                if (this.a == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.f)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(next.f);
                        }
                    }
                    this.a = sb.toString();
                }
            }
        }
        return this.a;
    }

    public final String d() {
        if (this.i == null) {
            synchronized (this) {
                if (this.i == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.j)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(next.j);
                        }
                    }
                    this.i = sb.toString();
                }
            }
        }
        return this.i;
    }

    public final String e() {
        if (this.j == null) {
            synchronized (this) {
                if (this.j == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.i)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(next.i);
                        }
                    }
                    this.j = sb.toString();
                }
            }
        }
        return this.j;
    }

    public final String f() {
        if (this.c == null) {
            synchronized (this) {
                if (this.c == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.c)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(m.a(next.c));
                        }
                    }
                    this.c = sb.toString();
                }
            }
        }
        return this.c;
    }

    public final String g() {
        if (this.d == null) {
            synchronized (this) {
                if (this.d == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.b)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(m.a(m.a(next.b)));
                        }
                    }
                    this.d = sb.toString();
                }
            }
        }
        return this.d;
    }

    public final String h() {
        if (this.e == null) {
            synchronized (this) {
                if (this.e == null) {
                    StringBuilder sb = new StringBuilder();
                    Iterator<e> it = iterator();
                    while (it.hasNext()) {
                        e next = it.next();
                        if (!TextUtils.isEmpty(next.c)) {
                            if (!TextUtils.isEmpty(sb)) {
                                sb.append(",");
                            }
                            sb.append(m.a(m.a(next.c)));
                        }
                    }
                    this.e = sb.toString();
                }
            }
        }
        return this.e;
    }

    public final String i() {
        if (this.g == null) {
            synchronized (this) {
                if (this.g == null) {
                    n();
                }
            }
        }
        return this.g;
    }

    public final String j() {
        if (this.f == null) {
            synchronized (this) {
                if (this.f == null) {
                    n();
                }
            }
        }
        return this.f;
    }

    public final String k() {
        String str;
        if (this.h == null) {
            synchronized (this) {
                if (this.h == null) {
                    if (!isEmpty()) {
                        if (size() == 1) {
                            str = get(0).d;
                            this.h = str;
                        } else {
                            Iterator<e> it = iterator();
                            String str2 = null;
                            while (it.hasNext()) {
                                e next = it.next();
                                if (!TextUtils.isEmpty(next.d)) {
                                    if (TextUtils.isEmpty(str2)) {
                                        str2 = next.d;
                                    } else if (!str2.equalsIgnoreCase(next.d)) {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    str = "";
                    this.h = str;
                }
            }
        }
        return this.h;
    }

    public final boolean l() {
        String c = c();
        return !TextUtils.isEmpty(c) && !TextUtils.equals(c, "no_permission");
    }

    public final boolean m() {
        boolean z = false;
        if (!l() || isEmpty()) {
            return false;
        }
        Iterator<e> it = iterator();
        while (true) {
            boolean z2 = z;
            if (!it.hasNext()) {
                return z2;
            }
            z = it.next().g | z2;
        }
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        String str = "";
        Iterator<e> it = iterator();
        while (it.hasNext()) {
            e next = it.next();
            if (!TextUtils.isEmpty(str)) {
                str = str + ",";
            }
            str = str + next.toString();
        }
        return "SimCardData{items='[" + str + "]'}";
    }
}
