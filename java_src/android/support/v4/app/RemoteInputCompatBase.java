package android.support.v4.app;

import android.annotation.TargetApi;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.dex */
class RemoteInputCompatBase {

    /* loaded from: classes.dex */
    public static abstract class RemoteInput {

        /* loaded from: classes.dex */
        public interface Factory {
            /* renamed from: build */
            RemoteInput mo74build(String str, CharSequence charSequence, CharSequence[] charSequenceArr, boolean z, Bundle bundle);

            /* renamed from: newArray */
            RemoteInput[] mo75newArray(int i);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public abstract boolean getAllowFreeFormInput();

        /* JADX INFO: Access modifiers changed from: protected */
        public abstract CharSequence[] getChoices();

        /* JADX INFO: Access modifiers changed from: protected */
        public abstract Bundle getExtras();

        /* JADX INFO: Access modifiers changed from: protected */
        public abstract CharSequence getLabel();

        /* JADX INFO: Access modifiers changed from: protected */
        public abstract String getResultKey();
    }

    RemoteInputCompatBase() {
    }
}
