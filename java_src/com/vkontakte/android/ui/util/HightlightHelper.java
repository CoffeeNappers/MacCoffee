package com.vkontakte.android.ui.util;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.SearchViewWrapper;
/* loaded from: classes3.dex */
public class HightlightHelper {
    public static void highlight(View itemView) {
        int pLeft = itemView.getPaddingLeft();
        int pTop = itemView.getPaddingTop();
        int pRight = itemView.getPaddingRight();
        int pBottom = itemView.getPaddingBottom();
        TransitionDrawable td = new TransitionDrawable(new Drawable[]{new ColorDrawable(-985604), new ColorDrawable(9415111)});
        itemView.setBackgroundDrawable(td);
        itemView.setPadding(pLeft, pTop, pRight, pBottom);
        itemView.invalidate();
        td.setCrossFadeEnabled(true);
        if (itemView.getTag(R.id.tag_comment_highlight) != null) {
            itemView.removeCallbacks((Runnable) itemView.getTag(R.id.tag_comment_highlight));
        }
        Runnable r = HightlightHelper$$Lambda$1.lambdaFactory$(td, itemView);
        itemView.setTag(R.id.tag_comment_highlight, r);
        itemView.postDelayed(r, 2000L);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$highlight$0(TransitionDrawable td, View itemView) {
        td.startTransition(SearchViewWrapper.CONFIRM_TIMEOUT);
        itemView.setTag(R.id.tag_comment_highlight, null);
    }
}
