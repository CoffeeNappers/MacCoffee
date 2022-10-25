package com.vkontakte.android.api.models;

import android.support.annotation.Nullable;
import com.coremedia.iso.boxes.SubSampleInformationBox;
/* loaded from: classes2.dex */
public enum PaymentType {
    Balance,
    Inapp,
    Subs;

    @Nullable
    public static PaymentType parse(@Nullable String type) {
        if (type != null) {
            char c = 65535;
            switch (type.hashCode()) {
                case -339185956:
                    if (type.equals("balance")) {
                        c = 0;
                        break;
                    }
                    break;
                case 3541555:
                    if (type.equals(SubSampleInformationBox.TYPE)) {
                        c = 1;
                        break;
                    }
                    break;
                case 100343516:
                    if (type.equals("inapp")) {
                        c = 2;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return Balance;
                case 1:
                    return Subs;
                case 2:
                    return Inapp;
            }
        }
        return null;
    }
}
