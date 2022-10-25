package com.vkontakte.android.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.EmptyView;
/* loaded from: classes2.dex */
public class PlaceholderFragment extends VKFragment {
    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        EmptyView v = EmptyView.create(getActivity());
        v.setButtonVisible(false);
        if (getArguments() != null && getArguments().containsKey("text")) {
            v.setText(getArguments().getString("text"));
        } else {
            v.setText(R.string.tablet_dualpane_placeholder);
        }
        FrameLayout wrap = new FrameLayout(getActivity());
        wrap.addView(v);
        wrap.setBackgroundColor(getResources().getColor(R.color.cards_bg));
        return wrap;
    }
}
