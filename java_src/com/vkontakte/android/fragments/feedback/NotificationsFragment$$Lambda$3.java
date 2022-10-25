package com.vkontakte.android.fragments.feedback;

import android.graphics.Rect;
import android.view.View;
import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationsFragment$$Lambda$3 implements UsableRecyclerView.SelectorBoundsProvider {
    private final NotificationsFragment arg$1;

    private NotificationsFragment$$Lambda$3(NotificationsFragment notificationsFragment) {
        this.arg$1 = notificationsFragment;
    }

    public static UsableRecyclerView.SelectorBoundsProvider lambdaFactory$(NotificationsFragment notificationsFragment) {
        return new NotificationsFragment$$Lambda$3(notificationsFragment);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.SelectorBoundsProvider
    @LambdaForm.Hidden
    public void getSelectorBounds(View view, Rect rect) {
        this.arg$1.lambda$onViewCreated$2(view, rect);
    }
}
