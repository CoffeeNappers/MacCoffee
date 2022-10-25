package com.my.target.core.ui.views.fspromo;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import java.util.ArrayList;
/* compiled from: FSHeaderAnimationProcessor.java */
/* loaded from: classes2.dex */
public final class a {
    private int a;
    private final View b;
    private final View c;
    private final View d;
    private final TextView e;
    private final View f;
    private final View g;
    private final View h;
    private final TextView i;
    private boolean j;
    private boolean k;

    public a(View view, View view2, View view3, TextView textView, View view4, View view5, View view6, TextView textView2) {
        this.b = view;
        this.c = view2;
        this.d = view3;
        this.e = textView;
        this.f = view4;
        this.g = view5;
        this.h = view6;
        this.i = textView2;
    }

    public final void a(View... viewArr) {
        a(300, viewArr);
    }

    private void a(int i, View... viewArr) {
        int height;
        if (!this.j && Build.VERSION.SDK_INT >= 14) {
            float width = this.b.getWidth() - (this.b.getWidth() * 0.7f);
            this.b.setPivotX(0.0f);
            this.b.setPivotY(0.0f);
            this.c.setPivotX(this.c.getWidth());
            this.c.setPivotY(0.0f);
            if (TextUtils.isEmpty(this.i.getText().toString())) {
                height = this.f.getHeight();
            } else {
                height = this.i.getHeight();
            }
            int height2 = ((this.e.getHeight() + this.d.getHeight()) - height) - this.a;
            int height3 = (int) (this.b.getHeight() - (this.b.getHeight() * 0.7f));
            if (height2 > height3) {
                height3 = height2;
            }
            int height4 = ((int) (this.b.getHeight() * 0.7f)) + (this.a * 2);
            int height5 = ((int) (this.c.getHeight() * 0.7f)) + (this.a * 2);
            if (height3 > this.g.getHeight() - height4) {
                height3 = this.g.getHeight() - height4;
            } else if (height3 > this.g.getHeight() - height5) {
                height3 = this.g.getHeight() - height5;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add(ObjectAnimator.ofFloat(this.c, View.SCALE_X, 0.7f));
            arrayList.add(ObjectAnimator.ofFloat(this.c, View.SCALE_Y, 0.7f));
            arrayList.add(ObjectAnimator.ofFloat(this.b, View.SCALE_X, 0.7f));
            arrayList.add(ObjectAnimator.ofFloat(this.b, View.SCALE_Y, 0.7f));
            arrayList.add(ObjectAnimator.ofFloat(this.d, View.ALPHA, 0.0f));
            arrayList.add(ObjectAnimator.ofFloat(this.e, View.ALPHA, 0.0f));
            arrayList.add(ObjectAnimator.ofFloat(this.f, View.ALPHA, 1.0f));
            arrayList.add(ObjectAnimator.ofFloat(this.g, View.ALPHA, 0.6f));
            arrayList.add(ObjectAnimator.ofFloat(this.h, View.TRANSLATION_X, -width));
            arrayList.add(ObjectAnimator.ofFloat(this.g, View.TRANSLATION_Y, height3));
            for (View view : viewArr) {
                arrayList.add(ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, height3));
            }
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.addListener(new Animator.AnimatorListener() { // from class: com.my.target.core.ui.views.fspromo.a.1
                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationStart(Animator animator) {
                    if (TextUtils.isEmpty(a.this.i.getText().toString())) {
                        if (!a.this.k) {
                            a.this.f.setVisibility(0);
                            return;
                        }
                        return;
                    }
                    a.this.i.setVisibility(0);
                }

                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationEnd(Animator animator) {
                    if (!TextUtils.isEmpty(a.this.e.getText().toString())) {
                        a.this.e.setVisibility(4);
                    }
                    a.this.d.setVisibility(4);
                }

                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationCancel(Animator animator) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public final void onAnimationRepeat(Animator animator) {
                }
            });
            animatorSet.playTogether(arrayList);
            animatorSet.setDuration(i);
            animatorSet.start();
        }
    }

    public final void a(int i) {
        this.a = i;
    }

    public final void a() {
        this.j = true;
    }

    public final void c(View... viewArr) {
        a(0, viewArr);
    }

    public final void b() {
        this.k = true;
    }

    public final void b(View... viewArr) {
        if (this.j || Build.VERSION.SDK_INT < 14) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(ObjectAnimator.ofFloat(this.c, View.SCALE_Y, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.c, View.SCALE_X, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.b, View.SCALE_Y, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.b, View.SCALE_X, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.d, View.ALPHA, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.e, View.ALPHA, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.f, View.ALPHA, 0.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.g, View.ALPHA, 1.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.h, View.TRANSLATION_X, 0.0f));
        arrayList.add(ObjectAnimator.ofFloat(this.g, View.TRANSLATION_Y, 0.0f));
        for (View view : viewArr) {
            arrayList.add(ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, 0.0f));
        }
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(arrayList);
        animatorSet.addListener(new Animator.AnimatorListener() { // from class: com.my.target.core.ui.views.fspromo.a.2
            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationStart(Animator animator) {
                if (!TextUtils.isEmpty(a.this.e.getText().toString())) {
                    a.this.e.setVisibility(0);
                }
                a.this.d.setVisibility(0);
            }

            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationEnd(Animator animator) {
                a.this.f.setVisibility(4);
                a.this.i.setVisibility(4);
            }

            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationRepeat(Animator animator) {
            }
        });
        animatorSet.setDuration(300L);
        animatorSet.start();
    }
}
