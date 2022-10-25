package android.support.transition;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.ViewGroup;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
public class ViewGroupOverlay extends ViewOverlay {
    /* JADX INFO: Access modifiers changed from: package-private */
    public ViewGroupOverlay(Context context, ViewGroup hostView, View requestingView) {
        super(context, hostView, requestingView);
    }

    public static ViewGroupOverlay createFrom(ViewGroup viewGroup) {
        return (ViewGroupOverlay) ViewOverlay.createFrom(viewGroup);
    }

    public void add(View view) {
        this.mOverlayViewGroup.add(view);
    }

    public void remove(View view) {
        this.mOverlayViewGroup.remove(view);
    }
}
