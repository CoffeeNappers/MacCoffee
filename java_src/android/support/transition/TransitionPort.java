package android.support.transition;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.TimeInterpolator;
import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.v4.util.ArrayMap;
import android.support.v4.util.LongSparseArray;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
public abstract class TransitionPort implements Cloneable {
    static final boolean DBG = false;
    private static final String LOG_TAG = "Transition";
    private static ThreadLocal<ArrayMap<Animator, AnimationInfo>> sRunningAnimators = new ThreadLocal<>();
    long mStartDelay = -1;
    long mDuration = -1;
    TimeInterpolator mInterpolator = null;
    ArrayList<Integer> mTargetIds = new ArrayList<>();
    ArrayList<View> mTargets = new ArrayList<>();
    ArrayList<Integer> mTargetIdExcludes = null;
    ArrayList<View> mTargetExcludes = null;
    ArrayList<Class> mTargetTypeExcludes = null;
    ArrayList<Integer> mTargetIdChildExcludes = null;
    ArrayList<View> mTargetChildExcludes = null;
    ArrayList<Class> mTargetTypeChildExcludes = null;
    TransitionSetPort mParent = null;
    ViewGroup mSceneRoot = null;
    boolean mCanRemoveViews = false;
    int mNumInstances = 0;
    boolean mPaused = false;
    ArrayList<TransitionListener> mListeners = null;
    ArrayList<Animator> mAnimators = new ArrayList<>();
    private String mName = getClass().getName();
    private TransitionValuesMaps mStartValues = new TransitionValuesMaps();
    private TransitionValuesMaps mEndValues = new TransitionValuesMaps();
    ArrayList<Animator> mCurrentAnimators = new ArrayList<>();
    private boolean mEnded = false;

    /* loaded from: classes.dex */
    public interface TransitionListener {
        void onTransitionCancel(TransitionPort transitionPort);

        void onTransitionEnd(TransitionPort transitionPort);

        void onTransitionPause(TransitionPort transitionPort);

        void onTransitionResume(TransitionPort transitionPort);

        void onTransitionStart(TransitionPort transitionPort);
    }

    public abstract void captureEndValues(TransitionValues transitionValues);

    public abstract void captureStartValues(TransitionValues transitionValues);

    private static ArrayMap<Animator, AnimationInfo> getRunningAnimators() {
        ArrayMap<Animator, AnimationInfo> runningAnimators = sRunningAnimators.get();
        if (runningAnimators == null) {
            ArrayMap<Animator, AnimationInfo> runningAnimators2 = new ArrayMap<>();
            sRunningAnimators.set(runningAnimators2);
            return runningAnimators2;
        }
        return runningAnimators;
    }

    public long getDuration() {
        return this.mDuration;
    }

    /* renamed from: setDuration */
    public TransitionPort mo49setDuration(long duration) {
        this.mDuration = duration;
        return this;
    }

    public long getStartDelay() {
        return this.mStartDelay;
    }

    /* renamed from: setStartDelay */
    public TransitionPort mo52setStartDelay(long startDelay) {
        this.mStartDelay = startDelay;
        return this;
    }

    public TimeInterpolator getInterpolator() {
        return this.mInterpolator;
    }

    /* renamed from: setInterpolator */
    public TransitionPort mo50setInterpolator(TimeInterpolator interpolator) {
        this.mInterpolator = interpolator;
        return this;
    }

    public String[] getTransitionProperties() {
        return null;
    }

    public Animator createAnimator(ViewGroup sceneRoot, TransitionValues startValues, TransitionValues endValues) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void createAnimators(ViewGroup sceneRoot, TransitionValuesMaps startValues, TransitionValuesMaps endValues) {
        Animator animator;
        View view;
        ArrayMap<View, TransitionValues> endCopy = new ArrayMap<>(endValues.viewValues);
        SparseArray<TransitionValues> endIdCopy = new SparseArray<>(endValues.idValues.size());
        for (int i = 0; i < endValues.idValues.size(); i++) {
            endIdCopy.put(endValues.idValues.keyAt(i), endValues.idValues.valueAt(i));
        }
        LongSparseArray<TransitionValues> endItemIdCopy = new LongSparseArray<>(endValues.itemIdValues.size());
        for (int i2 = 0; i2 < endValues.itemIdValues.size(); i2++) {
            endItemIdCopy.put(endValues.itemIdValues.keyAt(i2), endValues.itemIdValues.valueAt(i2));
        }
        ArrayList<TransitionValues> startValuesList = new ArrayList<>();
        ArrayList<TransitionValues> endValuesList = new ArrayList<>();
        for (View view2 : startValues.viewValues.keySet()) {
            TransitionValues end = null;
            boolean isInListView = false;
            if (view2.getParent() instanceof ListView) {
                isInListView = true;
            }
            if (!isInListView) {
                int id = view2.getId();
                TransitionValues start = startValues.viewValues.get(view2) != null ? startValues.viewValues.get(view2) : startValues.idValues.get(id);
                if (endValues.viewValues.get(view2) != null) {
                    end = endValues.viewValues.get(view2);
                    endCopy.remove(view2);
                } else if (id != -1) {
                    end = endValues.idValues.get(id);
                    View removeView = null;
                    for (View viewToRemove : endCopy.keySet()) {
                        if (viewToRemove.getId() == id) {
                            removeView = viewToRemove;
                        }
                    }
                    if (removeView != null) {
                        endCopy.remove(removeView);
                    }
                }
                endIdCopy.remove(id);
                if (isValidTarget(view2, id)) {
                    startValuesList.add(start);
                    endValuesList.add(end);
                }
            } else {
                ListView parent = (ListView) view2.getParent();
                if (parent.getAdapter().hasStableIds()) {
                    int position = parent.getPositionForView(view2);
                    long itemId = parent.getItemIdAtPosition(position);
                    endItemIdCopy.remove(itemId);
                    startValuesList.add(startValues.itemIdValues.get(itemId));
                    endValuesList.add(null);
                }
            }
        }
        int startItemIdCopySize = startValues.itemIdValues.size();
        for (int i3 = 0; i3 < startItemIdCopySize; i3++) {
            long id2 = startValues.itemIdValues.keyAt(i3);
            if (isValidTarget(null, id2)) {
                endItemIdCopy.remove(id2);
                startValuesList.add(startValues.itemIdValues.get(id2));
                endValuesList.add(endValues.itemIdValues.get(id2));
            }
        }
        for (View view3 : endCopy.keySet()) {
            int id3 = view3.getId();
            if (isValidTarget(view3, id3)) {
                TransitionValues start2 = startValues.viewValues.get(view3) != null ? startValues.viewValues.get(view3) : startValues.idValues.get(id3);
                endIdCopy.remove(id3);
                startValuesList.add(start2);
                endValuesList.add(endCopy.get(view3));
            }
        }
        int endIdCopySize = endIdCopy.size();
        for (int i4 = 0; i4 < endIdCopySize; i4++) {
            int id4 = endIdCopy.keyAt(i4);
            if (isValidTarget(null, id4)) {
                startValuesList.add(startValues.idValues.get(id4));
                endValuesList.add(endIdCopy.get(id4));
            }
        }
        int endItemIdCopySize = endItemIdCopy.size();
        for (int i5 = 0; i5 < endItemIdCopySize; i5++) {
            long id5 = endItemIdCopy.keyAt(i5);
            startValuesList.add(startValues.itemIdValues.get(id5));
            endValuesList.add(endItemIdCopy.get(id5));
        }
        ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
        for (int i6 = 0; i6 < startValuesList.size(); i6++) {
            TransitionValues start3 = startValuesList.get(i6);
            TransitionValues end2 = endValuesList.get(i6);
            if ((start3 != null || end2 != null) && ((start3 == null || !start3.equals(end2)) && (animator = createAnimator(sceneRoot, start3, end2)) != null)) {
                TransitionValues infoValues = null;
                if (end2 != null) {
                    view = end2.view;
                    String[] properties = getTransitionProperties();
                    if (view != null && properties != null && properties.length > 0) {
                        infoValues = new TransitionValues();
                        infoValues.view = view;
                        TransitionValues newValues = endValues.viewValues.get(view);
                        if (newValues != null) {
                            for (int j = 0; j < properties.length; j++) {
                                infoValues.values.put(properties[j], newValues.values.get(properties[j]));
                            }
                        }
                        int numExistingAnims = runningAnimators.size();
                        int j2 = 0;
                        while (true) {
                            if (j2 >= numExistingAnims) {
                                break;
                            }
                            Animator anim = runningAnimators.keyAt(j2);
                            AnimationInfo info = runningAnimators.get(anim);
                            if (info.values == null || info.view != view || (((info.name != null || getName() != null) && !info.name.equals(getName())) || !info.values.equals(infoValues))) {
                                j2++;
                            } else {
                                animator = null;
                                break;
                            }
                        }
                    }
                } else {
                    view = start3.view;
                }
                if (animator != null) {
                    runningAnimators.put(animator, new AnimationInfo(view, getName(), WindowIdPort.getWindowId(sceneRoot), infoValues));
                    this.mAnimators.add(animator);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isValidTarget(View target, long targetId) {
        if (this.mTargetIdExcludes == null || !this.mTargetIdExcludes.contains(Integer.valueOf((int) targetId))) {
            if (this.mTargetExcludes != null && this.mTargetExcludes.contains(target)) {
                return false;
            }
            if (this.mTargetTypeExcludes != null && target != null) {
                int numTypes = this.mTargetTypeExcludes.size();
                for (int i = 0; i < numTypes; i++) {
                    Class type = this.mTargetTypeExcludes.get(i);
                    if (type.isInstance(target)) {
                        return false;
                    }
                }
            }
            if (this.mTargetIds.size() == 0 && this.mTargets.size() == 0) {
                return true;
            }
            if (this.mTargetIds.size() > 0) {
                for (int i2 = 0; i2 < this.mTargetIds.size(); i2++) {
                    if (this.mTargetIds.get(i2).intValue() == targetId) {
                        return true;
                    }
                }
            }
            if (target != null && this.mTargets.size() > 0) {
                for (int i3 = 0; i3 < this.mTargets.size(); i3++) {
                    if (this.mTargets.get(i3) == target) {
                        return true;
                    }
                }
            }
            return false;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void runAnimators() {
        start();
        ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
        Iterator<Animator> it = this.mAnimators.iterator();
        while (it.hasNext()) {
            Animator anim = it.next();
            if (runningAnimators.containsKey(anim)) {
                start();
                runAnimator(anim, runningAnimators);
            }
        }
        this.mAnimators.clear();
        end();
    }

    private void runAnimator(Animator animator, final ArrayMap<Animator, AnimationInfo> runningAnimators) {
        if (animator != null) {
            animator.addListener(new AnimatorListenerAdapter() { // from class: android.support.transition.TransitionPort.1
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                    TransitionPort.this.mCurrentAnimators.add(animation);
                }

                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    runningAnimators.remove(animation);
                    TransitionPort.this.mCurrentAnimators.remove(animation);
                }
            });
            animate(animator);
        }
    }

    /* renamed from: addTarget */
    public TransitionPort mo43addTarget(int targetId) {
        if (targetId > 0) {
            this.mTargetIds.add(Integer.valueOf(targetId));
        }
        return this;
    }

    /* renamed from: removeTarget */
    public TransitionPort mo47removeTarget(int targetId) {
        if (targetId > 0) {
            this.mTargetIds.remove(Integer.valueOf(targetId));
        }
        return this;
    }

    public TransitionPort excludeTarget(int targetId, boolean exclude) {
        this.mTargetIdExcludes = excludeId(this.mTargetIdExcludes, targetId, exclude);
        return this;
    }

    public TransitionPort excludeChildren(int targetId, boolean exclude) {
        this.mTargetIdChildExcludes = excludeId(this.mTargetIdChildExcludes, targetId, exclude);
        return this;
    }

    private ArrayList<Integer> excludeId(ArrayList<Integer> list, int targetId, boolean exclude) {
        if (targetId > 0) {
            if (exclude) {
                return ArrayListManager.add(list, Integer.valueOf(targetId));
            }
            return ArrayListManager.remove(list, Integer.valueOf(targetId));
        }
        return list;
    }

    public TransitionPort excludeTarget(View target, boolean exclude) {
        this.mTargetExcludes = excludeView(this.mTargetExcludes, target, exclude);
        return this;
    }

    public TransitionPort excludeChildren(View target, boolean exclude) {
        this.mTargetChildExcludes = excludeView(this.mTargetChildExcludes, target, exclude);
        return this;
    }

    private ArrayList<View> excludeView(ArrayList<View> list, View target, boolean exclude) {
        if (target != null) {
            if (exclude) {
                return ArrayListManager.add(list, target);
            }
            return ArrayListManager.remove(list, target);
        }
        return list;
    }

    public TransitionPort excludeTarget(Class type, boolean exclude) {
        this.mTargetTypeExcludes = excludeType(this.mTargetTypeExcludes, type, exclude);
        return this;
    }

    public TransitionPort excludeChildren(Class type, boolean exclude) {
        this.mTargetTypeChildExcludes = excludeType(this.mTargetTypeChildExcludes, type, exclude);
        return this;
    }

    private ArrayList<Class> excludeType(ArrayList<Class> list, Class type, boolean exclude) {
        if (type != null) {
            if (exclude) {
                return ArrayListManager.add(list, type);
            }
            return ArrayListManager.remove(list, type);
        }
        return list;
    }

    /* renamed from: addTarget */
    public TransitionPort mo44addTarget(View target) {
        this.mTargets.add(target);
        return this;
    }

    /* renamed from: removeTarget */
    public TransitionPort mo48removeTarget(View target) {
        if (target != null) {
            this.mTargets.remove(target);
        }
        return this;
    }

    public List<Integer> getTargetIds() {
        return this.mTargetIds;
    }

    public List<View> getTargets() {
        return this.mTargets;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void captureValues(ViewGroup sceneRoot, boolean start) {
        clearValues(start);
        if (this.mTargetIds.size() > 0 || this.mTargets.size() > 0) {
            if (this.mTargetIds.size() > 0) {
                for (int i = 0; i < this.mTargetIds.size(); i++) {
                    int id = this.mTargetIds.get(i).intValue();
                    View view = sceneRoot.findViewById(id);
                    if (view != null) {
                        TransitionValues values = new TransitionValues();
                        values.view = view;
                        if (start) {
                            captureStartValues(values);
                        } else {
                            captureEndValues(values);
                        }
                        if (start) {
                            this.mStartValues.viewValues.put(view, values);
                            if (id >= 0) {
                                this.mStartValues.idValues.put(id, values);
                            }
                        } else {
                            this.mEndValues.viewValues.put(view, values);
                            if (id >= 0) {
                                this.mEndValues.idValues.put(id, values);
                            }
                        }
                    }
                }
            }
            if (this.mTargets.size() > 0) {
                for (int i2 = 0; i2 < this.mTargets.size(); i2++) {
                    View view2 = this.mTargets.get(i2);
                    if (view2 != null) {
                        TransitionValues values2 = new TransitionValues();
                        values2.view = view2;
                        if (start) {
                            captureStartValues(values2);
                        } else {
                            captureEndValues(values2);
                        }
                        if (start) {
                            this.mStartValues.viewValues.put(view2, values2);
                        } else {
                            this.mEndValues.viewValues.put(view2, values2);
                        }
                    }
                }
                return;
            }
            return;
        }
        captureHierarchy(sceneRoot, start);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clearValues(boolean start) {
        if (start) {
            this.mStartValues.viewValues.clear();
            this.mStartValues.idValues.clear();
            this.mStartValues.itemIdValues.clear();
            return;
        }
        this.mEndValues.viewValues.clear();
        this.mEndValues.idValues.clear();
        this.mEndValues.itemIdValues.clear();
    }

    private void captureHierarchy(View view, boolean start) {
        if (view != null) {
            boolean isListViewItem = false;
            if (view.getParent() instanceof ListView) {
                isListViewItem = true;
            }
            if (!isListViewItem || ((ListView) view.getParent()).getAdapter().hasStableIds()) {
                int id = -1;
                long itemId = -1;
                if (!isListViewItem) {
                    id = view.getId();
                } else {
                    ListView listview = (ListView) view.getParent();
                    int position = listview.getPositionForView(view);
                    itemId = listview.getItemIdAtPosition(position);
                }
                if (this.mTargetIdExcludes == null || !this.mTargetIdExcludes.contains(Integer.valueOf(id))) {
                    if (this.mTargetExcludes == null || !this.mTargetExcludes.contains(view)) {
                        if (this.mTargetTypeExcludes != null && view != null) {
                            int numTypes = this.mTargetTypeExcludes.size();
                            for (int i = 0; i < numTypes; i++) {
                                if (this.mTargetTypeExcludes.get(i).isInstance(view)) {
                                    return;
                                }
                            }
                        }
                        TransitionValues values = new TransitionValues();
                        values.view = view;
                        if (start) {
                            captureStartValues(values);
                        } else {
                            captureEndValues(values);
                        }
                        if (start) {
                            if (!isListViewItem) {
                                this.mStartValues.viewValues.put(view, values);
                                if (id >= 0) {
                                    this.mStartValues.idValues.put(id, values);
                                }
                            } else {
                                this.mStartValues.itemIdValues.put(itemId, values);
                            }
                        } else if (!isListViewItem) {
                            this.mEndValues.viewValues.put(view, values);
                            if (id >= 0) {
                                this.mEndValues.idValues.put(id, values);
                            }
                        } else {
                            this.mEndValues.itemIdValues.put(itemId, values);
                        }
                        if (view instanceof ViewGroup) {
                            if (this.mTargetIdChildExcludes == null || !this.mTargetIdChildExcludes.contains(Integer.valueOf(id))) {
                                if (this.mTargetChildExcludes == null || !this.mTargetChildExcludes.contains(view)) {
                                    if (this.mTargetTypeChildExcludes != null && view != null) {
                                        int numTypes2 = this.mTargetTypeChildExcludes.size();
                                        for (int i2 = 0; i2 < numTypes2; i2++) {
                                            if (this.mTargetTypeChildExcludes.get(i2).isInstance(view)) {
                                                return;
                                            }
                                        }
                                    }
                                    ViewGroup parent = (ViewGroup) view;
                                    for (int i3 = 0; i3 < parent.getChildCount(); i3++) {
                                        captureHierarchy(parent.getChildAt(i3), start);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public TransitionValues getTransitionValues(View view, boolean start) {
        if (this.mParent != null) {
            return this.mParent.getTransitionValues(view, start);
        }
        TransitionValuesMaps valuesMaps = start ? this.mStartValues : this.mEndValues;
        TransitionValues values = valuesMaps.viewValues.get(view);
        if (values == null) {
            int id = view.getId();
            if (id >= 0) {
                values = valuesMaps.idValues.get(id);
            }
            if (values == null && (view.getParent() instanceof ListView)) {
                ListView listview = (ListView) view.getParent();
                int position = listview.getPositionForView(view);
                long itemId = listview.getItemIdAtPosition(position);
                return valuesMaps.itemIdValues.get(itemId);
            }
            return values;
        }
        return values;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void pause(View sceneRoot) {
        if (!this.mEnded) {
            ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
            int numOldAnims = runningAnimators.size();
            WindowIdPort windowId = WindowIdPort.getWindowId(sceneRoot);
            for (int i = numOldAnims - 1; i >= 0; i--) {
                AnimationInfo info = runningAnimators.valueAt(i);
                if (info.view != null && windowId.equals(info.windowId)) {
                    Animator anim = runningAnimators.keyAt(i);
                    anim.cancel();
                }
            }
            if (this.mListeners != null && this.mListeners.size() > 0) {
                ArrayList<TransitionListener> tmpListeners = (ArrayList) this.mListeners.clone();
                int numListeners = tmpListeners.size();
                for (int i2 = 0; i2 < numListeners; i2++) {
                    tmpListeners.get(i2).onTransitionPause(this);
                }
            }
            this.mPaused = true;
        }
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void resume(View sceneRoot) {
        if (this.mPaused) {
            if (!this.mEnded) {
                ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
                int numOldAnims = runningAnimators.size();
                WindowIdPort windowId = WindowIdPort.getWindowId(sceneRoot);
                for (int i = numOldAnims - 1; i >= 0; i--) {
                    AnimationInfo info = runningAnimators.valueAt(i);
                    if (info.view != null && windowId.equals(info.windowId)) {
                        Animator anim = runningAnimators.keyAt(i);
                        anim.end();
                    }
                }
                if (this.mListeners != null && this.mListeners.size() > 0) {
                    ArrayList<TransitionListener> tmpListeners = (ArrayList) this.mListeners.clone();
                    int numListeners = tmpListeners.size();
                    for (int i2 = 0; i2 < numListeners; i2++) {
                        tmpListeners.get(i2).onTransitionResume(this);
                    }
                }
            }
            this.mPaused = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void playTransition(ViewGroup sceneRoot) {
        AnimationInfo oldInfo;
        ArrayMap<Animator, AnimationInfo> runningAnimators = getRunningAnimators();
        int numOldAnims = runningAnimators.size();
        for (int i = numOldAnims - 1; i >= 0; i--) {
            Animator anim = runningAnimators.keyAt(i);
            if (anim != null && (oldInfo = runningAnimators.get(anim)) != null && oldInfo.view != null && oldInfo.view.getContext() == sceneRoot.getContext()) {
                boolean cancel = false;
                TransitionValues oldValues = oldInfo.values;
                View oldView = oldInfo.view;
                TransitionValues newValues = this.mEndValues.viewValues != null ? this.mEndValues.viewValues.get(oldView) : null;
                if (newValues == null) {
                    newValues = this.mEndValues.idValues.get(oldView.getId());
                }
                if (oldValues != null && newValues != null) {
                    Iterator<String> it = oldValues.values.keySet().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        String key = it.next();
                        Object oldValue = oldValues.values.get(key);
                        Object newValue = newValues.values.get(key);
                        if (oldValue != null && newValue != null && !oldValue.equals(newValue)) {
                            cancel = true;
                            break;
                        }
                    }
                }
                if (cancel) {
                    if (anim.isRunning() || anim.isStarted()) {
                        anim.cancel();
                    } else {
                        runningAnimators.remove(anim);
                    }
                }
            }
        }
        createAnimators(sceneRoot, this.mStartValues, this.mEndValues);
        runAnimators();
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected void animate(Animator animator) {
        if (animator == null) {
            end();
            return;
        }
        if (getDuration() >= 0) {
            animator.setDuration(getDuration());
        }
        if (getStartDelay() >= 0) {
            animator.setStartDelay(getStartDelay());
        }
        if (getInterpolator() != null) {
            animator.setInterpolator(getInterpolator());
        }
        animator.addListener(new AnimatorListenerAdapter() { // from class: android.support.transition.TransitionPort.2
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                TransitionPort.this.end();
                animation.removeListener(this);
            }
        });
        animator.start();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void start() {
        if (this.mNumInstances == 0) {
            if (this.mListeners != null && this.mListeners.size() > 0) {
                ArrayList<TransitionListener> tmpListeners = (ArrayList) this.mListeners.clone();
                int numListeners = tmpListeners.size();
                for (int i = 0; i < numListeners; i++) {
                    tmpListeners.get(i).onTransitionStart(this);
                }
            }
            this.mEnded = false;
        }
        this.mNumInstances++;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void end() {
        this.mNumInstances--;
        if (this.mNumInstances == 0) {
            if (this.mListeners != null && this.mListeners.size() > 0) {
                ArrayList<TransitionListener> tmpListeners = (ArrayList) this.mListeners.clone();
                int numListeners = tmpListeners.size();
                for (int i = 0; i < numListeners; i++) {
                    tmpListeners.get(i).onTransitionEnd(this);
                }
            }
            for (int i2 = 0; i2 < this.mStartValues.itemIdValues.size(); i2++) {
                TransitionValues tv = this.mStartValues.itemIdValues.valueAt(i2);
                View view = tv.view;
            }
            for (int i3 = 0; i3 < this.mEndValues.itemIdValues.size(); i3++) {
                TransitionValues tv2 = this.mEndValues.itemIdValues.valueAt(i3);
                View view2 = tv2.view;
            }
            this.mEnded = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void cancel() {
        int numAnimators = this.mCurrentAnimators.size();
        for (int i = numAnimators - 1; i >= 0; i--) {
            Animator animator = this.mCurrentAnimators.get(i);
            animator.cancel();
        }
        if (this.mListeners != null && this.mListeners.size() > 0) {
            ArrayList<TransitionListener> tmpListeners = (ArrayList) this.mListeners.clone();
            int numListeners = tmpListeners.size();
            for (int i2 = 0; i2 < numListeners; i2++) {
                tmpListeners.get(i2).onTransitionCancel(this);
            }
        }
    }

    /* renamed from: addListener */
    public TransitionPort mo42addListener(TransitionListener listener) {
        if (this.mListeners == null) {
            this.mListeners = new ArrayList<>();
        }
        this.mListeners.add(listener);
        return this;
    }

    /* renamed from: removeListener */
    public TransitionPort mo46removeListener(TransitionListener listener) {
        if (this.mListeners != null) {
            this.mListeners.remove(listener);
            if (this.mListeners.size() == 0) {
                this.mListeners = null;
            }
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: setSceneRoot */
    public TransitionPort mo51setSceneRoot(ViewGroup sceneRoot) {
        this.mSceneRoot = sceneRoot;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCanRemoveViews(boolean canRemoveViews) {
        this.mCanRemoveViews = canRemoveViews;
    }

    public String toString() {
        return toString("");
    }

    /* renamed from: clone */
    public TransitionPort m35clone() {
        TransitionPort clone = null;
        try {
            clone = (TransitionPort) super.clone();
            clone.mAnimators = new ArrayList<>();
            clone.mStartValues = new TransitionValuesMaps();
            clone.mEndValues = new TransitionValuesMaps();
            return clone;
        } catch (CloneNotSupportedException e) {
            return clone;
        }
    }

    public String getName() {
        return this.mName;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String toString(String indent) {
        String result = indent + getClass().getSimpleName() + "@" + Integer.toHexString(hashCode()) + ": ";
        if (this.mDuration != -1) {
            result = result + "dur(" + this.mDuration + ") ";
        }
        if (this.mStartDelay != -1) {
            result = result + "dly(" + this.mStartDelay + ") ";
        }
        if (this.mInterpolator != null) {
            result = result + "interp(" + this.mInterpolator + ") ";
        }
        if (this.mTargetIds.size() > 0 || this.mTargets.size() > 0) {
            String result2 = result + "tgts(";
            if (this.mTargetIds.size() > 0) {
                for (int i = 0; i < this.mTargetIds.size(); i++) {
                    if (i > 0) {
                        result2 = result2 + ", ";
                    }
                    result2 = result2 + this.mTargetIds.get(i);
                }
            }
            if (this.mTargets.size() > 0) {
                for (int i2 = 0; i2 < this.mTargets.size(); i2++) {
                    if (i2 > 0) {
                        result2 = result2 + ", ";
                    }
                    result2 = result2 + this.mTargets.get(i2);
                }
            }
            return result2 + ")";
        }
        return result;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    /* loaded from: classes.dex */
    public static class TransitionListenerAdapter implements TransitionListener {
        @Override // android.support.transition.TransitionPort.TransitionListener
        public void onTransitionStart(TransitionPort transition) {
        }

        @Override // android.support.transition.TransitionPort.TransitionListener
        public void onTransitionEnd(TransitionPort transition) {
        }

        @Override // android.support.transition.TransitionPort.TransitionListener
        public void onTransitionCancel(TransitionPort transition) {
        }

        @Override // android.support.transition.TransitionPort.TransitionListener
        public void onTransitionPause(TransitionPort transition) {
        }

        @Override // android.support.transition.TransitionPort.TransitionListener
        public void onTransitionResume(TransitionPort transition) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class AnimationInfo {
        String name;
        TransitionValues values;
        View view;
        WindowIdPort windowId;

        AnimationInfo(View view, String name, WindowIdPort windowId, TransitionValues values) {
            this.view = view;
            this.name = name;
            this.values = values;
            this.windowId = windowId;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class ArrayListManager {
        private ArrayListManager() {
        }

        static <T> ArrayList<T> add(ArrayList<T> list, T item) {
            if (list == null) {
                list = new ArrayList<>();
            }
            if (!list.contains(item)) {
                list.add(item);
            }
            return list;
        }

        static <T> ArrayList<T> remove(ArrayList<T> list, T item) {
            if (list != null) {
                list.remove(item);
                if (list.isEmpty()) {
                    return null;
                }
                return list;
            }
            return list;
        }
    }
}
