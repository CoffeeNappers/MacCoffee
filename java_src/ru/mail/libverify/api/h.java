package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import ru.mail.libverify.requests.response.VerifyApiResponse;
/* loaded from: classes3.dex */
final class h {
    private static final HashMap<String, b> a = new HashMap<>();

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class a {
        public String[] a;
        public String[] b;
        public int c = 0;
        public VerifyApiResponse.CodeType d;
    }

    /* loaded from: classes3.dex */
    static class b {
        final c[] a;
        final boolean b;

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes3.dex */
        public static class a {
            int a;
            int b;
            int c;
            int d;

            private a() {
            }

            /* synthetic */ a(byte b) {
                this();
            }
        }

        b() {
            this.b = false;
            this.a = null;
        }

        private b(@NonNull List<c> list) {
            this.b = true;
            this.a = (c[]) list.toArray(new c[list.size()]);
        }

        public static b a(@NonNull String str) {
            ArrayList arrayList = new ArrayList();
            a aVar = null;
            a aVar2 = null;
            for (int i = 0; i < str.length(); i++) {
                if (str.charAt(i) == '%') {
                    if (aVar2 == null) {
                        if (aVar != null) {
                            aVar.d = i;
                            a(str, aVar, arrayList);
                        }
                        aVar2 = new a((byte) 0);
                        aVar2.b = i;
                        if (aVar != null) {
                            aVar2.a = aVar.d;
                        }
                    } else {
                        aVar2.c = i;
                        aVar = aVar2;
                        aVar2 = null;
                    }
                }
            }
            if (aVar != null) {
                aVar.d = str.length();
                a(str, aVar, arrayList);
            }
            return arrayList.isEmpty() ? new b() : new b(arrayList);
        }

        private static void a(@NonNull String str, @NonNull a aVar, @NonNull ArrayList<c> arrayList) {
            arrayList.add(new c(str.substring(aVar.a, aVar.b), str.substring(aVar.c + 1, aVar.d), str.substring(aVar.b + 1, aVar.c)));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class c {
        final String a;
        final String b;
        final String c;

        c(String str, String str2, String str3) {
            this.a = str;
            this.b = str2;
            this.c = str3;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String a(@NonNull String str, a aVar) {
        String[] strArr;
        if (!d(str, aVar)) {
            return null;
        }
        for (String str2 : aVar.b) {
            ru.mail.libverify.utils.d.c("CodeParser", "try to parse using regular expression");
            if (!str2.startsWith("^") || !str2.endsWith("$") || !str.matches(str2)) {
                ru.mail.libverify.utils.d.c("CodeParser", "try to parse using template");
                int indexOf = str2.indexOf("%");
                if (indexOf >= 0) {
                    String substring = str2.substring(0, indexOf);
                    int indexOf2 = str2.indexOf("%", indexOf + 1);
                    if (indexOf2 >= 0 && indexOf2 > indexOf) {
                        String substring2 = indexOf2 != str2.length() + (-1) ? str2.substring(indexOf2 + 1) : "";
                        if (str.startsWith(substring) && str.endsWith(substring2)) {
                            String trim = str.substring(substring.length(), str.length() - substring2.length()).trim();
                            if (a(aVar, trim)) {
                                ru.mail.libverify.utils.d.c("CodeParser", "successfully extracted code %s", trim);
                                return trim;
                            }
                        }
                    }
                } else {
                    continue;
                }
            } else {
                String replaceFirst = str.replaceFirst(str2, "$1");
                if (!TextUtils.isEmpty(replaceFirst)) {
                    return replaceFirst;
                }
            }
        }
        return null;
    }

    private static boolean a(@NonNull a aVar, String str) {
        boolean z;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        if (aVar.c != 0 && str.length() != aVar.c) {
            return false;
        }
        if (aVar.d == VerifyApiResponse.CodeType.NUMERIC) {
            char[] charArray = str.toCharArray();
            int length = charArray.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    z = true;
                    break;
                } else if (!Character.isDigit(charArray[i])) {
                    z = false;
                    break;
                } else {
                    i++;
                }
            }
            if (!z) {
                return false;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(@NonNull String str, a aVar) {
        String[] strArr;
        if (!d(str, aVar)) {
            return null;
        }
        for (String str2 : aVar.b) {
            int i = 0;
            HashMap hashMap = new HashMap();
            b bVar = a.get(str2);
            if (bVar == null) {
                bVar = b.a(str2);
                a.put(str2, bVar);
            }
            if (bVar.b && bVar.a != null) {
                for (int i2 = 0; i2 < bVar.a.length; i2++) {
                    c cVar = bVar.a[i2];
                    if (str.indexOf(cVar.a, i) == -1) {
                        break;
                    }
                    int length = TextUtils.isEmpty(cVar.b) ? str.length() : str.indexOf(cVar.b, i + cVar.a.length());
                    if (length < 0) {
                        break;
                    }
                    int i3 = -1;
                    int i4 = length - 1;
                    while (true) {
                        if (i4 < 0) {
                            break;
                        } else if (str.charAt(i4) != ' ') {
                            i3 = i4;
                            break;
                        } else {
                            i4--;
                        }
                    }
                    if (i3 < 0) {
                        break;
                    }
                    int lastIndexOf = str.lastIndexOf(32, i3);
                    if (lastIndexOf < 0) {
                        lastIndexOf = 0;
                    }
                    hashMap.put(cVar.c, str.substring(lastIndexOf, i3 + 1).trim());
                    i = cVar.b.length() + length;
                }
            }
            if (!hashMap.isEmpty()) {
                String str3 = (String) hashMap.get(AuthCheckFragment.KEY_CODE);
                if (a(aVar, str3)) {
                    return str3;
                }
                String str4 = (String) hashMap.get("verify_url");
                if (!TextUtils.isEmpty(str4)) {
                    return str4;
                }
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean c(@NonNull String str, a aVar) {
        if (TextUtils.isEmpty(str) || aVar == null || aVar.a == null || aVar.a.length == 0) {
            return false;
        }
        for (String str2 : aVar.a) {
            if (str.contains(str2)) {
                return true;
            }
        }
        return false;
    }

    private static boolean d(@NonNull String str, a aVar) {
        if (TextUtils.isEmpty(str) || aVar == null || aVar.b == null || aVar.b.length == 0) {
            ru.mail.libverify.utils.d.a("CodeParser", "not enough arguments to parse code");
            return false;
        } else if (aVar.c <= 0 || str.length() >= aVar.c) {
            return true;
        } else {
            ru.mail.libverify.utils.d.a("CodeParser", "message text is too small to start parsing");
            return false;
        }
    }
}
