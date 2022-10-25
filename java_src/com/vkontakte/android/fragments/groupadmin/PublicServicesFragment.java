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
import android.widget.CheckBox;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.R;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.groups.GroupsEdit;
import com.vkontakte.android.api.groups.GroupsGetSettings;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.Arrays;
import java.util.List;
import me.grishka.appkit.fragments.LoaderFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class PublicServicesFragment extends LoaderFragment {
    private static final int[] IDS = {R.id.group_service_wall, R.id.group_service_links, R.id.group_service_photos, R.id.group_service_videos, R.id.group_service_audios, R.id.group_service_board, R.id.group_service_events, R.id.group_service_places, R.id.group_service_contacts};
    private List<String> fields = Arrays.asList(ReportAppInputData.REPORT_TYPE_WALL, "links", "photos", "video", MimeTypes.BASE_TYPE_AUDIO, "topics", "events", "places", "contacts");
    private int id;
    private GroupsGetSettings.Result info;
    private int type;
    private View view;

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
        this.content.setScrollBarStyle(33554432);
        updateConfiguration();
        updateDecorator();
        return v;
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

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.view = View.inflate(getActivity(), R.layout.group_admin_services_public, null);
        return this.view;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        this.currentRequest = new GroupsGetSettings(this.id).setCallback(new SimpleCallback<GroupsGetSettings.Result>(this) { // from class: com.vkontakte.android.fragments.groupadmin.PublicServicesFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(GroupsGetSettings.Result result) {
                PublicServicesFragment.this.info = result;
                PublicServicesFragment.this.updateInfo();
                PublicServicesFragment.this.dataLoaded();
                PublicServicesFragment.this.invalidateOptionsMenu();
            }
        }).exec((Context) getActivity());
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
        boolean z = true;
        if (this.view != null) {
            boolean[] values = new boolean[9];
            values[0] = this.info.wall == 1;
            values[1] = this.info.links == 1;
            values[2] = this.info.photos == 1;
            values[3] = this.info.video == 1;
            values[4] = this.info.audio == 1;
            values[5] = this.info.topics == 1;
            values[6] = this.info.events == 1;
            values[7] = this.info.places == 1;
            if (this.info.contacts != 1) {
                z = false;
            }
            values[8] = z;
            for (int i = 0; i < this.fields.size(); i++) {
                CheckBox check = (CheckBox) this.view.findViewById(IDS[i]);
                check.setChecked(values[i]);
            }
        }
    }

    private void save() {
        Bundle params = new Bundle();
        for (int i = 0; i < this.fields.size(); i++) {
            CheckBox check = (CheckBox) this.view.findViewById(IDS[i]);
            params.putInt(this.fields.get(i), check.isChecked() ? 1 : 0);
        }
        new GroupsEdit(this.id, params).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.PublicServicesFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent(Posts.ACTION_RELOAD_PROFILE);
                intent.putExtra("id", -PublicServicesFragment.this.id);
                PublicServicesFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                PublicServicesFragment.this.getActivity().setResult(-1);
                PublicServicesFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }
}
