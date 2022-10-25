package com.vk.attachpicker.screen;

import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.events.NotificationListener;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$1 implements NotificationListener {
    private final ViewerScreen arg$1;
    private final SelectionContext arg$2;

    private ViewerScreen$$Lambda$1(ViewerScreen viewerScreen, SelectionContext selectionContext) {
        this.arg$1 = viewerScreen;
        this.arg$2 = selectionContext;
    }

    public static NotificationListener lambdaFactory$(ViewerScreen viewerScreen, SelectionContext selectionContext) {
        return new ViewerScreen$$Lambda$1(viewerScreen, selectionContext);
    }

    @Override // com.vk.attachpicker.events.NotificationListener
    @LambdaForm.Hidden
    public void onNotification(int i, int i2, Object obj) {
        this.arg$1.lambda$new$0(this.arg$2, i, i2, (Void) obj);
    }
}
