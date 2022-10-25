package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.lang.reflect.Field;
import java.util.Locale;
/* loaded from: classes2.dex */
public enum zzaoq implements zzaor {
    IDENTITY { // from class: com.google.android.gms.internal.zzaoq.1
        @Override // com.google.android.gms.internal.zzaor
        public String zzc(Field field) {
            return field.getName();
        }
    },
    UPPER_CAMEL_CASE { // from class: com.google.android.gms.internal.zzaoq.2
        @Override // com.google.android.gms.internal.zzaor
        public String zzc(Field field) {
            return zzaoq.zzum(field.getName());
        }
    },
    UPPER_CAMEL_CASE_WITH_SPACES { // from class: com.google.android.gms.internal.zzaoq.3
        @Override // com.google.android.gms.internal.zzaor
        public String zzc(Field field) {
            return zzaoq.zzum(zzaoq.zzbz(field.getName(), MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR));
        }
    },
    LOWER_CASE_WITH_UNDERSCORES { // from class: com.google.android.gms.internal.zzaoq.4
        @Override // com.google.android.gms.internal.zzaor
        public String zzc(Field field) {
            return zzaoq.zzbz(field.getName(), EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).toLowerCase(Locale.ENGLISH);
        }
    },
    LOWER_CASE_WITH_DASHES { // from class: com.google.android.gms.internal.zzaoq.5
        @Override // com.google.android.gms.internal.zzaor
        public String zzc(Field field) {
            return zzaoq.zzbz(field.getName(), "-").toLowerCase(Locale.ENGLISH);
        }
    };

    private static String zza(char c, String str, int i) {
        if (i < str.length()) {
            String valueOf = String.valueOf(str.substring(i));
            return new StringBuilder(String.valueOf(valueOf).length() + 1).append(c).append(valueOf).toString();
        }
        return String.valueOf(c);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String zzbz(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (Character.isUpperCase(charAt) && sb.length() != 0) {
                sb.append(str2);
            }
            sb.append(charAt);
        }
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String zzum(String str) {
        int i = 0;
        StringBuilder sb = new StringBuilder();
        char charAt = str.charAt(0);
        while (i < str.length() - 1 && !Character.isLetter(charAt)) {
            sb.append(charAt);
            i++;
            charAt = str.charAt(i);
        }
        return i == str.length() ? sb.toString() : !Character.isUpperCase(charAt) ? sb.append(zza(Character.toUpperCase(charAt), str, i + 1)).toString() : str;
    }
}
