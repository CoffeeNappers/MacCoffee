package com.vk.music.model;

import android.os.Bundle;
import android.support.annotation.NonNull;
/* loaded from: classes.dex */
public interface ActiveModel {
    void clearCallbacks();

    void release();

    void restore(@NonNull Bundle bundle);

    @NonNull
    Bundle save();
}
