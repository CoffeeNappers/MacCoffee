package com.vkontakte.android.fragments.gifts;

import android.graphics.Rect;
import android.view.View;
import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileGiftsFragment$$Lambda$1 implements UsableRecyclerView.SelectorBoundsProvider {
    private final ProfileGiftsFragment arg$1;

    private ProfileGiftsFragment$$Lambda$1(ProfileGiftsFragment profileGiftsFragment) {
        this.arg$1 = profileGiftsFragment;
    }

    public static UsableRecyclerView.SelectorBoundsProvider lambdaFactory$(ProfileGiftsFragment profileGiftsFragment) {
        return new ProfileGiftsFragment$$Lambda$1(profileGiftsFragment);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.SelectorBoundsProvider
    @LambdaForm.Hidden
    public void getSelectorBounds(View view, Rect rect) {
        this.arg$1.lambda$onViewCreated$0(view, rect);
    }
}
