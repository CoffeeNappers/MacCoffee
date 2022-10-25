package com.vkontakte.android.fragments.news;

import com.vkontakte.android.fragments.DateTimePickerDialogFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
import java.util.Calendar;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$7 implements DateTimePickerDialogFragment.OnSelectedListener {
    private final NewPostFragment.Presenter arg$1;

    private NewPostFragment$Presenter$$Lambda$7(NewPostFragment.Presenter presenter) {
        this.arg$1 = presenter;
    }

    public static DateTimePickerDialogFragment.OnSelectedListener lambdaFactory$(NewPostFragment.Presenter presenter) {
        return new NewPostFragment$Presenter$$Lambda$7(presenter);
    }

    @Override // com.vkontakte.android.fragments.DateTimePickerDialogFragment.OnSelectedListener
    @LambdaForm.Hidden
    public void onDateSelected(Calendar calendar) {
        this.arg$1.lambda$showTimerDlg$7(calendar);
    }
}
