package com.vkontakte.android.fragments.friends;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.AccessToken;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.facebook.login.LoginManager;
import com.facebook.login.LoginResult;
import com.google.android.gms.auth.GoogleAuthException;
import com.google.android.gms.auth.GoogleAuthUtil;
import com.google.android.gms.auth.GooglePlayServicesAvailabilityException;
import com.google.android.gms.auth.UserRecoverableAuthException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountLookupContacts;
import com.vkontakte.android.api.external.GmailGetContacts;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.friends.FriendsGetRecommendations;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.VKFromList;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.fragments.SuggestFriendsNearbyFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.fragments.friends.importer.BaseImporter;
import com.vkontakte.android.fragments.search.ExtendedSearchFragment;
import com.vkontakte.android.functions.IntFIntInt;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.utils.L;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsImportFragment extends GridFragment<UserProfile> {
    final Legacy legacy;
    List<BaseImporter> mImportServices;
    String startFrom;

    public FriendsImportFragment() {
        super(20);
        this.legacy = new Legacy();
        this.startFrom = null;
    }

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(FriendsImportFragment.class);
        }

        public Builder fromSignup(boolean fromSignup) {
            this.args.putBoolean("from_signup", fromSignup);
            return this;
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.legacy.onCreated();
        setRefreshEnabled(false);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.find_friends);
        updateItems();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        int padding;
        CardItemDecoration decorator = new CardItemDecoration(mo1066getAdapter(), !this.isTablet).setCardsSpacing(V.dp(16.0f));
        if (this.scrW >= 600) {
            padding = V.dp(12.0f);
        } else {
            padding = V.dp(8.0f);
        }
        int margin = this.scrW >= 924 ? V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2)) : 0;
        this.list.setPadding(margin + padding, V.dp(8.0f), margin + padding, padding);
        decorator.setPadding(padding, 0, padding, V.dp(8.0f));
        return decorator;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<UserProfile>.GridAdapter<?> createAdapter() {
        Adapter adapter = new Adapter();
        setSpanSizeLoockuper(adapter);
        return adapter;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        int columnWidth = V.dp(180.0f);
        return Math.max(listWidth / columnWidth, 2);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (offset == 0) {
            this.startFrom = null;
        }
        new FriendsGetRecommendations(this.startFrom, count).setCallback(new SimpleCallback<VKFromList<UserProfile>>(this) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.1
            {
                FriendsImportFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(VKFromList<UserProfile> result) {
                FriendsImportFragment.this.startFrom = result.from();
                FriendsImportFragment.this.onDataLoaded(result, !TextUtils.isEmpty(FriendsImportFragment.this.startFrom));
            }
        }).exec((Context) getActivity());
    }

    void openProfile(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    void addFriend(final UserProfile user, final int position) {
        FriendsAdd.createFriendsAddAndSendAllStats(user.uid, null).wrapProgress(getActivity()).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.2
            {
                FriendsImportFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                VKApplication.context.sendBroadcast(new Intent(Friends.ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
                FriendsImportFragment.this.data.remove(user);
                FriendsImportFragment.this.mo1066getAdapter().notifyItemRemoved(position);
            }
        }).exec((Context) getActivity());
    }

    void updateItems() {
        BaseImporter contactsImporter = new BaseImporter(R.drawable.ic_import_contacts, R.string.suggest_type_contacts, (!this.legacy.importedContacts || this.data.size() != 0) ? R.string.suggest_type_contacts_desc : R.string.no_contacts_found) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.3
            {
                FriendsImportFragment.this = this;
            }

            @Override // com.vkontakte.android.fragments.friends.importer.BaseImporter
            public void action() {
                FriendsImportFragment.this.legacy.startImportContacts();
            }
        };
        if (this.mImportServices == null) {
            this.mImportServices = new ArrayList(5);
            this.mImportServices.add(contactsImporter);
            this.mImportServices.add(new BaseImporter(R.drawable.ic_import_gmail, R.string.suggest_type_gmail, R.string.suggest_type_gmail_desc) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.4
                {
                    FriendsImportFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.friends.importer.BaseImporter
                public void action() {
                    FriendsImportFragment.this.legacy.startImportGmail();
                }
            });
            this.mImportServices.add(new BaseImporter(R.drawable.ic_import_facebook, R.string.suggest_type_facebook, R.string.suggest_type_facebook_desc) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.5
                {
                    FriendsImportFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.friends.importer.BaseImporter
                public void action() {
                    FriendsImportFragment.this.legacy.startImportFacebook();
                }
            });
            this.mImportServices.add(new BaseImporter(R.drawable.ic_import_search, R.string.suggest_type_ext_search, R.string.suggest_type_ext_search_desc) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.6
                {
                    FriendsImportFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.friends.importer.BaseImporter
                public void action() {
                    FriendsImportFragment.this.legacy.openSearch();
                }
            });
            this.mImportServices.add(new BaseImporter(R.drawable.ic_import_nearby, R.string.suggest_type_nearby, R.string.suggest_type_nearby_desc) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.7
                {
                    FriendsImportFragment.this = this;
                }

                @Override // com.vkontakte.android.fragments.friends.importer.BaseImporter
                public void action() {
                    FriendsImportFragment.this.legacy.openNearby();
                }
            });
        } else {
            this.mImportServices.set(0, contactsImporter);
        }
        updateList();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        this.legacy.onActivityResult(requestCode, resultCode, data);
    }

    /* loaded from: classes2.dex */
    private class Adapter extends GridFragment<UserProfile>.GridAdapter<RecyclerHolder> implements IntFIntInt {
        static final int TYPE_HEADER = 2;
        static final int TYPE_IMPORT = 1;
        static final int TYPE_ITEM = 3;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private Adapter() {
            super();
            FriendsImportFragment.this = r1;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            int importCount = FriendsImportFragment.this.mImportServices == null ? 0 : FriendsImportFragment.this.mImportServices.size();
            if (position == 0 || (position == importCount && !FriendsImportFragment.this.data.isEmpty())) {
                return 26;
            }
            if (position == importCount - 1) {
                return 28;
            }
            if (position <= 0 || position >= importCount - 1) {
                if (FriendsImportFragment.this.data.isEmpty()) {
                    return 0;
                }
                int position2 = (position - importCount) - 1;
                int numColumns = FriendsImportFragment.this.getColumnsCount();
                if (position2 % numColumns == 0) {
                    int result = 0 | 8;
                    return result;
                } else if (position2 % numColumns == numColumns - 1) {
                    int result2 = 0 | 16;
                    return result2;
                } else {
                    int result3 = 0 | 1;
                    return result3;
                }
            }
            return 25;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            int importantSize = FriendsImportFragment.this.mImportServices == null ? 0 : FriendsImportFragment.this.mImportServices.size();
            if (position < importantSize) {
                return 1;
            }
            return position == importantSize ? 2 : 3;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 1:
                    return new ImportHolder(parent);
                case 2:
                    HeaderHolder holder = new HeaderHolder(parent);
                    holder.bind(parent.getContext().getString(R.string.suggest_friends));
                    return holder;
                case 3:
                    return new UserHolder(parent);
                default:
                    return null;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder holder, int position) {
            switch (getItemViewType(position)) {
                case 1:
                    ((ImportHolder) holder).bind(FriendsImportFragment.this.mImportServices.get(position));
                    return;
                case 2:
                default:
                    return;
                case 3:
                    ((UserHolder) holder).bind(FriendsImportFragment.this.data.get(position - FriendsImportFragment.this.mImportServices.size()));
                    return;
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return getItemViewType(position) == 3 ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            if (getItemViewType(position) == 3) {
                return ((UserProfile) FriendsImportFragment.this.data.get(position - FriendsImportFragment.this.mImportServices.size())).photo;
            }
            return null;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (FriendsImportFragment.this.mImportServices == null ? 0 : FriendsImportFragment.this.mImportServices.size()) + super.getItemCount();
        }

        @Override // com.vkontakte.android.functions.IntFIntInt
        public int f(int position, int totalSpans) {
            if (getItemViewType(position) == 3) {
                return 1;
            }
            return totalSpans;
        }
    }

    /* loaded from: classes2.dex */
    public class UserHolder extends com.vkontakte.android.ui.holder.UserHolder<UserProfile> {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        protected UserHolder(ViewGroup parent) {
            super(parent, R.layout.suggested_list_item, true, false, true);
            FriendsImportFragment.this = r7;
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserProfile user) {
            super.onBind((UserHolder) user);
            this.mSubtitle.setText(user.university);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, android.view.View.OnClickListener
        public void onClick(View view) {
            if (view == this.itemView) {
                FriendsImportFragment.this.openProfile((UserProfile) getItem());
            }
            if (view == this.mActionButton) {
                FriendsImportFragment.this.addFriend((UserProfile) getItem(), getAdapterPosition());
            }
        }
    }

    /* loaded from: classes2.dex */
    public class ImportHolder extends RecyclerHolder<BaseImporter> implements View.OnClickListener {
        private final ImageView mIcon;
        private final TextView mSubtitle;
        private final TextView mTitle;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        protected ImportHolder(ViewGroup parent) {
            super((int) R.layout.friend_import_item, parent);
            FriendsImportFragment.this = r2;
            this.mTitle = (TextView) $(R.id.title);
            this.mSubtitle = (TextView) $(R.id.subtitle);
            this.mIcon = (ImageView) $(R.id.icon);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(BaseImporter data) {
            this.mTitle.setText(data.getTitle());
            this.mSubtitle.setText(data.getSubtitle());
            this.mIcon.setImageDrawable(data.getIcon());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (getItem() != null) {
                getItem().action();
            }
        }
    }

    /* loaded from: classes2.dex */
    public class Legacy {
        private static final int FACEBOOK_RESULT = 101;
        public static final int GMAIL_ERROR_RESULT = 103;
        public static final int GPLUS_ERROR_RESULT = 102;
        CallbackManager fbCallbackMgr;
        private int fbReqCode;
        Account gmailAccount;
        private boolean importedContacts;
        ProgressDialog progress;

        private Legacy() {
            FriendsImportFragment.this = r2;
            this.importedContacts = false;
        }

        void onCreated() {
            this.progress = new ProgressDialog(FriendsImportFragment.this.getActivity());
            this.progress.setCancelable(false);
            this.progress.setMessage(FriendsImportFragment.this.getResources().getString(R.string.loading));
            if (FriendsImportFragment.this.getArguments().getBoolean("from_signup") && !this.importedContacts) {
                startImportContacts();
            }
        }

        void openSearch() {
            Bundle args = new Bundle();
            Navigate.to(ExtendedSearchFragment.class, args, FriendsImportFragment.this.getActivity());
        }

        void openNearby() {
            SuggestFriendsNearbyFragment fragment = new SuggestFriendsNearbyFragment();
            fragment.show(FriendsImportFragment.this.getFragmentManager(), "nearby_dlg");
        }

        void onActivityResult(int reqCode, int resCode, Intent data) {
            if (reqCode != 102 || resCode != -1) {
                if (reqCode == 103) {
                    if (resCode == -1) {
                        importGmail(this.gmailAccount);
                    } else {
                        ViewUtils.dismissDialogSafety(this.progress);
                    }
                } else if (this.fbCallbackMgr != null) {
                    this.fbCallbackMgr.onActivityResult(reqCode, resCode, data);
                }
            }
        }

        void startImportContacts() {
            if (FriendsImportFragment.this.getActivity().getSharedPreferences(null, 0).getBoolean("agreed_import_contacts", false) && !FriendsImportFragment.this.getArguments().getBoolean("from_signup")) {
                this.importedContacts = true;
                importContacts();
                return;
            }
            new VKAlertDialog.Builder(FriendsImportFragment.this.getActivity()).setTitle(R.string.confirm).setMessage(R.string.suggest_contacts_confirm).setPositiveButton(R.string.yes, FriendsImportFragment$Legacy$$Lambda$1.lambdaFactory$(this)).setNegativeButton(R.string.no, FriendsImportFragment$Legacy$$Lambda$2.lambdaFactory$(this)).setOnCancelListener(FriendsImportFragment$Legacy$$Lambda$3.lambdaFactory$(this)).show();
        }

        public /* synthetic */ void lambda$startImportContacts$0(DialogInterface dialog, int which) {
            if (FriendsImportFragment.this.getActivity() != null) {
                FriendsImportFragment.this.getActivity().getSharedPreferences(null, 0).edit().putBoolean("agreed_import_contacts", true).commit();
                this.importedContacts = true;
                importContacts();
            }
        }

        public /* synthetic */ void lambda$startImportContacts$1(DialogInterface dialog, int which) {
            FriendsImportFragment.this.updateItems();
        }

        public /* synthetic */ void lambda$startImportContacts$2(DialogInterface dialog) {
            FriendsImportFragment.this.updateItems();
        }

        void importContacts() {
            this.progress.show();
            new Thread(FriendsImportFragment$Legacy$$Lambda$4.lambdaFactory$(this)).start();
        }

        public /* synthetic */ void lambda$importContacts$4() {
            ArrayList<UserProfile> numbers = new ArrayList<>();
            ContentResolver resolver = FriendsImportFragment.this.getActivity().getContentResolver();
            Cursor cursor = null;
            ArrayList<Long> needRawContacts = new ArrayList<>();
            ArrayList<Long> needContacts = new ArrayList<>();
            HashMap<Long, Long> rawToContacts = new HashMap<>();
            HashMap<Long, String> names = new HashMap<>();
            HashMap<Long, String> photos = new HashMap<>();
            try {
                cursor = resolver.query(ContactsContract.Data.CONTENT_URI, new String[]{"data1", "raw_contact_id"}, "mimetype='vnd.android.cursor.item/phone_v2' AND data2=2", null, null);
                if (cursor == null || cursor.getCount() == 0) {
                    Log.w("vk", "cursor2.getCount = 0");
                } else {
                    cursor.moveToFirst();
                    do {
                        String n = cursor.getString(cursor.getColumnIndex("data1"));
                        UserProfile u = new UserProfile();
                        u.extra = new Bundle();
                        u.extra.putString("external_id", n);
                        needRawContacts.add(Long.valueOf(cursor.getLong(1)));
                        numbers.add(u);
                    } while (cursor.moveToNext());
                }
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
            if (cursor != null) {
                cursor.close();
            }
            Cursor cursor2 = null;
            try {
                cursor2 = resolver.query(ContactsContract.RawContacts.CONTENT_URI, new String[]{"_id", "contact_id"}, "_id IN (" + TextUtils.join(",", needRawContacts) + ") AND account_type<>'" + VKAuth.ACCOUNT_TYPE + "'", null, null);
                if (cursor2 == null || cursor2.getCount() == 0) {
                    Log.w("vk", "cursor2.getCount = 0");
                } else {
                    cursor2.moveToFirst();
                    do {
                        rawToContacts.put(Long.valueOf(cursor2.getLong(0)), Long.valueOf(cursor2.getLong(1)));
                        needContacts.add(Long.valueOf(cursor2.getLong(1)));
                    } while (cursor2.moveToNext());
                }
            } catch (Exception x2) {
                L.e(x2, new Object[0]);
            }
            if (cursor2 != null) {
                cursor2.close();
            }
            Cursor cursor3 = null;
            try {
                cursor3 = resolver.query(ContactsContract.Contacts.CONTENT_URI, Build.VERSION.SDK_INT < 11 ? new String[]{"_id", "display_name"} : new String[]{"_id", "display_name", "photo_thumb_uri"}, "_id IN (" + TextUtils.join(",", needContacts) + ")", null, null);
                if (cursor3 == null || cursor3.getCount() == 0) {
                    Log.w("vk", "cursor2.getCount = 0");
                } else {
                    cursor3.moveToFirst();
                    do {
                        names.put(Long.valueOf(cursor3.getLong(0)), cursor3.getString(1));
                        if (cursor3.getColumnCount() > 2 && cursor3.getString(2) != null) {
                            photos.put(Long.valueOf(cursor3.getLong(0)), cursor3.getString(2));
                        }
                    } while (cursor3.moveToNext());
                }
            } catch (Exception x3) {
                L.e(x3, new Object[0]);
            }
            if (cursor3 != null) {
                cursor3.close();
            }
            int i = 0;
            numbers.iterator();
            Iterator<UserProfile> it = numbers.iterator();
            while (it.hasNext()) {
                UserProfile p = it.next();
                Long contactId = rawToContacts.get(needRawContacts.get(i));
                p.fullName = names.get(contactId);
                p.photo = photos.containsKey(contactId) ? photos.get(contactId) : null;
                i++;
            }
            if (numbers.size() == 0) {
                if (FriendsImportFragment.this.getActivity() != null) {
                    ViewUtils.dismissDialogSafety(this.progress);
                    FriendsImportFragment.this.getActivity().runOnUiThread(FriendsImportFragment$Legacy$$Lambda$8.lambdaFactory$(this));
                    return;
                }
                return;
            }
            doImport(numbers, null, SignupPhoneFragment.KEY_PHONE);
        }

        public /* synthetic */ void lambda$null$3() {
            new AlertDialog.Builder(FriendsImportFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_contacts_to_import).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            FriendsImportFragment.this.updateItems();
        }

        void doImport(List<UserProfile> usrs, String myId, String service) {
            ArrayList<String> ids = new ArrayList<>();
            for (UserProfile u : usrs) {
                ids.add(u.extra.getString("external_id"));
            }
            new AccountLookupContacts(ids, service, myId).setCallback(new AnonymousClass1(FriendsImportFragment.this, usrs, service)).exec((Context) FriendsImportFragment.this.getActivity());
        }

        /* renamed from: com.vkontakte.android.fragments.friends.FriendsImportFragment$Legacy$1 */
        /* loaded from: classes2.dex */
        public class AnonymousClass1 extends SimpleCallback<AccountLookupContacts.Result> {
            final /* synthetic */ String val$service;
            final /* synthetic */ List val$usrs;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            AnonymousClass1(Fragment fragment, List list, String str) {
                super(fragment);
                Legacy.this = this$1;
                this.val$usrs = list;
                this.val$service = str;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(AccountLookupContacts.Result r) {
                Comparator comparator;
                for (int i = 0; i < r.other.size(); i++) {
                    String id = r.other.get(i).extra.getString("external_id");
                    Iterator it = this.val$usrs.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            UserProfile p = (UserProfile) it.next();
                            if (id.equals(p.extra)) {
                                r.other.set(i, p);
                                break;
                            }
                        }
                    }
                }
                ViewUtils.dismissDialogSafety(Legacy.this.progress);
                int srv = -1;
                String title = "";
                if (SignupPhoneFragment.KEY_PHONE.equals(this.val$service)) {
                    srv = 0;
                    title = FriendsImportFragment.this.getString(R.string.suggest_type_contacts);
                } else if ("google".equals(this.val$service)) {
                    srv = 1;
                    title = FriendsImportFragment.this.getString(R.string.suggest_type_google);
                } else if ("facebook".equals(this.val$service)) {
                    srv = 2;
                    title = FriendsImportFragment.this.getString(R.string.suggest_type_facebook);
                } else if ("email".equals(this.val$service)) {
                    srv = 3;
                    title = FriendsImportFragment.this.getString(R.string.suggest_type_gmail);
                }
                ArrayList<UserProfile> notFound = new ArrayList<>();
                ArrayList<String> foundExternalIDs = new ArrayList<>();
                Iterator<UserProfile> it2 = r.found.iterator();
                while (it2.hasNext()) {
                    foundExternalIDs.add(it2.next().extra.getString("external_id"));
                }
                for (UserProfile p2 : this.val$usrs) {
                    if (!foundExternalIDs.contains(p2.extra.getString("external_id"))) {
                        notFound.add(p2);
                    }
                }
                Iterator<UserProfile> it3 = notFound.iterator();
                while (it3.hasNext()) {
                    UserProfile p3 = it3.next();
                    if (p3.fullName == null) {
                        p3.fullName = p3.extra.getString("external_id");
                    }
                }
                comparator = FriendsImportFragment$Legacy$1$$Lambda$1.instance;
                Collections.sort(notFound, comparator);
                Friends.saveImportedContacts(srv, r.found, notFound);
                if (SignupPhoneFragment.KEY_PHONE.equals(this.val$service) && FriendsImportFragment.this.getArguments().getBoolean("from_signup")) {
                    FriendsImportFragment.this.data.clear();
                    Iterator<UserProfile> it4 = r.found.iterator();
                    while (it4.hasNext()) {
                        UserProfile user = it4.next();
                        if (!user.isFriend) {
                            FriendsImportFragment.this.data.add(user);
                        }
                    }
                    Iterator<UserProfile> it5 = r.found.iterator();
                    while (it5.hasNext()) {
                        UserProfile user2 = it5.next();
                        if (user2.isFriend) {
                            FriendsImportFragment.this.data.add(user2);
                        }
                    }
                    FriendsImportFragment.this.updateList();
                    Legacy.this.importedContacts = true;
                    FriendsImportFragment.this.updateItems();
                } else if (r.found.size() == 0 && r.other.size() == 0 && srv != 0 && srv != 3) {
                    Toast.makeText(FriendsImportFragment.this.getActivity(), (int) R.string.nothing_found, 0).show();
                } else {
                    Bundle args = new Bundle();
                    args.putInt("service", srv);
                    args.putString("title", title);
                    Navigate.to(SuggestionsImportedFragment.class, args, FriendsImportFragment.this.getActivity());
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                ViewUtils.dismissDialogSafety(Legacy.this.progress);
                super.fail(error);
                if (SignupPhoneFragment.KEY_PHONE.equals(this.val$service)) {
                    Legacy.this.importedContacts = false;
                }
                FriendsImportFragment.this.updateItems();
            }
        }

        void startImportGoogle() {
        }

        void importGoogle() {
        }

        void startImportGmail() {
            Account[] accs = AccountManager.get(FriendsImportFragment.this.getActivity()).getAccountsByType("com.google");
            if (accs.length == 0) {
                new AlertDialog.Builder(FriendsImportFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_google_accounts).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            } else if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(FriendsImportFragment.this.getActivity()) != 0) {
                FriendsImportFragment.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=com.google.android.gms")));
            } else if (accs.length == 1) {
                this.progress.show();
                importGmail(accs[0]);
            } else {
                ArrayList<String> items = new ArrayList<>();
                for (Account acc : accs) {
                    items.add(acc.name);
                }
                new AlertDialog.Builder(FriendsImportFragment.this.getActivity()).setTitle(R.string.import_gmail_select_account).setItems((CharSequence[]) items.toArray(new String[0]), FriendsImportFragment$Legacy$$Lambda$5.lambdaFactory$(this, accs)).show();
            }
        }

        public /* synthetic */ void lambda$startImportGmail$5(Account[] accs, DialogInterface dialog, int which) {
            this.progress.show();
            importGmail(accs[which]);
        }

        /* renamed from: com.vkontakte.android.fragments.friends.FriendsImportFragment$Legacy$2 */
        /* loaded from: classes2.dex */
        public class AnonymousClass2 implements Runnable {
            final /* synthetic */ Account val$acc;

            AnonymousClass2(Account account) {
                Legacy.this = this$1;
                this.val$acc = account;
            }

            @Override // java.lang.Runnable
            public void run() {
                String token = null;
                try {
                    token = GoogleAuthUtil.getToken(FriendsImportFragment.this.getActivity(), this.val$acc.name, "oauth2:https://www.google.com/m8/feeds", new Bundle());
                } catch (GooglePlayServicesAvailabilityException e) {
                } catch (UserRecoverableAuthException recoverableException) {
                    Log.w("vk", recoverableException);
                    Intent recoveryIntent = recoverableException.getIntent();
                    FriendsImportFragment.this.startActivityForResult(recoveryIntent, 103);
                } catch (GoogleAuthException authEx) {
                    Log.e("vk", "Unrecoverable authentication exception: " + authEx.getMessage(), authEx);
                    if (FriendsImportFragment.this.getActivity() != null) {
                        FriendsImportFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.Legacy.2.1
                            {
                                AnonymousClass2.this = this;
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                Toast.makeText(FriendsImportFragment.this.getActivity(), (int) R.string.error, 0).show();
                            }
                        });
                    }
                    ViewUtils.dismissDialogSafety(Legacy.this.progress);
                    return;
                } catch (IOException ioEx) {
                    Log.i("vk", "transient error encountered: " + ioEx.getMessage());
                    if (FriendsImportFragment.this.getActivity() != null) {
                        FriendsImportFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.Legacy.2.2
                            {
                                AnonymousClass2.this = this;
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                Toast.makeText(FriendsImportFragment.this.getActivity(), (int) R.string.err_text, 0).show();
                            }
                        });
                    }
                    ViewUtils.dismissDialogSafety(Legacy.this.progress);
                    return;
                }
                if (token != null) {
                    new GmailGetContacts(token, this.val$acc.name).setCallback(new SimpleCallback<List<UserProfile>>(FriendsImportFragment.this.getActivity()) { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.Legacy.2.3
                        {
                            AnonymousClass2.this = this;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void success(List<UserProfile> users) {
                            if (users.size() == 0) {
                                if (FriendsImportFragment.this.getActivity() != null) {
                                    ViewUtils.dismissDialogSafety(Legacy.this.progress);
                                    FriendsImportFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.Legacy.2.3.1
                                        {
                                            AnonymousClass3.this = this;
                                        }

                                        @Override // java.lang.Runnable
                                        public void run() {
                                            new AlertDialog.Builder(FriendsImportFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_gmail_to_import).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                                            FriendsImportFragment.this.updateItems();
                                        }
                                    });
                                    return;
                                }
                                return;
                            }
                            Legacy.this.doImport(users, AnonymousClass2.this.val$acc.name, "email");
                        }

                        @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse err) {
                            Log.w("vk", "error " + err);
                            ViewUtils.dismissDialogSafety(Legacy.this.progress);
                            Toast.makeText(FriendsImportFragment.this.getActivity(), (int) R.string.error, 0).show();
                        }
                    }).exec((Context) FriendsImportFragment.this.getActivity());
                }
            }
        }

        void importGmail(Account acc) {
            this.gmailAccount = acc;
            new Thread(new AnonymousClass2(acc)).start();
        }

        void startImportFacebook() {
            if (!FacebookSdk.isInitialized()) {
                FacebookSdk.sdkInitialize(FriendsImportFragment.this.getActivity().getApplicationContext());
            }
            LoginManager.getInstance().logOut();
            this.fbCallbackMgr = CallbackManager.Factory.create();
            LoginManager.getInstance().registerCallback(this.fbCallbackMgr, new FacebookCallback<LoginResult>() { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.Legacy.3
                {
                    Legacy.this = this;
                }

                @Override // com.facebook.FacebookCallback
                public void onSuccess(LoginResult loginResult) {
                    Legacy.this.fbCallbackMgr = null;
                    if (loginResult.getAccessToken() != null) {
                        Legacy.this.importFacebook(loginResult.getAccessToken());
                    }
                }

                @Override // com.facebook.FacebookCallback
                public void onCancel() {
                    Legacy.this.fbCallbackMgr = null;
                }

                @Override // com.facebook.FacebookCallback
                public void onError(FacebookException e) {
                    Legacy.this.fbCallbackMgr = null;
                    Toast.makeText(FriendsImportFragment.this.getActivity(), (int) R.string.error, 1).show();
                }
            });
            Activity act = new Activity() { // from class: com.vkontakte.android.fragments.friends.FriendsImportFragment.Legacy.4
                {
                    Legacy.this = this;
                }

                @Override // android.app.Activity
                public void startActivityForResult(Intent intent, int code) {
                    Legacy.this.fbReqCode = code;
                    FriendsImportFragment.this.startActivityForResult(intent, code);
                }

                @Override // android.content.ContextWrapper, android.content.Context
                public PackageManager getPackageManager() {
                    return FriendsImportFragment.this.getActivity().getPackageManager();
                }

                @Override // android.content.ContextWrapper, android.content.Context
                public String getPackageName() {
                    return FriendsImportFragment.this.getActivity().getPackageName();
                }

                @Override // android.content.ContextWrapper, android.content.Context
                public Context getApplicationContext() {
                    return FriendsImportFragment.this.getActivity().getApplicationContext();
                }
            };
            LoginManager.getInstance().logInWithReadPermissions(act, Arrays.asList("email", "user_birthday"));
        }

        void importFacebook(AccessToken session) {
            this.progress.show();
            GraphRequest.newMyFriendsRequest(session, FriendsImportFragment$Legacy$$Lambda$6.lambdaFactory$(this, session)).executeAsync();
        }

        public /* synthetic */ void lambda$importFacebook$7(AccessToken session, JSONArray users, GraphResponse response) {
            if (response.getError() != null) {
                Activity activity = FriendsImportFragment.this.getActivity();
                if (activity != null) {
                    ViewUtils.dismissDialogSafety(this.progress);
                    Toast.makeText(activity, (int) R.string.error, 0).show();
                }
            } else if (users.length() == 0) {
                if (FriendsImportFragment.this.getActivity() != null) {
                    ViewUtils.dismissDialogSafety(this.progress);
                    FriendsImportFragment.this.getActivity().runOnUiThread(FriendsImportFragment$Legacy$$Lambda$7.lambdaFactory$(this));
                }
            } else {
                ArrayList<UserProfile> friends = new ArrayList<>();
                for (int i = 0; i < users.length(); i++) {
                    try {
                        JSONObject user = users.getJSONObject(i);
                        UserProfile p = new UserProfile();
                        p.extra = new Bundle();
                        p.extra.putString("external_id", user.getString("id"));
                        p.fullName = user.getString("name");
                        int photoSize = Global.scale(60.0f);
                        p.photo = "https://graph.facebook.com/" + p.extra.getString("external_id") + "/picture?width=" + photoSize + "&height=" + photoSize;
                        friends.add(p);
                    } catch (JSONException e) {
                    }
                }
                doImport(friends, session.getUserId(), "facebook");
            }
        }

        public /* synthetic */ void lambda$null$6() {
            new AlertDialog.Builder(FriendsImportFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_facebook_to_import).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
            FriendsImportFragment.this.updateItems();
        }
    }
}
