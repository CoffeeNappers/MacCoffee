package ru.mail.libverify.accounts;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.slf4j.Marker;
import ru.mail.libverify.accounts.a;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public final class c implements b {
    private final Context a;
    private String b;
    private List<a> c;
    private List<a> d;
    private List<a> e;
    private List<a> f;
    private List<a> g;
    private a h;

    public c(@NonNull Context context) {
        this.a = context;
    }

    private List<a> a(@NonNull Context context) {
        a.EnumC0281a[] values;
        Account[] accountsByType;
        if (this.c == null) {
            AccountManager accountManager = AccountManager.get(context);
            this.c = new ArrayList();
            for (a.EnumC0281a enumC0281a : a.EnumC0281a.values()) {
                for (Account account : accountManager.getAccountsByType(enumC0281a.mPackageName)) {
                    if (!TextUtils.isEmpty(account.name)) {
                        this.c.add(new a(enumC0281a.mPackageName, account.name));
                    }
                }
            }
        }
        return this.c;
    }

    private static a a(@NonNull PhoneNumberUtil phoneNumberUtil, @NonNull List<a> list) {
        try {
            for (a aVar : list) {
                if (!TextUtils.isEmpty(aVar.b)) {
                    String str = aVar.b;
                    if (!str.startsWith(Marker.ANY_NON_NULL_MARKER)) {
                        str = Marker.ANY_NON_NULL_MARKER + str;
                    }
                    try {
                        if (phoneNumberUtil.isValidNumber(phoneNumberUtil.parseAndKeepRawInput(str, null))) {
                            return new a(aVar.a, str);
                        }
                        continue;
                    } catch (NumberParseException e) {
                    }
                }
            }
        } catch (Exception e2) {
            ru.mail.libverify.utils.d.a("PhoneAccountFinder", "error during findBestMatchAccount", e2);
        }
        return null;
    }

    private List<a> b(@NonNull Context context) {
        if (this.f == null) {
            AccountManager accountManager = AccountManager.get(context);
            this.f = new ArrayList();
            Account[] accounts = accountManager.getAccounts();
            for (Account account : accounts) {
                if (!TextUtils.isEmpty(account.name)) {
                    this.f.add(new a(account.type, account.name));
                }
            }
        }
        return this.f;
    }

    private List<a> c(@NonNull Context context) {
        Cursor cursor;
        if (this.d == null) {
            this.d = new ArrayList();
            try {
                try {
                    cursor = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.Profile.CONTENT_URI, "data"), new String[]{"data1"}, "mimetype=?", new String[]{"vnd.android.cursor.item/phone_v2"}, null);
                } catch (IllegalArgumentException e) {
                    cursor = null;
                }
            } catch (Throwable th) {
                th = th;
                cursor = null;
            }
            try {
                if (cursor == null) {
                    List<a> emptyList = Collections.emptyList();
                    m.a(cursor);
                    return emptyList;
                }
                int columnIndex = cursor.getColumnIndex("data1");
                while (cursor.moveToNext()) {
                    this.d.add(new a("ContactsProfile", cursor.getString(columnIndex)));
                }
                m.a(cursor);
            } catch (Throwable th2) {
                th = th2;
                m.a(cursor);
                throw th;
            }
        }
        return this.d;
    }

    private List<a> d(@NonNull Context context) {
        Cursor cursor;
        Cursor cursor2 = null;
        if (this.e == null) {
            this.e = new ArrayList();
            StringBuilder sb = new StringBuilder("data1 IN (");
            Account[] accountsByType = AccountManager.get(context).getAccountsByType("com.google");
            if (accountsByType.length == 0) {
                return Collections.emptyList();
            }
            int length = accountsByType.length;
            for (int i = 0; i < length; i++) {
                sb.append("?,");
            }
            sb.setLength(sb.length() - 1);
            sb.append(')');
            try {
                Uri uri = ContactsContract.CommonDataKinds.Email.CONTENT_URI;
                String[] strArr = {"contact_id"};
                String sb2 = sb.toString();
                String[] strArr2 = new String[accountsByType.length];
                for (int i2 = 0; i2 < accountsByType.length; i2++) {
                    strArr2[i2] = accountsByType[i2].name;
                }
                Cursor query = context.getContentResolver().query(uri, strArr, sb2, strArr2, null);
                try {
                    if (query == null) {
                        List<a> emptyList = Collections.emptyList();
                        m.a(query);
                        m.a((Cursor) null);
                        return emptyList;
                    }
                    int columnIndex = query.getColumnIndex("contact_id");
                    StringBuilder sb3 = new StringBuilder("contact_id IN (");
                    if (!query.moveToFirst()) {
                        List<a> emptyList2 = Collections.emptyList();
                        m.a(query);
                        m.a((Cursor) null);
                        return emptyList2;
                    }
                    sb3.append(query.getLong(columnIndex));
                    while (query.moveToNext()) {
                        sb3.append(',').append(query.getLong(columnIndex));
                    }
                    sb3.append(')');
                    cursor = context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"data1"}, sb3.toString(), null, null);
                    try {
                        if (cursor == null) {
                            List<a> emptyList3 = Collections.emptyList();
                            m.a(query);
                            m.a(cursor);
                            return emptyList3;
                        }
                        int columnIndex2 = cursor.getColumnIndex("data1");
                        while (cursor.moveToNext()) {
                            String string = cursor.getString(columnIndex2);
                            if (TextUtils.isEmpty(string)) {
                                this.e.add(new a("ContactsProfile", string));
                            }
                        }
                        m.a(query);
                        m.a(cursor);
                    } catch (Throwable th) {
                        th = th;
                        cursor2 = query;
                        m.a(cursor2);
                        m.a(cursor);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor = null;
                    cursor2 = query;
                }
            } catch (Throwable th3) {
                th = th3;
                cursor = null;
            }
        }
        return this.e;
    }

    private a d() {
        PhoneNumberUtil phoneNumberUtil;
        a a;
        try {
            phoneNumberUtil = PhoneNumberUtil.getInstance();
            a = a(phoneNumberUtil, a(this.a));
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("PhoneAccountFinder", "failed to get best match account");
        }
        if (a != null) {
            return a;
        }
        a a2 = a(phoneNumberUtil, c(this.a));
        if (a2 != null) {
            return a2;
        }
        a a3 = a(phoneNumberUtil, d(this.a));
        if (a3 != null) {
            return a3;
        }
        a a4 = a(phoneNumberUtil, b(this.a));
        if (a4 != null) {
            return a4;
        }
        return null;
    }

    private boolean e() {
        if (!m.b(this.a, "android.permission.GET_ACCOUNTS")) {
            ru.mail.libverify.utils.d.a("PhoneAccountFinder", "can't work without %s", "android.permission.GET_ACCOUNTS");
            return false;
        }
        return true;
    }

    @Override // ru.mail.libverify.accounts.b
    public final synchronized a a() {
        a aVar;
        if (!e()) {
            aVar = null;
        } else {
            if (this.h == null) {
                this.h = d();
            }
            aVar = this.h;
        }
        return aVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0032, code lost:
        r6.b = r3.name;
     */
    @Override // ru.mail.libverify.accounts.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized java.lang.String b() {
        /*
            r6 = this;
            monitor-enter(r6)
            boolean r0 = r6.e()     // Catch: java.lang.Throwable -> L50
            if (r0 != 0) goto La
            r0 = 0
        L8:
            monitor-exit(r6)
            return r0
        La:
            java.lang.String r0 = r6.b     // Catch: java.lang.Throwable -> L50
            if (r0 != 0) goto L3f
            java.lang.String r0 = "PhoneAccountFinder"
            java.lang.String r1 = "getGmailAccount start search"
            ru.mail.libverify.utils.d.c(r0, r1)     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            android.content.Context r0 = r6.a     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            android.accounts.AccountManager r0 = android.accounts.AccountManager.get(r0)     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            android.accounts.Account[] r1 = r0.getAccounts()     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            int r2 = r1.length     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            r0 = 0
        L23:
            if (r0 >= r2) goto L36
            r3 = r1[r0]     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            java.lang.String r4 = r3.type     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            java.lang.String r5 = "com.google"
            boolean r4 = r4.equalsIgnoreCase(r5)     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            if (r4 == 0) goto L42
            java.lang.String r0 = r3.name     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
            r6.b = r0     // Catch: java.lang.Exception -> L45 java.lang.Throwable -> L50
        L36:
            java.lang.String r0 = r6.b     // Catch: java.lang.Throwable -> L50
            if (r0 != 0) goto L3f
            java.lang.String r0 = ""
            r6.b = r0     // Catch: java.lang.Throwable -> L50
        L3f:
            java.lang.String r0 = r6.b     // Catch: java.lang.Throwable -> L50
            goto L8
        L42:
            int r0 = r0 + 1
            goto L23
        L45:
            r0 = move-exception
            java.lang.String r0 = "PhoneAccountFinder"
            java.lang.String r1 = "failed to get gmail account"
            ru.mail.libverify.utils.d.a(r0, r1)     // Catch: java.lang.Throwable -> L50
            goto L36
        L50:
            r0 = move-exception
            monitor-exit(r6)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.accounts.c.b():java.lang.String");
    }

    @Override // ru.mail.libverify.accounts.b
    public final synchronized List<a> c() {
        List<a> list;
        if (!e()) {
            list = null;
        } else {
            if (this.g == null) {
                this.g = new ArrayList();
                try {
                    this.g.addAll(a(this.a));
                    this.g.addAll(c(this.a));
                    this.g.addAll(d(this.a));
                    this.g.addAll(b(this.a));
                } catch (Exception e) {
                    ru.mail.libverify.utils.d.a("PhoneAccountFinder", "failed to enumerate all accounts");
                }
            }
            list = this.g;
        }
        return list;
    }
}
