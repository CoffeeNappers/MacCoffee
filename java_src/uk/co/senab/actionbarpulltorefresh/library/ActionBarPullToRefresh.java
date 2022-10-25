package uk.co.senab.actionbarpulltorefresh.library;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;
/* loaded from: classes3.dex */
public class ActionBarPullToRefresh {
    public static SetupWizard from(Activity activity) {
        return new SetupWizard(activity);
    }

    /* loaded from: classes3.dex */
    public static final class SetupWizard {
        private final Activity mActivity;
        private OnRefreshListener mOnRefreshListener;
        private Options mOptions;
        private HashMap<Class, ViewDelegate> mViewDelegates;
        private ViewGroup mViewGroupToInsertInto;
        private int[] refreshableViewIds;
        private View[] refreshableViews;

        private SetupWizard(Activity activity) {
            this.mActivity = activity;
        }

        public SetupWizard options(Options options) {
            this.mOptions = options;
            return this;
        }

        public SetupWizard allChildrenArePullable() {
            this.refreshableViewIds = null;
            this.refreshableViews = null;
            return this;
        }

        public SetupWizard theseChildrenArePullable(int... viewIds) {
            this.refreshableViewIds = viewIds;
            this.refreshableViews = null;
            return this;
        }

        public SetupWizard theseChildrenArePullable(View... views) {
            this.refreshableViews = views;
            this.refreshableViewIds = null;
            return this;
        }

        public SetupWizard useViewDelegate(Class<?> viewClass, ViewDelegate delegate) {
            if (this.mViewDelegates == null) {
                this.mViewDelegates = new HashMap<>();
            }
            this.mViewDelegates.put(viewClass, delegate);
            return this;
        }

        public SetupWizard listener(OnRefreshListener listener) {
            this.mOnRefreshListener = listener;
            return this;
        }

        public SetupWizard insertLayoutInto(ViewGroup viewGroup) {
            this.mViewGroupToInsertInto = viewGroup;
            return this;
        }

        public void setup(PullToRefreshLayout pullToRefreshLayout) {
            PullToRefreshAttacher attacher = pullToRefreshLayout.createPullToRefreshAttacher(this.mActivity, this.mOptions);
            attacher.setOnRefreshListener(this.mOnRefreshListener);
            if (this.mViewGroupToInsertInto != null) {
                insertLayoutIntoViewGroup(this.mViewGroupToInsertInto, pullToRefreshLayout);
            }
            pullToRefreshLayout.setPullToRefreshAttacher(attacher);
            if (this.refreshableViewIds != null) {
                pullToRefreshLayout.addChildrenAsPullable(this.refreshableViewIds);
            } else if (this.refreshableViews != null) {
                pullToRefreshLayout.addChildrenAsPullable(this.refreshableViews);
            } else {
                pullToRefreshLayout.addAllChildrenAsPullable();
            }
            if (this.mViewDelegates != null) {
                Set<Map.Entry<Class, ViewDelegate>> entries = this.mViewDelegates.entrySet();
                for (Map.Entry<Class, ViewDelegate> entry : entries) {
                    attacher.useViewDelegate(entry.getKey(), entry.getValue());
                }
            }
        }

        private static void insertLayoutIntoViewGroup(ViewGroup viewGroup, PullToRefreshLayout pullToRefreshLayout) {
            View child = viewGroup.getChildAt(0);
            while (child != null) {
                viewGroup.removeViewAt(0);
                pullToRefreshLayout.addView(child);
                child = viewGroup.getChildAt(0);
            }
            viewGroup.addView(pullToRefreshLayout, -1, -1);
        }
    }
}
