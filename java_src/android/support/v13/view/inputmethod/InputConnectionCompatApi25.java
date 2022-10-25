package android.support.v13.view.inputmethod;

import android.annotation.TargetApi;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.view.inputmethod.InputContentInfo;
@RequiresApi(25)
@TargetApi(25)
/* loaded from: classes.dex */
final class InputConnectionCompatApi25 {

    /* loaded from: classes.dex */
    public interface OnCommitContentListener {
        boolean onCommitContent(Object obj, int i, Bundle bundle);
    }

    InputConnectionCompatApi25() {
    }

    public static boolean commitContent(InputConnection ic, Object inputContentInfo, int flags, Bundle opts) {
        return ic.commitContent((InputContentInfo) inputContentInfo, flags, opts);
    }

    public static InputConnection createWrapper(InputConnection ic, final OnCommitContentListener onCommitContentListener) {
        return new InputConnectionWrapper(ic, false) { // from class: android.support.v13.view.inputmethod.InputConnectionCompatApi25.1
            @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
            public boolean commitContent(InputContentInfo inputContentInfo, int flags, Bundle opts) {
                if (onCommitContentListener.onCommitContent(inputContentInfo, flags, opts)) {
                    return true;
                }
                return super.commitContent(inputContentInfo, flags, opts);
            }
        };
    }
}
