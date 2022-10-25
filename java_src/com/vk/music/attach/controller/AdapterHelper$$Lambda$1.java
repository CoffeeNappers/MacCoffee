package com.vk.music.attach.controller;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.R;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class AdapterHelper$$Lambda$1 implements ItemViewHolder.Builder.Init {
    private static final AdapterHelper$$Lambda$1 instance = new AdapterHelper$$Lambda$1();

    private AdapterHelper$$Lambda$1() {
    }

    public static ItemViewHolder.Builder.Init lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Builder.Init
    @LambdaForm.Hidden
    public void apply(View view) {
        view.setTag(view.findViewById(R.id.audio_checkbox));
    }
}
