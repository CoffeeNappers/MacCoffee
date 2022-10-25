package com.vkontakte.android;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CreateGroupDialog$$Lambda$1 implements View.OnClickListener {
    private final CreateGroupDialog arg$1;

    private CreateGroupDialog$$Lambda$1(CreateGroupDialog createGroupDialog) {
        this.arg$1 = createGroupDialog;
    }

    public static View.OnClickListener lambdaFactory$(CreateGroupDialog createGroupDialog) {
        return new CreateGroupDialog$$Lambda$1(createGroupDialog);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onStart$0(view);
    }
}
