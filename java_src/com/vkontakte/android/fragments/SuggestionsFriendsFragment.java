package com.vkontakte.android.fragments;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.AlertDialog;
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
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
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
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.SuggestionsActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountLookupContacts;
import com.vkontakte.android.api.external.GmailGetContacts;
import com.vkontakte.android.api.friends.FriendsGetRecommendations;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.friends.SuggestionsImportedFragment;
import com.vkontakte.android.fragments.search.ExtendedSearchFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.Fonts;
import com.vkontakte.android.ui.MergeAdapter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.preloading.PrefetchInfoProvider;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@Deprecated
/* loaded from: classes.dex */
public class SuggestionsFriendsFragment extends SuggestionsFragment {
    private static final int FACEBOOK_RESULT = 101;
    public static final int GMAIL_ERROR_RESULT = 103;
    public static final int GPLUS_ERROR_RESULT = 102;
    private VKAPIRequest currentReq;
    private CallbackManager fbCallbackMgr;
    private int fbReqCode;
    private Account gmailAccount;
    private ProgressDialog progress;
    private boolean importedContacts = false;
    private ArrayList<Item> importItems = new ArrayList<>();

    /* JADX INFO: Access modifiers changed from: private */
    public void updateItems() {
        this.importItems.clear();
        Item item = new Item();
        item.titleRes = R.string.suggest_type_contacts;
        item.descRes = (!this.importedContacts || this.users.size() != 0) ? R.string.suggest_type_contacts_desc : R.string.no_contacts_found;
        item.imgRes = R.drawable.ic_registration_contacts;
        item.type = 0;
        this.importItems.add(item);
        Item item2 = new Item();
        item2.titleRes = R.string.suggest_type_gmail;
        item2.descRes = R.string.suggest_type_gmail_desc;
        item2.imgRes = R.drawable.ic_registration_gmail;
        item2.type = 3;
        this.importItems.add(item2);
        Item item3 = new Item();
        item3.titleRes = R.string.suggest_type_facebook;
        item3.descRes = R.string.suggest_type_facebook_desc;
        item3.imgRes = R.drawable.ic_registration_facebook;
        item3.type = 2;
        this.importItems.add(item3);
        Item item4 = new Item();
        item4.titleRes = R.string.suggest_type_ext_search;
        item4.descRes = R.string.suggest_type_ext_search_desc;
        item4.imgRes = R.drawable.ic_registration_search;
        item4.type = 4;
        this.importItems.add(item4);
        Item item5 = new Item();
        item5.titleRes = R.string.suggest_type_nearby;
        item5.descRes = R.string.suggest_type_nearby_desc;
        item5.imgRes = R.drawable.ic_registration_nearby;
        item5.type = 5;
        this.importItems.add(item5);
        updateList();
    }

    @Override // android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        this.progress = new ProgressDialog(act);
        this.progress.setCancelable(false);
        this.progress.setMessage(getResources().getString(R.string.loading));
        if (!(getActivity() instanceof SuggestionsActivity)) {
            getActivity().setTitle(R.string.find_friends);
        }
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        if (getArguments().getBoolean("from_signup") && !this.importedContacts) {
            startImportContacts();
        }
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected void loadData() {
        if (!getArguments().getBoolean("from_signup")) {
            this.currentReq = new FriendsGetRecommendations(null, 40).setCallback(new Callback<ArrayList<UserProfile>>() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(ArrayList<UserProfile> _users) {
                    SuggestionsFriendsFragment.this.currentReq = null;
                    SuggestionsFriendsFragment.this.users.clear();
                    SuggestionsFriendsFragment.this.users.addAll(_users);
                    SuggestionsFriendsFragment.this.updateItems();
                    SuggestionsFriendsFragment.this.updateList();
                    ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    SuggestionsFriendsFragment.this.currentReq = null;
                    if (SuggestionsFriendsFragment.this.getActivity() != null) {
                        ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                        SuggestionsFriendsFragment.this.onError(error.getCode(), error.message);
                    }
                }
            }).exec((Context) getActivity());
        }
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.currentReq != null) {
            this.currentReq.cancel();
            this.currentReq = null;
        }
        if (!getArguments().getBoolean("from_signup")) {
            Friends.reload(true);
        }
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = super.onCreateView(inflater, container, savedInstanceState);
        if (getArguments().getBoolean("from_signup")) {
            updateList();
        }
        return v;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    public BaseAdapter getAdapter() {
        MergeAdapter m = new MergeAdapter();
        if (!getArguments().getBoolean("from_signup")) {
            m.addAdapter(new ImportTypesAdapter());
        }
        m.addAdapter(new TitleItemAdapter());
        m.addAdapter(super.getAdapter());
        if (getArguments().getBoolean("from_signup")) {
            m.addAdapter(new ImportTypesAdapter());
        }
        return m;
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected void onItemClick(int pos, long id, Object item) {
        if (id > 2000000000) {
            int svc = (int) (id - 2000000000);
            switch (svc) {
                case 1:
                    startImportContacts();
                    return;
                case 2:
                    startImportGoogle();
                    return;
                case 3:
                    startImportFacebook();
                    return;
                case 4:
                    startImportGmail();
                    return;
                case 5:
                    openSearch();
                    return;
                case 6:
                    openNearby();
                    return;
                default:
                    return;
            }
        }
        new ProfileFragment.Builder((int) id).go(getActivity());
    }

    private void openSearch() {
        Bundle args = new Bundle();
        Navigate.to(ExtendedSearchFragment.class, args, getActivity());
    }

    private void openNearby() {
        SuggestFriendsNearbyFragment fragment = new SuggestFriendsNearbyFragment();
        fragment.show(getFragmentManager(), "nearby_dlg");
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected String getListTitle() {
        return null;
    }

    private void startImportContacts() {
        if (getActivity().getSharedPreferences(null, 0).getBoolean("agreed_import_contacts", false) && !getArguments().getBoolean("from_signup")) {
            this.importedContacts = true;
            importContacts();
            return;
        }
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.suggest_contacts_confirm).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (SuggestionsFriendsFragment.this.getActivity() != null) {
                    SuggestionsFriendsFragment.this.getActivity().getSharedPreferences(null, 0).edit().putBoolean("agreed_import_contacts", true).commit();
                    SuggestionsFriendsFragment.this.importedContacts = true;
                    SuggestionsFriendsFragment.this.importContacts();
                }
            }
        }).setNegativeButton(R.string.no, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                SuggestionsFriendsFragment.this.updateItems();
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.2
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                SuggestionsFriendsFragment.this.updateItems();
            }
        }).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void importContacts() {
        this.progress.show();
        new Thread(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.5
            @Override // java.lang.Runnable
            public void run() {
                ArrayList<UserProfile> numbers = new ArrayList<>();
                ContentResolver resolver = SuggestionsFriendsFragment.this.getActivity().getContentResolver();
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
                } catch (Exception e) {
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
                } catch (Exception e2) {
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
                } catch (Exception e3) {
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
                if (numbers.size() != 0) {
                    SuggestionsFriendsFragment.this.doImport(numbers, null, SignupPhoneFragment.KEY_PHONE);
                } else if (SuggestionsFriendsFragment.this.getActivity() != null) {
                    ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                    SuggestionsFriendsFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.5.1
                        @Override // java.lang.Runnable
                        public void run() {
                            new AlertDialog.Builder(SuggestionsFriendsFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_contacts_to_import).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                            SuggestionsFriendsFragment.this.updateItems();
                        }
                    });
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doImport(final List<UserProfile> usrs, String myId, final String service) {
        ArrayList<String> ids = new ArrayList<>();
        for (UserProfile u : usrs) {
            ids.add(u.extra.getString("external_id"));
        }
        new AccountLookupContacts(ids, service, myId).setCallback(new SimpleCallback<AccountLookupContacts.Result>(this) { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.6
            @Override // com.vkontakte.android.api.Callback
            public void success(AccountLookupContacts.Result r) {
                for (int i = 0; i < r.other.size(); i++) {
                    String id = r.other.get(i).extra.getString("external_id");
                    Iterator it = usrs.iterator();
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
                ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                int srv = -1;
                String title = "";
                if (SignupPhoneFragment.KEY_PHONE.equals(service)) {
                    srv = 0;
                    title = SuggestionsFriendsFragment.this.getString(R.string.suggest_type_contacts);
                } else if ("google".equals(service)) {
                    srv = 1;
                    title = SuggestionsFriendsFragment.this.getString(R.string.suggest_type_google);
                } else if ("facebook".equals(service)) {
                    srv = 2;
                    title = SuggestionsFriendsFragment.this.getString(R.string.suggest_type_facebook);
                } else if ("email".equals(service)) {
                    srv = 3;
                    title = SuggestionsFriendsFragment.this.getString(R.string.suggest_type_gmail);
                }
                ArrayList<UserProfile> notFound = new ArrayList<>();
                ArrayList<String> foundExternalIDs = new ArrayList<>();
                Iterator<UserProfile> it2 = r.found.iterator();
                while (it2.hasNext()) {
                    foundExternalIDs.add(it2.next().extra.getString("external_id"));
                }
                for (UserProfile p2 : usrs) {
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
                Collections.sort(notFound, new Comparator<UserProfile>() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.6.1
                    @Override // java.util.Comparator
                    public int compare(UserProfile userProfile, UserProfile userProfile2) {
                        return userProfile.fullName.compareToIgnoreCase(userProfile2.fullName);
                    }
                });
                Friends.saveImportedContacts(srv, r.found, notFound);
                if (SignupPhoneFragment.KEY_PHONE.equals(service) && SuggestionsFriendsFragment.this.getArguments().getBoolean("from_signup")) {
                    SuggestionsFriendsFragment.this.users.clear();
                    Iterator<UserProfile> it4 = r.found.iterator();
                    while (it4.hasNext()) {
                        UserProfile user = it4.next();
                        if (!user.isFriend) {
                            SuggestionsFriendsFragment.this.users.add(user);
                        }
                    }
                    Iterator<UserProfile> it5 = r.found.iterator();
                    while (it5.hasNext()) {
                        UserProfile user2 = it5.next();
                        if (user2.isFriend) {
                            SuggestionsFriendsFragment.this.users.add(user2);
                        }
                    }
                    SuggestionsFriendsFragment.this.updateList();
                    SuggestionsFriendsFragment.this.importedContacts = true;
                    SuggestionsFriendsFragment.this.updateItems();
                } else if (r.found.size() == 0 && r.other.size() == 0 && srv != 0 && srv != 3) {
                    Toast.makeText(SuggestionsFriendsFragment.this.getActivity(), (int) R.string.nothing_found, 0).show();
                } else {
                    Bundle args = new Bundle();
                    args.putInt("service", srv);
                    args.putString("title", title);
                    Navigate.to(SuggestionsImportedFragment.class, args, SuggestionsFriendsFragment.this.getActivity());
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                super.fail(error);
                if (SignupPhoneFragment.KEY_PHONE.equals(service)) {
                    SuggestionsFriendsFragment.this.importedContacts = false;
                }
                SuggestionsFriendsFragment.this.updateItems();
            }
        }).exec((Context) getActivity());
    }

    private void startImportGoogle() {
    }

    private void importGoogle() {
    }

    private void startImportGmail() {
        final Account[] accs = AccountManager.get(getActivity()).getAccountsByType("com.google");
        if (accs.length == 0) {
            new AlertDialog.Builder(getActivity()).setTitle(R.string.error).setMessage(R.string.no_google_accounts).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
        } else if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(getActivity()) != 0) {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=com.google.android.gms")));
        } else if (accs.length == 1) {
            this.progress.show();
            importGmail(accs[0]);
        } else {
            ArrayList<String> items = new ArrayList<>();
            for (Account acc : accs) {
                items.add(acc.name);
            }
            new AlertDialog.Builder(getActivity()).setTitle(R.string.import_gmail_select_account).setItems((CharSequence[]) items.toArray(new String[0]), new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.7
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    SuggestionsFriendsFragment.this.progress.show();
                    SuggestionsFriendsFragment.this.importGmail(accs[which]);
                }
            }).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.SuggestionsFriendsFragment$8  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass8 implements Runnable {
        final /* synthetic */ Account val$acc;

        AnonymousClass8(Account account) {
            this.val$acc = account;
        }

        @Override // java.lang.Runnable
        public void run() {
            String token = null;
            try {
                token = GoogleAuthUtil.getToken(SuggestionsFriendsFragment.this.getActivity(), this.val$acc.name, "oauth2:https://www.google.com/m8/feeds", new Bundle());
            } catch (GooglePlayServicesAvailabilityException e) {
            } catch (UserRecoverableAuthException recoverableException) {
                Log.w("vk", recoverableException);
                Intent recoveryIntent = recoverableException.getIntent();
                SuggestionsFriendsFragment.this.startActivityForResult(recoveryIntent, 103);
            } catch (GoogleAuthException authEx) {
                Log.e("vk", "Unrecoverable authentication exception: " + authEx.getMessage(), authEx);
                if (SuggestionsFriendsFragment.this.getActivity() != null) {
                    SuggestionsFriendsFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.8.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(SuggestionsFriendsFragment.this.getActivity(), (int) R.string.error, 0).show();
                        }
                    });
                }
                ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                return;
            } catch (IOException ioEx) {
                Log.i("vk", "transient error encountered: " + ioEx.getMessage());
                if (SuggestionsFriendsFragment.this.getActivity() != null) {
                    SuggestionsFriendsFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.8.2
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(SuggestionsFriendsFragment.this.getActivity(), (int) R.string.err_text, 0).show();
                        }
                    });
                }
                ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                return;
            }
            if (token != null) {
                new GmailGetContacts(token, this.val$acc.name).setCallback(new SimpleCallback<List<UserProfile>>(SuggestionsFriendsFragment.this.getActivity()) { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.8.3
                    @Override // com.vkontakte.android.api.Callback
                    public void success(List<UserProfile> users) {
                        if (users.size() != 0) {
                            SuggestionsFriendsFragment.this.doImport(users, AnonymousClass8.this.val$acc.name, "email");
                        } else if (SuggestionsFriendsFragment.this.getActivity() != null) {
                            ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                            SuggestionsFriendsFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.8.3.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    new AlertDialog.Builder(SuggestionsFriendsFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_gmail_to_import).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                                    SuggestionsFriendsFragment.this.updateItems();
                                }
                            });
                        }
                    }

                    @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse err) {
                        Log.w("vk", "error " + err);
                        ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                        Toast.makeText(SuggestionsFriendsFragment.this.getActivity(), (int) R.string.error, 0).show();
                    }
                }).exec((Context) SuggestionsFriendsFragment.this.getActivity());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void importGmail(Account acc) {
        this.gmailAccount = acc;
        new Thread(new AnonymousClass8(acc)).start();
    }

    private void startImportFacebook() {
        if (!FacebookSdk.isInitialized()) {
            FacebookSdk.sdkInitialize(getActivity().getApplicationContext());
        }
        LoginManager.getInstance().logOut();
        this.fbCallbackMgr = CallbackManager.Factory.create();
        LoginManager.getInstance().registerCallback(this.fbCallbackMgr, new FacebookCallback<LoginResult>() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.9
            @Override // com.facebook.FacebookCallback
            public void onSuccess(LoginResult loginResult) {
                SuggestionsFriendsFragment.this.fbCallbackMgr = null;
                if (loginResult.getAccessToken() != null) {
                    SuggestionsFriendsFragment.this.importFacebook(loginResult.getAccessToken());
                }
            }

            @Override // com.facebook.FacebookCallback
            public void onCancel() {
                SuggestionsFriendsFragment.this.fbCallbackMgr = null;
            }

            @Override // com.facebook.FacebookCallback
            public void onError(FacebookException e) {
                SuggestionsFriendsFragment.this.fbCallbackMgr = null;
                Toast.makeText(SuggestionsFriendsFragment.this.getActivity(), (int) R.string.error, 1).show();
            }
        });
        Activity act = new Activity() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.10
            @Override // android.app.Activity
            public void startActivityForResult(Intent intent, int code) {
                SuggestionsFriendsFragment.this.fbReqCode = code;
                SuggestionsFriendsFragment.this.startActivityForResult(intent, code);
            }

            @Override // android.content.ContextWrapper, android.content.Context
            public PackageManager getPackageManager() {
                return SuggestionsFriendsFragment.this.getActivity().getPackageManager();
            }

            @Override // android.content.ContextWrapper, android.content.Context
            public String getPackageName() {
                return SuggestionsFriendsFragment.this.getActivity().getPackageName();
            }

            @Override // android.content.ContextWrapper, android.content.Context
            public Context getApplicationContext() {
                return SuggestionsFriendsFragment.this.getActivity().getApplicationContext();
            }
        };
        LoginManager.getInstance().logInWithReadPermissions(act, Arrays.asList("email", "user_birthday"));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void importFacebook(final AccessToken session) {
        this.progress.show();
        GraphRequest.newMyFriendsRequest(session, new GraphRequest.GraphJSONArrayCallback() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.11
            @Override // com.facebook.GraphRequest.GraphJSONArrayCallback
            public void onCompleted(JSONArray users, GraphResponse response) {
                if (response.getError() != null) {
                    if (SuggestionsFriendsFragment.this.getActivity() != null) {
                        ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                    }
                    Toast.makeText(SuggestionsFriendsFragment.this.getActivity(), (int) R.string.error, 0).show();
                } else if (users.length() == 0) {
                    if (SuggestionsFriendsFragment.this.getActivity() != null) {
                        ViewUtils.dismissDialogSafety(SuggestionsFriendsFragment.this.progress);
                        SuggestionsFriendsFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestionsFriendsFragment.11.1
                            @Override // java.lang.Runnable
                            public void run() {
                                new AlertDialog.Builder(SuggestionsFriendsFragment.this.getActivity()).setTitle(R.string.error).setMessage(R.string.no_facebook_to_import).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                                SuggestionsFriendsFragment.this.updateItems();
                            }
                        });
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
                    SuggestionsFriendsFragment.this.doImport(friends, session.getUserId(), "facebook");
                }
            }
        }).executeAsync();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
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

    /* loaded from: classes2.dex */
    private class ImportTypesAdapter extends BaseAdapter {
        private ImportTypesAdapter() {
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return SuggestionsFriendsFragment.this.importItems.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return null;
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return ((Item) SuggestionsFriendsFragment.this.importItems.get(position)).type + NewsEntry.OWNER_ID_NOTIFICATION;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (view == null) {
                view = View.inflate(SuggestionsFriendsFragment.this.getActivity(), R.layout.suggest_list_item, null);
                ((TextView) view.findViewById(R.id.flist_item_subtext)).setTypeface(Fonts.getRobotoLight());
                view.findViewById(R.id.flist_item_online).setVisibility(8);
            }
            if (position != 0) {
                if (position == SuggestionsFriendsFragment.this.importItems.size() - 1) {
                    view.setBackgroundResource(R.drawable.bg_post_comments_btm);
                } else {
                    view.setBackgroundResource(R.drawable.bg_post_comments_mid);
                }
            } else {
                view.setBackgroundResource(R.drawable.bg_post_comments_top);
            }
            Item item = (Item) SuggestionsFriendsFragment.this.importItems.get(position);
            ((TextView) view.findViewById(R.id.flist_item_text)).setText(item.titleRes);
            ((TextView) view.findViewById(R.id.flist_item_subtext)).setText(item.descRes);
            ((ImageView) view.findViewById(R.id.flist_item_photo)).setImageResource(item.imgRes);
            return view;
        }
    }

    /* loaded from: classes2.dex */
    private class ImportTypesImageAdapter implements PrefetchInfoProvider {
        private ImportTypesImageAdapter() {
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getItemCount() {
            return SuggestionsFriendsFragment.this.importItems.size();
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return 0;
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return null;
        }
    }

    /* loaded from: classes2.dex */
    private class TitleItemAdapter extends BaseAdapter {
        private TitleItemAdapter() {
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return (SuggestionsFriendsFragment.this.users.size() <= 0 || SuggestionsFriendsFragment.this.getArguments().getBoolean("from_signup")) ? 0 : 1;
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return null;
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return 0L;
        }

        @Override // android.widget.BaseAdapter, android.widget.ListAdapter
        public boolean areAllItemsEnabled() {
            return false;
        }

        @Override // android.widget.BaseAdapter, android.widget.ListAdapter
        public boolean isEnabled(int item) {
            return false;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                TextView txt = (TextView) View.inflate(SuggestionsFriendsFragment.this.getActivity(), R.layout.list_cards_section_header, null);
                txt.setText(SuggestionsFriendsFragment.this.getString(R.string.suggest_friends).toUpperCase());
                return txt;
            }
            return convertView;
        }
    }

    /* loaded from: classes2.dex */
    private class TitleItemImageLoaderAdapter implements PrefetchInfoProvider {
        private TitleItemImageLoaderAdapter() {
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getItemCount() {
            return (SuggestionsFriendsFragment.this.users.size() <= 0 || SuggestionsFriendsFragment.this.getArguments().getBoolean("from_signup")) ? 0 : 1;
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return 0;
        }

        @Override // me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Item {
        int descRes;
        int imgRes;
        int titleRes;
        int type;

        private Item() {
        }
    }
}
