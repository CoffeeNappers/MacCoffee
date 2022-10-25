package android.support.transition;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.support.transition.TransitionPort;
import android.support.v4.view.ViewCompat;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class FadePort extends VisibilityPort {
    private static boolean DBG = false;
    public static final int IN = 1;
    private static final String LOG_TAG = "Fade";
    public static final int OUT = 2;
    private static final String PROPNAME_SCREEN_X = "android:fade:screenX";
    private static final String PROPNAME_SCREEN_Y = "android:fade:screenY";
    private int mFadingMode;

    public FadePort() {
        this(3);
    }

    public FadePort(int fadingMode) {
        this.mFadingMode = fadingMode;
    }

    private Animator createAnimation(View view, float startAlpha, float endAlpha, AnimatorListenerAdapter listener) {
        ObjectAnimator anim = null;
        if (startAlpha == endAlpha) {
            if (listener != null) {
                listener.onAnimationEnd(null);
            }
        } else {
            anim = ObjectAnimator.ofFloat(view, "alpha", startAlpha, endAlpha);
            if (DBG) {
                Log.d(LOG_TAG, "Created animator " + anim);
            }
            if (listener != null) {
                anim.addListener(listener);
            }
        }
        return anim;
    }

    private void captureValues(TransitionValues transitionValues) {
        int[] loc = new int[2];
        transitionValues.view.getLocationOnScreen(loc);
        transitionValues.values.put(PROPNAME_SCREEN_X, Integer.valueOf(loc[0]));
        transitionValues.values.put(PROPNAME_SCREEN_Y, Integer.valueOf(loc[1]));
    }

    @Override // android.support.transition.VisibilityPort, android.support.transition.TransitionPort
    public void captureStartValues(TransitionValues transitionValues) {
        super.captureStartValues(transitionValues);
        captureValues(transitionValues);
    }

    @Override // android.support.transition.VisibilityPort
    public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        if ((this.mFadingMode & 1) != 1 || endValues == null) {
            return null;
        }
        final View endView = endValues.view;
        if (DBG) {
            View startView = startValues != null ? startValues.view : null;
            Log.d(LOG_TAG, "Fade.onAppear: startView, startVis, endView, endVis = " + startView + ", " + startVisibility + ", " + endView + ", " + endVisibility);
        }
        endView.setAlpha(0.0f);
        TransitionPort.TransitionListener transitionListener = new TransitionPort.TransitionListenerAdapter() { // from class: android.support.transition.FadePort.1
            boolean mCanceled = false;
            float mPausedAlpha;

            @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
            public void onTransitionCancel(TransitionPort transition) {
                endView.setAlpha(1.0f);
                this.mCanceled = true;
            }

            @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
            public void onTransitionEnd(TransitionPort transition) {
                if (!this.mCanceled) {
                    endView.setAlpha(1.0f);
                }
            }

            @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
            public void onTransitionPause(TransitionPort transition) {
                this.mPausedAlpha = endView.getAlpha();
                endView.setAlpha(1.0f);
            }

            @Override // android.support.transition.TransitionPort.TransitionListenerAdapter, android.support.transition.TransitionPort.TransitionListener
            public void onTransitionResume(TransitionPort transition) {
                endView.setAlpha(this.mPausedAlpha);
            }
        };
        mo42addListener(transitionListener);
        return createAnimation(endView, 0.0f, 1.0f, null);
    }

    @Override // android.support.transition.VisibilityPort
    public Animator onDisappear(final ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, final int endVisibility) {
        if ((this.mFadingMode & 2) != 2) {
            return null;
        }
        View view = null;
        View startView = startValues != null ? startValues.view : null;
        View endView = endValues != null ? endValues.view : null;
        if (DBG) {
            Log.d(LOG_TAG, "Fade.onDisappear: startView, startVis, endView, endVis = " + startView + ", " + startVisibility + ", " + endView + ", " + endVisibility);
        }
        View overlayView = null;
        View viewToKeep = null;
        if (endView == null || endView.getParent() == null) {
            if (endView != null) {
                overlayView = endView;
                view = endView;
            } else if (startView != null) {
                if (startView.getParent() == null) {
                    overlayView = startView;
                    view = startView;
                } else if ((startView.getParent() instanceof View) && startView.getParent().getParent() == null) {
                    View startParent = (View) startView.getParent();
                    int id = startParent.getId();
                    if (id != -1 && sceneRoot.findViewById(id) != null && this.mCanRemoveViews) {
                        overlayView = startView;
                        view = startView;
                    }
                }
            }
        } else if (endVisibility == 4) {
            view = endView;
            viewToKeep = view;
        } else if (startView == endView) {
            view = endView;
            viewToKeep = view;
        } else {
            view = startView;
            overlayView = view;
        }
        if (overlayView != null) {
            int screenX = ((Integer) startValues.values.get(PROPNAME_SCREEN_X)).intValue();
            int screenY = ((Integer) startValues.values.get(PROPNAME_SCREEN_Y)).intValue();
            int[] loc = new int[2];
            sceneRoot.getLocationOnScreen(loc);
            ViewCompat.offsetLeftAndRight(overlayView, (screenX - loc[0]) - overlayView.getLeft());
            ViewCompat.offsetTopAndBottom(overlayView, (screenY - loc[1]) - overlayView.getTop());
            ViewGroupOverlay.createFrom(sceneRoot).add(overlayView);
            final View finalView = view;
            final View finalOverlayView = overlayView;
            final View finalViewToKeep = viewToKeep;
            AnimatorListenerAdapter endListener = new AnimatorListenerAdapter() { // from class: android.support.transition.FadePort.2
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    finalView.setAlpha(1.0f);
                    if (finalViewToKeep != null) {
                        finalViewToKeep.setVisibility(endVisibility);
                    }
                    if (finalOverlayView != null) {
                        ViewGroupOverlay.createFrom(sceneRoot).remove(finalOverlayView);
                    }
                }
            };
            return createAnimation(view, 1.0f, 0.0f, endListener);
        } else if (viewToKeep != null) {
            viewToKeep.setVisibility(0);
            final View finalView2 = view;
            final View finalOverlayView2 = overlayView;
            final View finalViewToKeep2 = viewToKeep;
            AnimatorListenerAdapter endListener2 = new AnimatorListenerAdapter() { // from class: android.support.transition.FadePort.3
                boolean mCanceled = false;
                float mPausedAlpha = -1.0f;

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                    this.mCanceled = true;
                    if (this.mPausedAlpha >= 0.0f) {
                        finalView2.setAlpha(this.mPausedAlpha);
                    }
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    if (!this.mCanceled) {
                        finalView2.setAlpha(1.0f);
                    }
                    if (finalViewToKeep2 != null && !this.mCanceled) {
                        finalViewToKeep2.setVisibility(endVisibility);
                    }
                    if (finalOverlayView2 != null) {
                        ViewGroupOverlay.createFrom(sceneRoot).add(finalOverlayView2);
                    }
                }
            };
            return createAnimation(view, 1.0f, 0.0f, endListener2);
        } else {
            return null;
        }
    }
}
