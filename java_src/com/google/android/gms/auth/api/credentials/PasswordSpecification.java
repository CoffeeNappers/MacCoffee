package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.v4.media.TransportMediator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.TreeSet;
/* loaded from: classes2.dex */
public final class PasswordSpecification extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<PasswordSpecification> CREATOR = new zzf();
    public static final PasswordSpecification iG = new zza().zzl(12, 16).zzfw("abcdefghijkmnopqrstxyzABCDEFGHJKLMNPQRSTXY3456789").zzf("abcdefghijkmnopqrstxyz", 1).zzf("ABCDEFGHJKLMNPQRSTXY", 1).zzf("3456789", 1).zzaij();
    public static final PasswordSpecification iH = new zza().zzl(12, 16).zzfw("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890").zzf("abcdefghijklmnopqrstuvwxyz", 1).zzf("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 1).zzf("1234567890", 1).zzaij();
    final String iI;
    final List<String> iJ;
    final List<Integer> iK;
    final int iL;
    final int iM;
    final int mVersionCode;
    private final int[] iN = zzaii();
    private final Random zzbao = new SecureRandom();

    /* loaded from: classes2.dex */
    public static class zza {
        private final TreeSet<Character> iO = new TreeSet<>();
        private final List<String> iJ = new ArrayList();
        private final List<Integer> iK = new ArrayList();
        private int iL = 12;
        private int iM = 16;

        private void zzaik() {
            int i;
            int i2 = 0;
            Iterator<Integer> it = this.iK.iterator();
            while (true) {
                i = i2;
                if (!it.hasNext()) {
                    break;
                }
                i2 = it.next().intValue() + i;
            }
            if (i > this.iM) {
                throw new zzb("required character count cannot be greater than the max password size");
            }
        }

        private void zzail() {
            boolean[] zArr = new boolean[95];
            for (String str : this.iJ) {
                char[] charArray = str.toCharArray();
                for (char c : charArray) {
                    if (zArr[c - ' ']) {
                        throw new zzb(new StringBuilder(58).append("character ").append(c).append(" occurs in more than one required character set").toString());
                    }
                    zArr[c - ' '] = true;
                }
            }
        }

        private TreeSet<Character> zzv(String str, String str2) {
            char[] charArray;
            if (TextUtils.isEmpty(str)) {
                throw new zzb(String.valueOf(str2).concat(" cannot be null or empty"));
            }
            TreeSet<Character> treeSet = new TreeSet<>();
            for (char c : str.toCharArray()) {
                if (PasswordSpecification.zzc(c, 32, TransportMediator.KEYCODE_MEDIA_PLAY)) {
                    throw new zzb(String.valueOf(str2).concat(" must only contain ASCII printable characters"));
                }
                treeSet.add(Character.valueOf(c));
            }
            return treeSet;
        }

        public PasswordSpecification zzaij() {
            if (this.iO.isEmpty()) {
                throw new zzb("no allowed characters specified");
            }
            zzaik();
            zzail();
            return new PasswordSpecification(1, PasswordSpecification.zzb(this.iO), this.iJ, this.iK, this.iL, this.iM);
        }

        public zza zzf(@NonNull String str, int i) {
            if (i < 1) {
                throw new zzb("count must be at least 1");
            }
            this.iJ.add(PasswordSpecification.zzb(zzv(str, "requiredChars")));
            this.iK.add(Integer.valueOf(i));
            return this;
        }

        public zza zzfw(@NonNull String str) {
            this.iO.addAll(zzv(str, "allowedChars"));
            return this;
        }

        public zza zzl(int i, int i2) {
            if (i < 1) {
                throw new zzb("minimumSize must be at least 1");
            }
            if (i > i2) {
                throw new zzb("maximumSize must be greater than or equal to minimumSize");
            }
            this.iL = i;
            this.iM = i2;
            return this;
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb extends Error {
        public zzb(String str) {
            super(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PasswordSpecification(int i, String str, List<String> list, List<Integer> list2, int i2, int i3) {
        this.mVersionCode = i;
        this.iI = str;
        this.iJ = Collections.unmodifiableList(list);
        this.iK = Collections.unmodifiableList(list2);
        this.iL = i2;
        this.iM = i3;
    }

    private int zza(char c) {
        return c - ' ';
    }

    private int[] zzaii() {
        int[] iArr = new int[95];
        Arrays.fill(iArr, -1);
        int i = 0;
        for (String str : this.iJ) {
            char[] charArray = str.toCharArray();
            for (char c : charArray) {
                iArr[zza(c)] = i;
            }
            i++;
        }
        return iArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String zzb(Collection<Character> collection) {
        char[] cArr = new char[collection.size()];
        int i = 0;
        Iterator<Character> it = collection.iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                i = i2 + 1;
                cArr[i2] = it.next().charValue();
            } else {
                return new String(cArr);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean zzc(int i, int i2, int i3) {
        return i < i2 || i > i3;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }
}
