package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.account.AccountGetPrivacySettings;
import com.vkontakte.android.api.account.AccountSetPrivacy;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.PrivacySection;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.commons.PreferenceSummaryHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes2.dex */
public class PrivacySettingsListFragment extends CardRecyclerFragment<RecyclerSectionAdapter.Data> implements View.OnClickListener, RecyclerSectionAdapter.DataDelegate {
    public static final int REQUEST_SETTINGS = 12899;
    private PrivacyAdapter adapter;
    private int idSequence;
    private SparseArray<PrivacySetting> keysId;
    private ArrayList<Friends.Folder> lists;
    private SparseArray<UserProfile> users;

    static /* synthetic */ int access$408(PrivacySettingsListFragment x0) {
        int i = x0.idSequence;
        x0.idSequence = i + 1;
        return i;
    }

    public PrivacySettingsListFragment() {
        super(10);
        this.users = new SparseArray<>();
        this.lists = new ArrayList<>();
        this.keysId = new SparseArray<>();
        this.idSequence = 1;
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.privacy_settings);
        loadData();
        setRefreshEnabled(false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public PrivacyAdapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new PrivacyAdapter(this);
        }
        return this.adapter;
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerSectionAdapter.DataDelegate
    public List<RecyclerSectionAdapter.Data> getData() {
        return this.data;
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (!this.data.isEmpty() && ((RecyclerSectionAdapter.Data) this.data.get(0)).type == 2) {
            if (this.isTablet) {
                this.data.set(0, RecyclerSectionAdapter.Data.top(2, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            } else {
                this.data.set(0, RecyclerSectionAdapter.Data.middle(2, Integer.valueOf((int) R.drawable.card_top_fix_item)));
            }
        }
        updateDecorator();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.PrivacySettingsListFragment$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 extends SimpleCallback<ArrayList<PrivacySection>> {
        AnonymousClass1(Fragment fragment) {
            super(fragment);
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(ArrayList<PrivacySection> result) {
            HashSet<Integer> neededUsers = new HashSet<>();
            Iterator<PrivacySection> it = result.iterator();
            while (it.hasNext()) {
                PrivacySection section = it.next();
                Iterator<PrivacySetting> it2 = section.settings.iterator();
                while (it2.hasNext()) {
                    PrivacySetting setting = it2.next();
                    for (PrivacySetting.PrivacyRule rule : setting.value) {
                        if (rule instanceof PrivacySetting.UserListPrivacyRule) {
                            PrivacySetting.UserListPrivacyRule l = (PrivacySetting.UserListPrivacyRule) rule;
                            for (int i = 0; i < l.userCount(); i++) {
                                int uid = l.userIdAt(i);
                                if (uid < 2000000000) {
                                    neededUsers.add(Integer.valueOf(uid));
                                }
                            }
                        }
                    }
                }
            }
            ArrayList<Integer> uids = new ArrayList<>();
            uids.addAll(neededUsers);
            Friends.getUsers(uids, PrivacySettingsListFragment$1$$Lambda$1.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(ArrayList result, ArrayList r) {
            Iterator it = r.iterator();
            while (it.hasNext()) {
                UserProfile p = (UserProfile) it.next();
                PrivacySettingsListFragment.this.users.append(p.uid, p);
            }
            Friends.getLists(PrivacySettingsListFragment.this.lists);
            Iterator it2 = result.iterator();
            while (it2.hasNext()) {
                PrivacySection section = (PrivacySection) it2.next();
                Iterator<PrivacySetting> it3 = section.settings.iterator();
                while (it3.hasNext()) {
                    PrivacySetting setting = it3.next();
                    setting.displayStringTmp = PrivacySettingsListFragment.this.getSubtitle(setting);
                }
            }
            ViewUtils.runOnUiThread(PrivacySettingsListFragment$1$$Lambda$2.lambdaFactory$(this, result));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$null$0(ArrayList result) {
            ArrayList<RecyclerSectionAdapter.Data> dataList = new ArrayList<>();
            Iterator it = result.iterator();
            while (it.hasNext()) {
                PrivacySection section = (PrivacySection) it.next();
                if (dataList.isEmpty()) {
                    if (PrivacySettingsListFragment.this.isTablet) {
                        dataList.add(RecyclerSectionAdapter.Data.top(2, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
                    } else {
                        dataList.add(RecyclerSectionAdapter.Data.middle(2, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
                    }
                }
                if (dataList.size() == 1) {
                    dataList.add(RecyclerSectionAdapter.Data.middle(0, section.title));
                } else {
                    dataList.add(RecyclerSectionAdapter.Data.top(0, section.title));
                }
                Iterator<PrivacySetting> it2 = section.settings.iterator();
                while (it2.hasNext()) {
                    PrivacySetting setting = it2.next();
                    int id = PrivacySettingsListFragment.access$408(PrivacySettingsListFragment.this);
                    PrivacySettingsListFragment.this.keysId.put(id, setting);
                    PreferenceSummaryHolder.Ref ref = new PreferenceSummaryHolder.Ref(PrivacySettingsListFragment.this, id, setting.title).setSummary(setting.displayStringTmp);
                    dataList.add(RecyclerSectionAdapter.Data.middle(1, ref));
                }
                dataList.add(RecyclerSectionAdapter.Data.bottom(2, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
            }
            PrivacySettingsListFragment.this.onDataLoaded(dataList, false);
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new AccountGetPrivacySettings().setCallback(new AnonymousClass1(this)).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = super.onCreateContentView(inflater, container, savedInstanceState);
        DividerItemDecoration dividers = new DividerItemDecoration(new ColorDrawable(637534208), V.dp(0.5f));
        dividers.setProvider(PrivacySettingsListFragment$$Lambda$1.lambdaFactory$(this));
        this.list.addItemDecoration(dividers);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateContentView$0(int position) {
        return position < this.data.size() + (-1) && ((RecyclerSectionAdapter.Data) this.data.get(position)).type == 1 && ((RecyclerSectionAdapter.Data) this.data.get(position + 1)).type == 1;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        PrivacySetting s = this.keysId.get(v.getId());
        if (s != null) {
            new PrivacyEditFragment.Builder().setSetting(s).forResult(this, REQUEST_SETTINGS);
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        if (requestCode == 12899 && resultCode == -1) {
            PrivacySetting setting = (PrivacySetting) intent.getParcelableExtra("setting");
            if (setting != null) {
                for (PrivacySetting.PrivacyRule rule : setting.value) {
                    if (rule instanceof PrivacySetting.UserListPrivacyRule) {
                        PrivacySetting.UserListPrivacyRule l = (PrivacySetting.UserListPrivacyRule) rule;
                        for (int i = 0; i < l.userCount(); i++) {
                            int uid = l.userIdAt(i);
                            if (uid < 2000000000) {
                                this.users.append(uid, Friends.get(uid));
                            }
                        }
                    }
                }
                Iterator it = this.data.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    RecyclerSectionAdapter.Data data = (RecyclerSectionAdapter.Data) it.next();
                    if ((data.object instanceof PreferenceSummaryHolder.Ref) && setting.title != null && setting.title.equals(((PreferenceSummaryHolder.Ref) data.object).getTitle())) {
                        ((PreferenceSummaryHolder.Ref) data.object).setSummary(getSubtitle(setting));
                        break;
                    }
                }
                int i2 = 0;
                while (true) {
                    if (i2 >= this.keysId.size()) {
                        break;
                    }
                    PrivacySetting privacySetting = this.keysId.get(this.keysId.keyAt(i2));
                    if (!TextUtils.equals(privacySetting.key, setting.key)) {
                        i2++;
                    } else {
                        this.keysId.put(this.keysId.keyAt(i2), setting);
                        break;
                    }
                }
                setting.displayStringTmp = getSubtitle(setting);
                updateList();
                new AccountSetPrivacy(setting.key, setting.getApiValue()).setBackground(true).persist(null, null).exec();
                return;
            }
            return;
        }
        super.onActivityResult(requestCode, resultCode, intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PrivacyAdapter extends RecyclerSectionAdapter {
        static final int TYPE_BOTTOM = 2;
        static final int TYPE_SUMMARY = 1;
        static final int TYPE_TITLE = 0;

        public PrivacyAdapter(RecyclerSectionAdapter.DataDelegate dataDelegate) {
            super(dataDelegate);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return TitleHolder.blueTitle(parent);
                case 1:
                default:
                    return new PreferenceSummaryHolder(parent);
                case 2:
                    return new BackgroundHolder(parent);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public CharSequence getSubtitle(PrivacySetting s) {
        if (PrivacySetting.ALL.apiValue().equals(s.value.get(0).apiValue())) {
            return s.getDisplayString();
        }
        SpannableStringBuilder bldr = new SpannableStringBuilder("");
        Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
        Drawable d = VKApplication.context.getResources().getDrawable(R.drawable.ic_settings_private);
        d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
        sp.setSpan(new ImageSpan(d, 1), 0, 1, 0);
        bldr.append((CharSequence) sp).append((CharSequence) "  ").append((CharSequence) s.getDisplayString());
        return bldr;
    }
}
