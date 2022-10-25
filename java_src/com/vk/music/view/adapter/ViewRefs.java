package com.vk.music.view.adapter;

import android.support.annotation.IdRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.vkontakte.android.functions.VoidF1;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes2.dex */
public final class ViewRefs {
    private Iterator<View> it;
    private List<View> views;

    public ViewRefs put(View v) {
        if (this.views == null) {
            this.views = new LinkedList();
            this.it = this.views.iterator();
        }
        this.views.add(v);
        return this;
    }

    public <T extends View> T next() {
        return (T) this.it.next();
    }

    public void apply(@Nullable int[] excludeIds, @NonNull VoidF1<View> f) {
        for (View view : this.views) {
            boolean skip = false;
            if (excludeIds != null) {
                int length = excludeIds.length;
                int i = 0;
                while (true) {
                    if (i >= length) {
                        break;
                    }
                    int excludeId = excludeIds[i];
                    if (excludeId != view.getId()) {
                        i++;
                    } else {
                        skip = true;
                        break;
                    }
                }
            }
            if (!skip) {
                f.f(view);
            }
        }
    }

    public void apply(@NonNull VoidF1<View> f) {
        apply((int[]) null, f);
    }

    public void apply(@IdRes int id, @NonNull VoidF1<View> f) {
        for (View view : this.views) {
            if (view.getId() == id) {
                f.f(view);
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ViewRefs reset() {
        this.it = this.views.iterator();
        return this;
    }
}
