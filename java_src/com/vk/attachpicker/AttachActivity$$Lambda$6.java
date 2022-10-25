package com.vk.attachpicker;

import com.vk.attachpicker.widget.OnItemClickListener;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AttachActivity$$Lambda$6 implements OnItemClickListener {
    private final AttachActivity arg$1;

    private AttachActivity$$Lambda$6(AttachActivity attachActivity) {
        this.arg$1 = attachActivity;
    }

    public static OnItemClickListener lambdaFactory$(AttachActivity attachActivity) {
        return new AttachActivity$$Lambda$6(attachActivity);
    }

    @Override // com.vk.attachpicker.widget.OnItemClickListener
    @LambdaForm.Hidden
    public void onItemClickListener(int i) {
        this.arg$1.lambda$initViews$5(i);
    }
}
