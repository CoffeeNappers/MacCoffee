package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v7.preference.Preference;
import android.support.v7.preference.PreferenceCategory;
import android.support.v7.preference.PreferenceGroupAdapter;
import android.support.v7.preference.PreferenceScreen;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.core.util.Screen;
import com.vkontakte.android.fragments.preference.PreferenceFragmentCompat;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.MaterialSectionDividerPreference;
import com.vkontakte.android.ui.adapters.RecyclerWrapperAdapter;
import com.vkontakte.android.ui.util.HightlightHelper;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes2.dex */
public class MaterialPreferenceFragment extends PreferenceFragmentCompat {
    public static final String HIGHLIGHT_PREFERENCE_KEY = "pref_to_highlight";
    private CardItemDecorator decorator;
    protected boolean isTablet;
    protected int scrW;
    protected Adapter wrapperAdapter = null;
    private String preferenceKeyToHighlight = "";
    private int positionToHighlight = -1;
    private boolean highlighted = false;

    @Override // android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        updateConfiguration();
    }

    protected void updateConfiguration() {
        this.scrW = getResources().getConfiguration().screenWidthDp;
        this.isTablet = Screen.isTablet(getActivity());
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.preferenceKeyToHighlight = getArguments().getString(HIGHLIGHT_PREFERENCE_KEY, this.preferenceKeyToHighlight);
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mList.setScrollBarStyle(33554432);
        updateDecorator();
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat
    protected void bindPreferences() {
        super.bindPreferences();
        updateDecorator();
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat
    protected void onBindPreferences() {
        super.onBindPreferences();
        if (this.positionToHighlight >= 0) {
            this.mList.postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.MaterialPreferenceFragment.1
                @Override // java.lang.Runnable
                public void run() {
                    MaterialPreferenceFragment.this.mList.getLayoutManager().smoothScrollToPosition(MaterialPreferenceFragment.this.mList, null, MaterialPreferenceFragment.this.positionToHighlight);
                }
            }, 500L);
        }
    }

    private void updateDecorator() {
        if (this.mList.mo1204getAdapter() instanceof CardItemDecorator.Provider) {
            this.mList.removeItemDecoration(this.decorator);
            RecyclerView recyclerView = this.mList;
            CardItemDecorator onCreateCardDecorator = onCreateCardDecorator();
            this.decorator = onCreateCardDecorator;
            recyclerView.addItemDecoration(onCreateCardDecorator);
        }
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.decorator = null;
    }

    protected CardItemDecorator onCreateCardDecorator() {
        boolean z = true;
        boolean isTabletDecorator = this.scrW >= 924;
        RecyclerView recyclerView = this.mList;
        if (isTabletDecorator) {
            z = false;
        }
        CardItemDecorator decorator = new CardItemDecorator(recyclerView, z);
        decorator.setPadding(V.dp(2.0f), V.dp(3.0f), V.dp(8.0f), 0);
        int pad = isTabletDecorator ? V.dp(Math.max(16, (this.scrW - 924) / 2)) : 0;
        this.mList.setPadding(pad, 0, pad, 0);
        return decorator;
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat
    public RecyclerView onCreateRecyclerView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        RecyclerView recyclerView = super.onCreateRecyclerView(inflater, parent, savedInstanceState);
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        dividers.setProvider(MaterialPreferenceFragment$$Lambda$1.lambdaFactory$(this));
        recyclerView.addItemDecoration(dividers);
        return recyclerView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateRecyclerView$0(int position) {
        Preference item = this.wrapperAdapter.getItem(position);
        Preference itemNext = this.wrapperAdapter.getItem(position + 1);
        return !(item instanceof PreferenceCategory) && !(itemNext instanceof PreferenceCategory) && !(itemNext instanceof MaterialSectionDividerPreference);
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat
    public void onCreatePreferences(Bundle bundle, String s) {
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat
    public RecyclerView.LayoutManager onCreateLayoutManager() {
        return new CenterLayoutManager(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Adapter extends RecyclerWrapperAdapter implements CardItemDecorator.Provider {
        public Adapter(RecyclerView.Adapter wrappedAdapter) {
            super(wrappedAdapter);
            findPositionToHighlight();
        }

        private void findPositionToHighlight() {
            if (MaterialPreferenceFragment.this.preferenceKeyToHighlight != null && !MaterialPreferenceFragment.this.preferenceKeyToHighlight.isEmpty()) {
                for (int i = 0; i < this.wrappedAdapter.getItemCount(); i++) {
                    Preference p = ((PreferenceGroupAdapter) this.wrappedAdapter).getItem(i);
                    if (MaterialPreferenceFragment.this.preferenceKeyToHighlight.equals(p.getKey())) {
                        MaterialPreferenceFragment.this.positionToHighlight = i;
                        return;
                    }
                }
            }
        }

        @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
        public int getBlockType(int position) {
            Preference item = getItem(position);
            Preference itemNext = getItem(position + 1);
            if (position != 0 || !MaterialPreferenceFragment.this.isTablet) {
                if (position == 0) {
                    return 1;
                }
                if (item instanceof PreferenceCategory) {
                    return 2;
                }
                return ((itemNext instanceof PreferenceCategory) || itemNext == null) ? 4 : 1;
            }
            return 2;
        }

        public Preference getItem(int position) {
            if (position >= getItemCount() || position < 0) {
                return null;
            }
            return ((PreferenceGroupAdapter) this.wrappedAdapter).getItem(position);
        }

        @Override // com.vkontakte.android.ui.adapters.RecyclerWrapperAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
            super.onBindViewHolder(holder, position);
            View itemView = holder.itemView;
            if (position == MaterialPreferenceFragment.this.positionToHighlight && !MaterialPreferenceFragment.this.highlighted) {
                HightlightHelper.highlight(itemView);
                MaterialPreferenceFragment.this.highlighted = true;
            }
        }
    }

    @Override // com.vkontakte.android.fragments.preference.PreferenceFragmentCompat
    protected RecyclerView.Adapter onCreateAdapter(PreferenceScreen preferenceScreen) {
        Adapter adapter = new Adapter(super.onCreateAdapter(preferenceScreen));
        this.wrapperAdapter = adapter;
        return adapter;
    }

    /* loaded from: classes2.dex */
    public static class CenterLayoutManager extends LinearLayoutManager {
        public CenterLayoutManager(Context context) {
            super(context);
        }

        public CenterLayoutManager(Context context, int orientation, boolean reverseLayout) {
            super(context, orientation, reverseLayout);
        }

        public CenterLayoutManager(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            super(context, attrs, defStyleAttr, defStyleRes);
        }

        @Override // android.support.v7.widget.LinearLayoutManager, android.support.v7.widget.RecyclerView.LayoutManager
        public void smoothScrollToPosition(RecyclerView recyclerView, RecyclerView.State state, int position) {
            RecyclerView.SmoothScroller smoothScroller = new CenterSmoothScroller(recyclerView.getContext());
            smoothScroller.setTargetPosition(position);
            startSmoothScroll(smoothScroller);
        }

        /* loaded from: classes2.dex */
        private static class CenterSmoothScroller extends LinearSmoothScroller {
            CenterSmoothScroller(Context context) {
                super(context);
            }

            @Override // android.support.v7.widget.LinearSmoothScroller
            public int calculateDtToFit(int viewStart, int viewEnd, int boxStart, int boxEnd, int snapPreference) {
                return (((boxEnd - boxStart) / 2) + boxStart) - (((viewEnd - viewStart) / 2) + viewStart);
            }
        }
    }
}
