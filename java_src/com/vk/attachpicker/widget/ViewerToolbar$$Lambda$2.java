package com.vk.attachpicker.widget;

import com.vk.attachpicker.events.NotificationListener;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewerToolbar$$Lambda$2 implements NotificationListener {
    private final ViewerToolbar arg$1;

    private ViewerToolbar$$Lambda$2(ViewerToolbar viewerToolbar) {
        this.arg$1 = viewerToolbar;
    }

    public static NotificationListener lambdaFactory$(ViewerToolbar viewerToolbar) {
        return new ViewerToolbar$$Lambda$2(viewerToolbar);
    }

    @Override // com.vk.attachpicker.events.NotificationListener
    @LambdaForm.Hidden
    public void onNotification(int i, int i2, Object obj) {
        this.arg$1.lambda$new$2(i, i2, obj);
    }
}
