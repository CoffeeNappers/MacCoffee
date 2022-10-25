package me.grishka.appkit.utils;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Point;
import android.support.annotation.Nullable;
import android.util.Property;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
/* loaded from: classes.dex */
public class V {
    private static Context appContext;
    private static HashMap<View, Animator> visibilityAnims = new HashMap<>();

    public static void setApplicationContext(Context context) {
        if (appContext == null) {
            appContext = context.getApplicationContext();
        }
    }

    public static int dp(float dp) {
        if (appContext == null) {
            throw new IllegalStateException("Application context is not set, call V.setApplicationContext() before using these methods");
        }
        return Math.round(appContext.getResources().getDisplayMetrics().density * dp);
    }

    public static void setVisibilityAnimated(View view, int visibility) {
        setVisibilityAnimated(view, visibility, false, 300);
    }

    public static void setVisibilityAnimated(final View view, final int visibility, boolean scale, int duration) {
        boolean scaleVis;
        if (view != null) {
            boolean vis = visibility == 0;
            boolean viewVis = view.getVisibility() == 0 && view.getTag(R.id.tag_visibility_anim) == null;
            if (scale) {
                scaleVis = view.getVisibility() == 0 && view.getScaleX() == 1.0f && view.getScaleY() == 1.0f;
            } else {
                scaleVis = viewVis;
            }
            if (vis != viewVis || scaleVis != viewVis) {
                if (visibilityAnims.containsKey(view)) {
                    visibilityAnims.get(view).cancel();
                    visibilityAnims.remove(view);
                }
                List<Animator> animators = new ArrayList<>();
                AnimatorSet anim = new AnimatorSet();
                if (vis) {
                    if (scale) {
                        Property property = View.SCALE_X;
                        float[] fArr = new float[2];
                        fArr[0] = view.getScaleX() < 1.0f ? view.getScaleX() : 0.1f;
                        fArr[1] = 1.0f;
                        animators.add(ObjectAnimator.ofFloat(view, property, fArr));
                        Property property2 = View.SCALE_Y;
                        float[] fArr2 = new float[2];
                        fArr2[0] = view.getScaleY() < 1.0f ? view.getScaleY() : 0.1f;
                        fArr2[1] = 1.0f;
                        animators.add(ObjectAnimator.ofFloat(view, property2, fArr2));
                    }
                    Property property3 = View.ALPHA;
                    float[] fArr3 = new float[2];
                    fArr3[0] = view.getAlpha() < 1.0f ? view.getAlpha() : 0.0f;
                    fArr3[1] = 1.0f;
                    animators.add(ObjectAnimator.ofFloat(view, property3, fArr3));
                    anim.playTogether(animators);
                    anim.addListener(new AnimatorListenerAdapter() { // from class: me.grishka.appkit.utils.V.1
                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationStart(Animator anim2) {
                            view.setVisibility(visibility);
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationEnd(Animator anim2) {
                            view.setVisibility(visibility);
                            V.visibilityAnims.remove(view);
                        }

                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                        public void onAnimationCancel(Animator anim2) {
                            view.setVisibility(visibility);
                        }
                    });
                    anim.setDuration(duration);
                    visibilityAnims.put(view, anim);
                    anim.start();
                    return;
                }
                if (scale) {
                    animators.add(ObjectAnimator.ofFloat(view, View.SCALE_X, 0.1f));
                    animators.add(ObjectAnimator.ofFloat(view, View.SCALE_Y, 0.1f));
                }
                animators.add(ObjectAnimator.ofFloat(view, View.ALPHA, 0.0f));
                anim.playTogether(animators);
                anim.addListener(new AnimatorListenerAdapter() { // from class: me.grishka.appkit.utils.V.2
                    boolean canceled = false;

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator anim2) {
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator anim2) {
                        view.setTag(R.id.tag_visibility_anim, null);
                        V.visibilityAnims.remove(view);
                        if (!this.canceled) {
                            view.setVisibility(visibility);
                            view.setAlpha(1.0f);
                        }
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationCancel(Animator anim2) {
                        this.canceled = true;
                    }
                });
                view.setTag(R.id.tag_visibility_anim, true);
                anim.setDuration(duration);
                visibilityAnims.put(view, anim);
                anim.start();
            }
        }
    }

    public static void cancelVisibilityAnimation(View view) {
        if (visibilityAnims.containsKey(view)) {
            visibilityAnims.get(view).cancel();
            view.setAlpha(1.0f);
        }
    }

    public static Point getViewOffset(@Nullable View v1, @Nullable View v2) {
        int[] p1 = {0, 0};
        int[] p2 = {0, 0};
        if (v1 != null && v2 != null) {
            v1.getLocationOnScreen(p1);
            v2.getLocationOnScreen(p2);
        }
        return new Point(p1[0] - p2[0], p1[1] - p2[1]);
    }

    public static View findClickableChild(ViewGroup viewGroup, int x, int y) {
        View r;
        for (int i = 0; i < viewGroup.getChildCount(); i++) {
            View c = viewGroup.getChildAt(i);
            if (c.getLeft() < x && c.getRight() > x && c.getTop() < y && c.getBottom() > y) {
                if (!c.isClickable()) {
                    if ((c instanceof ViewGroup) && (r = findClickableChild((ViewGroup) c, x - c.getLeft(), y - c.getTop())) != null) {
                        return r;
                    }
                } else {
                    return c;
                }
            }
        }
        return null;
    }
}
