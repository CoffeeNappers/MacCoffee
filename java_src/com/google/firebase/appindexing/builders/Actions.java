package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
import com.google.firebase.appindexing.Action;
import com.google.firebase.appindexing.FirebaseAppIndexingInvalidArgumentException;
/* loaded from: classes2.dex */
public final class Actions {
    public static Action newView(@NonNull String str, @NonNull String str2) throws FirebaseAppIndexingInvalidArgumentException {
        return new Action.Builder(Action.Builder.VIEW_ACTION).setObject(str, str2).build();
    }
}
