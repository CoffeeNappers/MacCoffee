package com.vkontakte.android.ui.widget;

import android.view.ViewTreeObserver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VoiceRecordControlPopupWindow$$Lambda$1 implements ViewTreeObserver.OnGlobalLayoutListener {
    private final VoiceRecordControlPopupWindow arg$1;

    private VoiceRecordControlPopupWindow$$Lambda$1(VoiceRecordControlPopupWindow voiceRecordControlPopupWindow) {
        this.arg$1 = voiceRecordControlPopupWindow;
    }

    public static ViewTreeObserver.OnGlobalLayoutListener lambdaFactory$(VoiceRecordControlPopupWindow voiceRecordControlPopupWindow) {
        return new VoiceRecordControlPopupWindow$$Lambda$1(voiceRecordControlPopupWindow);
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    @LambdaForm.Hidden
    public void onGlobalLayout() {
        this.arg$1.lambda$show$0();
    }
}
