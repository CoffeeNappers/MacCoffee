package android.support.v4.widget;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.widget.ListView;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class ListViewCompatKitKat {
    ListViewCompatKitKat() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void scrollListBy(ListView listView, int y) {
        listView.scrollListBy(y);
    }
}
