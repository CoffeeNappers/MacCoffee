package android.support.transition;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.ViewGroup;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
abstract class VisibilityPort extends TransitionPort {
    private static final String PROPNAME_VISIBILITY = "android:visibility:visibility";
    private static final String PROPNAME_PARENT = "android:visibility:parent";
    private static final String[] sTransitionProperties = {PROPNAME_VISIBILITY, PROPNAME_PARENT};

    @Override // android.support.transition.TransitionPort
    public String[] getTransitionProperties() {
        return sTransitionProperties;
    }

    private void captureValues(TransitionValues transitionValues) {
        int visibility = transitionValues.view.getVisibility();
        transitionValues.values.put(PROPNAME_VISIBILITY, Integer.valueOf(visibility));
        transitionValues.values.put(PROPNAME_PARENT, transitionValues.view.getParent());
    }

    @Override // android.support.transition.TransitionPort
    public void captureStartValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
    }

    @Override // android.support.transition.TransitionPort
    public void captureEndValues(TransitionValues transitionValues) {
        captureValues(transitionValues);
    }

    public boolean isVisible(TransitionValues values) {
        if (values == null) {
            return false;
        }
        int visibility = ((Integer) values.values.get(PROPNAME_VISIBILITY)).intValue();
        View parent = (View) values.values.get(PROPNAME_PARENT);
        return visibility == 0 && parent != null;
    }

    private VisibilityInfo getVisibilityChangeInfo(TransitionValues startValues, TransitionValues endValues) {
        VisibilityInfo visInfo = new VisibilityInfo();
        visInfo.visibilityChange = false;
        visInfo.fadeIn = false;
        if (startValues != null) {
            visInfo.startVisibility = ((Integer) startValues.values.get(PROPNAME_VISIBILITY)).intValue();
            visInfo.startParent = (ViewGroup) startValues.values.get(PROPNAME_PARENT);
        } else {
            visInfo.startVisibility = -1;
            visInfo.startParent = null;
        }
        if (endValues != null) {
            visInfo.endVisibility = ((Integer) endValues.values.get(PROPNAME_VISIBILITY)).intValue();
            visInfo.endParent = (ViewGroup) endValues.values.get(PROPNAME_PARENT);
        } else {
            visInfo.endVisibility = -1;
            visInfo.endParent = null;
        }
        if (startValues != null && endValues != null) {
            if (visInfo.startVisibility != visInfo.endVisibility || visInfo.startParent != visInfo.endParent) {
                if (visInfo.startVisibility != visInfo.endVisibility) {
                    if (visInfo.startVisibility == 0) {
                        visInfo.fadeIn = false;
                        visInfo.visibilityChange = true;
                    } else if (visInfo.endVisibility == 0) {
                        visInfo.fadeIn = true;
                        visInfo.visibilityChange = true;
                    }
                } else if (visInfo.startParent != visInfo.endParent) {
                    if (visInfo.endParent == null) {
                        visInfo.fadeIn = false;
                        visInfo.visibilityChange = true;
                    } else if (visInfo.startParent == null) {
                        visInfo.fadeIn = true;
                        visInfo.visibilityChange = true;
                    }
                }
            }
            return visInfo;
        }
        if (startValues == null) {
            visInfo.fadeIn = true;
            visInfo.visibilityChange = true;
        } else if (endValues == null) {
            visInfo.fadeIn = false;
            visInfo.visibilityChange = true;
        }
        return visInfo;
    }

    @Override // android.support.transition.TransitionPort
    public Animator createAnimator(ViewGroup sceneRoot, TransitionValues startValues, TransitionValues endValues) {
        int endId = -1;
        VisibilityInfo visInfo = getVisibilityChangeInfo(startValues, endValues);
        if (visInfo.visibilityChange) {
            boolean isTarget = false;
            if (this.mTargets.size() > 0 || this.mTargetIds.size() > 0) {
                View startView = startValues != null ? startValues.view : null;
                View endView = endValues != null ? endValues.view : null;
                int startId = startView != null ? startView.getId() : -1;
                if (endView != null) {
                    endId = endView.getId();
                }
                isTarget = isValidTarget(startView, (long) startId) || isValidTarget(endView, (long) endId);
            }
            if (!isTarget && visInfo.startParent == null && visInfo.endParent == null) {
                return null;
            }
            if (visInfo.fadeIn) {
                return onAppear(sceneRoot, startValues, visInfo.startVisibility, endValues, visInfo.endVisibility);
            }
            return onDisappear(sceneRoot, startValues, visInfo.startVisibility, endValues, visInfo.endVisibility);
        }
        return null;
    }

    public Animator onAppear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return null;
    }

    public Animator onDisappear(ViewGroup sceneRoot, TransitionValues startValues, int startVisibility, TransitionValues endValues, int endVisibility) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class VisibilityInfo {
        ViewGroup endParent;
        int endVisibility;
        boolean fadeIn;
        ViewGroup startParent;
        int startVisibility;
        boolean visibilityChange;

        VisibilityInfo() {
        }
    }
}
