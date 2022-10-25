package com.vk.stories;

import android.app.Activity;
import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoryViewDialog$$Lambda$1 implements DialogInterface.OnDismissListener {
    private final StoryViewDialog arg$1;
    private final Activity arg$2;

    private StoryViewDialog$$Lambda$1(StoryViewDialog storyViewDialog, Activity activity) {
        this.arg$1 = storyViewDialog;
        this.arg$2 = activity;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(StoryViewDialog storyViewDialog, Activity activity) {
        return new StoryViewDialog$$Lambda$1(storyViewDialog, activity);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$new$0(this.arg$2, dialogInterface);
    }
}
