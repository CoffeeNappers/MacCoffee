package android.support.v7.preference;

import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.support.annotation.RestrictTo;
import android.support.v4.view.ViewCompat;
import android.support.v7.preference.Preference;
import android.support.v7.preference.PreferenceGroup;
import android.support.v7.preference.PreferenceManager;
import android.support.v7.util.DiffUtil;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
public class PreferenceGroupAdapter extends RecyclerView.Adapter<PreferenceViewHolder> implements Preference.OnPreferenceChangeInternalListener, PreferenceGroup.PreferencePositionCallback {
    private static final String TAG = "PreferenceGroupAdapter";
    private PreferenceGroup mPreferenceGroup;
    private List<PreferenceLayout> mPreferenceLayouts;
    private List<Preference> mPreferenceList;
    private List<Preference> mPreferenceListInternal;
    private PreferenceLayout mTempPreferenceLayout = new PreferenceLayout();
    private Handler mHandler = new Handler();
    private Runnable mSyncRunnable = new Runnable() { // from class: android.support.v7.preference.PreferenceGroupAdapter.1
        @Override // java.lang.Runnable
        public void run() {
            PreferenceGroupAdapter.this.syncMyPreferences();
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class PreferenceLayout {
        private String name;
        private int resId;
        private int widgetResId;

        public PreferenceLayout() {
        }

        public PreferenceLayout(PreferenceLayout other) {
            this.resId = other.resId;
            this.widgetResId = other.widgetResId;
            this.name = other.name;
        }

        public boolean equals(Object o) {
            if (!(o instanceof PreferenceLayout)) {
                return false;
            }
            PreferenceLayout other = (PreferenceLayout) o;
            return this.resId == other.resId && this.widgetResId == other.widgetResId && TextUtils.equals(this.name, other.name);
        }

        public int hashCode() {
            int result = this.resId + 527;
            return (((result * 31) + this.widgetResId) * 31) + this.name.hashCode();
        }
    }

    public PreferenceGroupAdapter(PreferenceGroup preferenceGroup) {
        this.mPreferenceGroup = preferenceGroup;
        this.mPreferenceGroup.setOnPreferenceChangeInternalListener(this);
        this.mPreferenceList = new ArrayList();
        this.mPreferenceListInternal = new ArrayList();
        this.mPreferenceLayouts = new ArrayList();
        if (this.mPreferenceGroup instanceof PreferenceScreen) {
            setHasStableIds(((PreferenceScreen) this.mPreferenceGroup).shouldUseGeneratedIds());
        } else {
            setHasStableIds(true);
        }
        syncMyPreferences();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syncMyPreferences() {
        for (Preference preference : this.mPreferenceListInternal) {
            preference.setOnPreferenceChangeInternalListener(null);
        }
        List<Preference> fullPreferenceList = new ArrayList<>(this.mPreferenceListInternal.size());
        flattenPreferenceGroup(fullPreferenceList, this.mPreferenceGroup);
        final List<Preference> visiblePreferenceList = new ArrayList<>(fullPreferenceList.size());
        for (Preference preference2 : fullPreferenceList) {
            if (preference2.isVisible()) {
                visiblePreferenceList.add(preference2);
            }
        }
        final List<Preference> oldVisibleList = this.mPreferenceList;
        this.mPreferenceList = visiblePreferenceList;
        this.mPreferenceListInternal = fullPreferenceList;
        PreferenceManager preferenceManager = this.mPreferenceGroup.getPreferenceManager();
        if (preferenceManager != null && preferenceManager.getPreferenceComparisonCallback() != null) {
            final PreferenceManager.PreferenceComparisonCallback comparisonCallback = preferenceManager.getPreferenceComparisonCallback();
            DiffUtil.DiffResult result = DiffUtil.calculateDiff(new DiffUtil.Callback() { // from class: android.support.v7.preference.PreferenceGroupAdapter.2
                @Override // android.support.v7.util.DiffUtil.Callback
                public int getOldListSize() {
                    return oldVisibleList.size();
                }

                @Override // android.support.v7.util.DiffUtil.Callback
                public int getNewListSize() {
                    return visiblePreferenceList.size();
                }

                @Override // android.support.v7.util.DiffUtil.Callback
                public boolean areItemsTheSame(int oldItemPosition, int newItemPosition) {
                    return comparisonCallback.arePreferenceItemsTheSame((Preference) oldVisibleList.get(oldItemPosition), (Preference) visiblePreferenceList.get(newItemPosition));
                }

                @Override // android.support.v7.util.DiffUtil.Callback
                public boolean areContentsTheSame(int oldItemPosition, int newItemPosition) {
                    return comparisonCallback.arePreferenceContentsTheSame((Preference) oldVisibleList.get(oldItemPosition), (Preference) visiblePreferenceList.get(newItemPosition));
                }
            });
            result.dispatchUpdatesTo(this);
        } else {
            notifyDataSetChanged();
        }
        for (Preference preference3 : fullPreferenceList) {
            preference3.clearWasDetached();
        }
    }

    private void flattenPreferenceGroup(List<Preference> preferences, PreferenceGroup group) {
        group.sortPreferences();
        int groupSize = group.getPreferenceCount();
        for (int i = 0; i < groupSize; i++) {
            Preference preference = group.getPreference(i);
            preferences.add(preference);
            addPreferenceClassName(preference);
            if (preference instanceof PreferenceGroup) {
                PreferenceGroup preferenceAsGroup = (PreferenceGroup) preference;
                if (preferenceAsGroup.isOnSameScreenAsChildren()) {
                    flattenPreferenceGroup(preferences, preferenceAsGroup);
                }
            }
            preference.setOnPreferenceChangeInternalListener(this);
        }
    }

    private PreferenceLayout createPreferenceLayout(Preference preference, PreferenceLayout in) {
        PreferenceLayout pl = in != null ? in : new PreferenceLayout();
        pl.name = preference.getClass().getName();
        pl.resId = preference.getLayoutResource();
        pl.widgetResId = preference.getWidgetLayoutResource();
        return pl;
    }

    private void addPreferenceClassName(Preference preference) {
        PreferenceLayout pl = createPreferenceLayout(preference, null);
        if (!this.mPreferenceLayouts.contains(pl)) {
            this.mPreferenceLayouts.add(pl);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.mPreferenceList.size();
    }

    public Preference getItem(int position) {
        if (position < 0 || position >= getItemCount()) {
            return null;
        }
        return this.mPreferenceList.get(position);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public long getItemId(int position) {
        if (!hasStableIds()) {
            return -1L;
        }
        return getItem(position).getId();
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeInternalListener
    public void onPreferenceChange(Preference preference) {
        int index = this.mPreferenceList.indexOf(preference);
        if (index != -1) {
            notifyItemChanged(index, preference);
        }
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeInternalListener
    public void onPreferenceHierarchyChange(Preference preference) {
        this.mHandler.removeCallbacks(this.mSyncRunnable);
        this.mHandler.post(this.mSyncRunnable);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeInternalListener
    public void onPreferenceVisibilityChange(Preference preference) {
        if (this.mPreferenceListInternal.contains(preference)) {
            if (preference.isVisible()) {
                int previousVisibleIndex = -1;
                for (Preference pref : this.mPreferenceListInternal) {
                    if (preference.equals(pref)) {
                        break;
                    } else if (pref.isVisible()) {
                        previousVisibleIndex++;
                    }
                }
                this.mPreferenceList.add(previousVisibleIndex + 1, preference);
                notifyItemInserted(previousVisibleIndex + 1);
                return;
            }
            int listSize = this.mPreferenceList.size();
            int removalIndex = 0;
            while (removalIndex < listSize && !preference.equals(this.mPreferenceList.get(removalIndex))) {
                removalIndex++;
            }
            this.mPreferenceList.remove(removalIndex);
            notifyItemRemoved(removalIndex);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public int getItemViewType(int position) {
        Preference preference = getItem(position);
        this.mTempPreferenceLayout = createPreferenceLayout(preference, this.mTempPreferenceLayout);
        int viewType = this.mPreferenceLayouts.indexOf(this.mTempPreferenceLayout);
        if (viewType != -1) {
            return viewType;
        }
        int viewType2 = this.mPreferenceLayouts.size();
        this.mPreferenceLayouts.add(new PreferenceLayout(this.mTempPreferenceLayout));
        return viewType2;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.support.v7.widget.RecyclerView.Adapter
    /* renamed from: onCreateViewHolder */
    public PreferenceViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
        PreferenceLayout pl = this.mPreferenceLayouts.get(viewType);
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        TypedArray a = parent.getContext().obtainStyledAttributes((AttributeSet) null, R.styleable.BackgroundStyle);
        Drawable background = a.getDrawable(R.styleable.BackgroundStyle_android_selectableItemBackground);
        if (background == null) {
            background = parent.getContext().getResources().getDrawable(17301602);
        }
        a.recycle();
        View view = inflater.inflate(pl.resId, parent, false);
        if (view.getBackground() == null) {
            ViewCompat.setBackground(view, background);
        }
        ViewGroup widgetFrame = (ViewGroup) view.findViewById(16908312);
        if (widgetFrame != null) {
            if (pl.widgetResId != 0) {
                inflater.inflate(pl.widgetResId, widgetFrame);
            } else {
                widgetFrame.setVisibility(8);
            }
        }
        return new PreferenceViewHolder(view);
    }

    @Override // android.support.v7.widget.RecyclerView.Adapter
    public void onBindViewHolder(PreferenceViewHolder holder, int position) {
        Preference preference = getItem(position);
        preference.onBindViewHolder(holder);
    }

    @Override // android.support.v7.preference.PreferenceGroup.PreferencePositionCallback
    public int getPreferenceAdapterPosition(String key) {
        int size = this.mPreferenceList.size();
        for (int i = 0; i < size; i++) {
            Preference candidate = this.mPreferenceList.get(i);
            if (TextUtils.equals(key, candidate.getKey())) {
                return i;
            }
        }
        return -1;
    }

    @Override // android.support.v7.preference.PreferenceGroup.PreferencePositionCallback
    public int getPreferenceAdapterPosition(Preference preference) {
        int size = this.mPreferenceList.size();
        for (int i = 0; i < size; i++) {
            Preference candidate = this.mPreferenceList.get(i);
            if (candidate != null && candidate.equals(preference)) {
                return i;
            }
        }
        return -1;
    }
}
