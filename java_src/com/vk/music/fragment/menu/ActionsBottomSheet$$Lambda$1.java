package com.vk.music.fragment.menu;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ActionsBottomSheet$$Lambda$1 implements ItemViewHolder.ClickListener {
    private final ActionsBottomSheet arg$1;

    private ActionsBottomSheet$$Lambda$1(ActionsBottomSheet actionsBottomSheet) {
        this.arg$1 = actionsBottomSheet;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(ActionsBottomSheet actionsBottomSheet) {
        return new ActionsBottomSheet$$Lambda$1(actionsBottomSheet);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$onCreateActionAdapter$0(view, (Action) obj, i);
    }
}
