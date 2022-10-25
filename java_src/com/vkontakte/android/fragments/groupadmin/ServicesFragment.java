package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.R;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.groups.GroupsEdit;
import com.vkontakte.android.api.groups.GroupsGetSettings;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.ui.CompoundRadioGroup;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.ArrayList;
import me.grishka.appkit.fragments.LoaderFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class ServicesFragment extends LoaderFragment {
    private int id;
    private GroupsGetSettings.Result info;
    private ArrayList<CompoundRadioGroup> radioGroups = new ArrayList<>();
    private int type;
    private static final int[] titles = {R.string.wall, R.string.photos, R.string.videos, R.string.audios, R.string.docs, R.string.board, R.string.wiki};
    private static final int[] options = {R.array.group_wall_options, R.array.group_service_options, R.array.group_service_options, R.array.group_service_options, R.array.group_service_options, R.array.group_service_options, R.array.group_service_options};
    private static final int[] descriptions = {R.array.group_wall_options_descriptions, R.array.group_photos_options_descriptions, R.array.group_videos_options_descriptions, R.array.group_audios_options_descriptions, R.array.group_docs_options_descriptions, R.array.group_board_options_descriptions, R.array.group_wiki_options_descriptions};
    private static final int[] ids = {R.id.item1, R.id.item2, R.id.item3, R.id.item4};

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.id = getArguments().getInt("id");
        this.type = getArguments().getInt(ServerKeys.TYPE);
        loadData();
        setHasOptionsMenu(true);
        setTitle(R.string.group_services);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = super.onCreateView(inflater, container, savedInstanceState);
        updateConfiguration();
        updateDecorator();
        return v;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View content = View.inflate(getActivity(), R.layout.group_admin_services, null);
        LinearLayout cv = (LinearLayout) content.findViewById(R.id.content);
        for (int i = 0; i < options.length; i++) {
            View wrap = View.inflate(getActivity(), R.layout.form_radio_group, null);
            ViewGroup radioGroup = (ViewGroup) wrap.findViewById(R.id.form_field_radiogroup);
            ((TextView) wrap.findViewById(R.id.form_field_title)).setText(titles[i]);
            String[] titles2 = getResources().getStringArray(options[i]);
            String[] subtitles = getResources().getStringArray(descriptions[i]);
            for (int j = 0; j < titles2.length; j++) {
                View item = View.inflate(getActivity(), R.layout.radio_button_item, null);
                ((TextView) item.findViewById(R.id.title)).setText(titles2[j]);
                ((TextView) item.findViewById(R.id.description)).setText(subtitles[j]);
                if (subtitles[j].length() == 0) {
                    item.findViewById(R.id.description).setVisibility(8);
                }
                item.setId(ids[j]);
                radioGroup.addView(item);
            }
            this.radioGroups.add((CompoundRadioGroup) radioGroup);
            cv.addView(wrap);
        }
        return content;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        this.currentRequest = new GroupsGetSettings(this.id).setCallback(new SimpleCallback<GroupsGetSettings.Result>(this) { // from class: com.vkontakte.android.fragments.groupadmin.ServicesFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(GroupsGetSettings.Result result) {
                ServicesFragment.this.info = result;
                ServicesFragment.this.updateInfo();
                ServicesFragment.this.dataLoaded();
                ServicesFragment.this.invalidateOptionsMenu();
            }
        }).exec((Context) getActivity());
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.loaded) {
            MenuItem item = menu.add(R.string.save);
            item.setIcon(R.drawable.ic_check_24dp);
            item.setShowAsAction(2);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        save();
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    private void updateDecorator() {
        ViewGroup vg = (ViewGroup) ((ViewGroup) this.content).getChildAt(0);
        for (int i = 0; i < vg.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = vg.getChildAt(i);
            c.setBackgroundDrawable(bg);
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) c.getLayoutParams();
            lp.topMargin = V.dp(3.0f);
            lp.bottomMargin = V.dp(2.0f);
        }
        int pad = this.scrW >= 924 ? V.dp(32.0f) : 0;
        vg.setPadding(pad, 0, pad, 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!getArguments().getBoolean("_split")) {
            getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateInfo() {
        int[] values = {this.info.wall, this.info.photos, this.info.video, this.info.audio, this.info.docs, this.info.topics, this.info.wiki};
        for (int i = 0; i < values.length; i++) {
            this.radioGroups.get(i).setCheckedId(ids[values[i]]);
        }
    }

    private void save() {
        Bundle params = new Bundle();
        String[] names = {ReportAppInputData.REPORT_TYPE_WALL, "photos", "video", MimeTypes.BASE_TYPE_AUDIO, "docs", "topics", "wiki"};
        for (int i = 0; i < names.length; i++) {
            int checkedID = this.radioGroups.get(i).getCheckedId();
            int value = 0;
            switch (checkedID) {
                case R.id.item1 /* 2131755070 */:
                    value = 0;
                    break;
                case R.id.item2 /* 2131755071 */:
                    value = 1;
                    break;
                case R.id.item3 /* 2131755072 */:
                    value = 2;
                    break;
                case R.id.item4 /* 2131755073 */:
                    value = 3;
                    break;
            }
            params.putInt(names[i], value);
        }
        new GroupsEdit(this.id, params).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.ServicesFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent(Posts.ACTION_RELOAD_PROFILE);
                intent.putExtra("id", -ServicesFragment.this.id);
                ServicesFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                ServicesFragment.this.getActivity().setResult(-1);
                ServicesFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }
}
