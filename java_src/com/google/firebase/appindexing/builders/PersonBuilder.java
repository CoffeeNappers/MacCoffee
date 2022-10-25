package com.google.firebase.appindexing.builders;

import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class PersonBuilder extends IndexableBuilder<PersonBuilder> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public PersonBuilder() {
        super("Person");
    }

    public PersonBuilder setEmail(@NonNull String str) {
        return put("email", str);
    }

    public PersonBuilder setIsSelf(@NonNull boolean z) {
        return put("isSelf", z);
    }

    public PersonBuilder setTelephone(@NonNull String str) {
        return put("telephone", str);
    }
}
