package android.support.v13.view.inputmethod;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.inputmethod.EditorInfo;
@RequiresApi(25)
@TargetApi(25)
/* loaded from: classes.dex */
final class EditorInfoCompatApi25 {
    EditorInfoCompatApi25() {
    }

    public static void setContentMimeTypes(EditorInfo editorInfo, String[] contentMimeTypes) {
        editorInfo.contentMimeTypes = contentMimeTypes;
    }

    public static String[] getContentMimeTypes(EditorInfo editorInfo) {
        return editorInfo.contentMimeTypes;
    }
}
