package com.vkontakte.android;

import android.view.View;
import com.vkontakte.android.ui.CheckableRelativeLayout;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CreateGroupDialog$$Lambda$2 implements CheckableRelativeLayout.OnCheckedChangeListener {
    private final CreateGroupDialog arg$1;

    private CreateGroupDialog$$Lambda$2(CreateGroupDialog createGroupDialog) {
        this.arg$1 = createGroupDialog;
    }

    public static CheckableRelativeLayout.OnCheckedChangeListener lambdaFactory$(CreateGroupDialog createGroupDialog) {
        return new CreateGroupDialog$$Lambda$2(createGroupDialog);
    }

    @Override // com.vkontakte.android.ui.CheckableRelativeLayout.OnCheckedChangeListener
    @LambdaForm.Hidden
    public void onCheckedChanged(View view, boolean z) {
        this.arg$1.lambda$createView$1(view, z);
    }
}
