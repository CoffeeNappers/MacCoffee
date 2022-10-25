package com.vk.sharing.attachment;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
/* loaded from: classes2.dex */
public interface AttachmentViewHolder {
    void bind(@NonNull Bundle bundle);

    @NonNull
    View create(@NonNull Context context, @NonNull ViewGroup viewGroup);
}
