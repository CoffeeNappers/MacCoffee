package com.vk.sharing;

import android.os.Build;
import android.support.annotation.NonNull;
import android.support.transition.AutoTransition;
import android.support.transition.Transition;
import android.support.transition.TransitionManager;
import android.view.ViewGroup;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
final class KitKatTransitions {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void run(@NonNull ViewGroup root) {
        if (Build.VERSION.SDK_INT >= 19) {
            Transition transition = new AutoTransition();
            transition.setDuration(100L);
            transition.excludeTarget(R.id.content_animator, true);
            transition.excludeTarget(R.id.targets_recycler, true);
            TransitionManager.beginDelayedTransition(root, transition);
        }
    }

    private KitKatTransitions() {
    }
}
