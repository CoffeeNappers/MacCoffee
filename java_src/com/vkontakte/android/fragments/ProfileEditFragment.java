package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.DatePicker;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.attachpicker.AttachIntent;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.Relation;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountGetProfileInfo;
import com.vkontakte.android.api.account.AccountSaveProfileInfo;
import com.vkontakte.android.api.photos.PhotosDeleteAvatar;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.database.City;
import com.vkontakte.android.data.database.Country;
import com.vkontakte.android.fragments.CitySelectFragment;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.adapters.RelationAdapter;
import com.vkontakte.android.ui.cardview.CardDrawable;
import com.vkontakte.android.upload.ProfilePhotoUploadTask;
import com.vkontakte.android.upload.Upload;
import io.reactivex.annotations.SchedulerSupport;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class ProfileEditFragment extends me.grishka.appkit.fragments.LoaderFragment {
    private static final int AVA_RESULT = 3901;
    private static final int RELATION_PARTNER_RESULT = 101;
    private Spinner bdateVisSpinner;
    private int bday;
    private int bmonth;
    private int byear;
    private int cityID;
    private TextView citySelector;
    private ArrayAdapter<Country> countryAdapter;
    private Spinner countrySpinner;
    private Bundle currentInfo;
    private View form;
    private int gender;
    private boolean ignoreCountryChange = false;
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (Posts.ACTION_USER_PHOTO_CHANGED.equals(intent.getAction()) && intent.getIntExtra("id", 0) == VKAccountManager.getCurrent().getUid()) {
                ProfileEditFragment.this.setUserPhoto(intent.getStringExtra("photo"));
            }
        }
    };
    private RelationAdapter relationAdapter;
    private UserProfile relationPartner;
    private Spinner relationSpinner;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        VKApplication.context.registerReceiver(this.receiver, new IntentFilter(Posts.ACTION_USER_PHOTO_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        VKApplication.context.unregisterReceiver(this.receiver);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity a) {
        super.onAttach(a);
        setTitle(R.string.edit_profile);
        setHasOptionsMenu(true);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.form = inflater.inflate(R.layout.profile_edit, (ViewGroup) null);
        this.bdateVisSpinner = (Spinner) this.form.findViewById(R.id.edit_bdate_visibility);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(getActivity(), R.array.edit_bdate_visibility, R.layout.card_spinner_item);
        adapter.setDropDownViewResource(17367049);
        this.bdateVisSpinner.setAdapter((SpinnerAdapter) adapter);
        this.relationSpinner = (Spinner) this.form.findViewById(R.id.edit_relation);
        this.countrySpinner = (Spinner) this.form.findViewById(R.id.edit_country);
        this.countryAdapter = new ArrayAdapter<Country>(getActivity(), R.layout.card_spinner_item) { // from class: com.vkontakte.android.fragments.ProfileEditFragment.2
            @Override // android.widget.ArrayAdapter, android.widget.BaseAdapter, android.widget.SpinnerAdapter
            public View getDropDownView(int position, View convertView, ViewGroup parent) {
                View v = super.getDropDownView(position, convertView, parent);
                if (v instanceof TextView) {
                    ((TextView) v).setTypeface(getItem(position).important ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
                }
                return v;
            }
        };
        this.countryAdapter.setDropDownViewResource(17367049);
        List<Country> cc = Country.getCountries(true, true, null);
        for (Country c : cc) {
            this.countryAdapter.add(c);
        }
        this.countrySpinner.setAdapter((SpinnerAdapter) this.countryAdapter);
        this.countrySpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.3
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> arg0, View arg1, int pos, long arg3) {
                boolean z = false;
                if (ProfileEditFragment.this.ignoreCountryChange) {
                    ProfileEditFragment.this.ignoreCountryChange = false;
                    return;
                }
                ProfileEditFragment.this.cityID = 0;
                Country c2 = (Country) ProfileEditFragment.this.countryAdapter.getItem(pos);
                ProfileEditFragment.this.citySelector.setText("");
                TextView textView = ProfileEditFragment.this.citySelector;
                if (c2.id > 0) {
                    z = true;
                }
                textView.setEnabled(z);
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> arg0) {
            }
        });
        this.citySelector = (TextView) this.form.findViewById(R.id.edit_city);
        this.citySelector.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ProfileEditFragment.this.selectCity();
            }
        });
        this.form.findViewById(R.id.edit_bdate_chooser).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ProfileEditFragment.this.selectBirthDate();
            }
        });
        ((RadioGroup) this.form.findViewById(R.id.gender_radio_group)).setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.6
            @Override // android.widget.RadioGroup.OnCheckedChangeListener
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                ProfileEditFragment.this.gender = checkedId == R.id.signup_gender_female ? 1 : 2;
                ProfileEditFragment.this.updateRelationOptions();
            }
        });
        this.relationSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.7
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> arg0, View arg1, int pos, long arg3) {
                int i = 0;
                boolean show = Relation.getRelationsById(arg3).partner;
                ProfileEditFragment.this.form.findViewById(R.id.edit_relation_divider).setVisibility(show ? 0 : 8);
                View findViewById = ProfileEditFragment.this.form.findViewById(R.id.edit_relation_partner);
                if (!show) {
                    i = 8;
                }
                findViewById.setVisibility(i);
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> arg0) {
            }
        });
        this.form.findViewById(R.id.edit_relation_partner_remove).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.8
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ProfileEditFragment.this.setRelationPartner(null);
            }
        });
        this.form.findViewById(R.id.edit_relation_partner).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.9
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Bundle args = new Bundle();
                args.putBoolean(ArgKeys.SELECT, true);
                args.putBoolean("relation", true);
                args.putBoolean("no_online", true);
                args.putInt("my_gender", ProfileEditFragment.this.gender);
                args.putBoolean("show_same_gender", Relation.getRelationsById(ProfileEditFragment.this.relationSpinner.getSelectedItemId()).sameGender);
                new Navigator(FriendsFragment.class, args).forResult(ProfileEditFragment.this, 101);
            }
        });
        this.form.findViewById(R.id.info_cancel_btn).setOnClickListener(ProfileEditFragment$$Lambda$1.lambdaFactory$(this));
        setUserPhoto(VKAccountManager.getCurrent().getPhoto());
        this.form.setScrollBarStyle(33554432);
        updateConfiguration();
        updateDecorator();
        return this.form;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateContentView$0(View v) {
        cancelNameRequest();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    private void updateDecorator() {
        ViewGroup vg = (ViewGroup) this.form.findViewById(R.id.scrollable_content);
        for (int i = 0; i < vg.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = vg.getChildAt(i);
            c.setBackgroundDrawable(bg);
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) c.getLayoutParams();
            lp.topMargin = V.dp(3.0f);
            lp.bottomMargin = V.dp(2.0f);
        }
        int pad = this.scrW >= 924 ? V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2)) : 0;
        this.form.setPadding(pad, 0, pad, 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void selectCity() {
        CitySelectFragment fragment = new CitySelectFragment();
        Bundle args = new Bundle();
        args.putString("hint", getString(R.string.edit_choose_city));
        args.putInt("country", ((Country) this.countrySpinner.getSelectedItem()).id);
        args.putBoolean("show_none", this.cityID > 0);
        fragment.setArguments(args);
        fragment.setCallback(new CitySelectFragment.CityCallback() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.10
            @Override // com.vkontakte.android.fragments.DatabaseSearchFragment.Callback
            public void onItemSelected(City item) {
                ProfileEditFragment.this.cityID = item.id;
                if (ProfileEditFragment.this.cityID > 0) {
                    ProfileEditFragment.this.citySelector.setText(item.title);
                } else {
                    ProfileEditFragment.this.citySelector.setText("");
                }
            }
        });
        fragment.show(getFragmentManager(), "city");
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        MenuItem item = menu.add(R.string.save);
        item.setIcon(R.drawable.ic_check_24dp);
        item.setShowAsAction(2);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        save();
        return true;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent intent) {
        if (reqCode == 101 && resCode == -1) {
            UserProfile p = (UserProfile) intent.getParcelableExtra(ProfileGiftsFragment.Extra.User);
            setRelationPartner(p);
        }
        if (reqCode == AVA_RESULT && resCode == -1) {
            float cropLeft = intent.getFloatExtra("cropLeft", 0.0f);
            float cropTop = intent.getFloatExtra("cropTop", 0.0f);
            float cropRight = intent.getFloatExtra("cropRight", 0.0f);
            float cropBottom = intent.getFloatExtra("cropBottom", 0.0f);
            Upload.start(getActivity(), new ProfilePhotoUploadTask(getActivity(), intent.getStringExtra(UriUtil.LOCAL_FILE_SCHEME), VKAccountManager.getCurrent().getUid(), true, cropLeft, cropTop, cropRight, cropBottom));
        }
        if (reqCode == AVA_RESULT && resCode == 1) {
            int idx = intent.getIntExtra("option", 0);
            if (idx == 0) {
                new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.delete_photo_confirm).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.11
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        ProfileEditFragment.this.deletePhoto();
                    }
                }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
            }
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateRelationOptions() {
        boolean z = true;
        Relation relation = (Relation) this.relationSpinner.getSelectedItem();
        if (this.gender == 1) {
            z = false;
        }
        this.relationAdapter = new RelationAdapter(z, getActivity(), R.layout.card_spinner_item, Relation.values());
        this.relationAdapter.setDropDownViewResource(17367049);
        this.relationSpinner.setAdapter((SpinnerAdapter) this.relationAdapter);
        if (relation != null) {
            this.relationSpinner.setSelection(relation.ordinal());
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        this.currentRequest = new AccountGetProfileInfo().setCallback(new SimpleCallback<Bundle>(this) { // from class: com.vkontakte.android.fragments.ProfileEditFragment.12
            @Override // com.vkontakte.android.api.Callback
            public void success(Bundle info) {
                ProfileEditFragment.this.currentInfo = info;
                ((TextView) ProfileEditFragment.this.form.findViewById(R.id.edit_first_name)).setText(info.getString("first_name"));
                ((TextView) ProfileEditFragment.this.form.findViewById(R.id.edit_last_name)).setText(info.getString("last_name"));
                ProfileEditFragment.this.gender = info.getInt("gender");
                ((RadioButton) ProfileEditFragment.this.form.findViewById(R.id.signup_gender_male)).setChecked(ProfileEditFragment.this.gender == 2);
                ((RadioButton) ProfileEditFragment.this.form.findViewById(R.id.signup_gender_female)).setChecked(ProfileEditFragment.this.gender == 1);
                ProfileEditFragment.this.updateRelationOptions();
                ProfileEditFragment.this.bday = info.getInt("bday");
                ProfileEditFragment.this.bmonth = info.getInt("bmonth");
                ProfileEditFragment.this.byear = info.getInt("byear");
                if (ProfileEditFragment.this.bday <= 0 || ProfileEditFragment.this.bday >= 32 || ProfileEditFragment.this.bmonth <= 0 || ProfileEditFragment.this.bmonth >= 13) {
                    ((TextView) ProfileEditFragment.this.form.findViewById(R.id.edit_bdate_chooser)).setText(R.string.not_specified);
                } else {
                    String date = ProfileEditFragment.this.bday + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileEditFragment.this.getResources().getStringArray(R.array.months_full)[ProfileEditFragment.this.bmonth - 1];
                    if (ProfileEditFragment.this.byear > 0) {
                        date = date + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileEditFragment.this.byear;
                    }
                    ((TextView) ProfileEditFragment.this.form.findViewById(R.id.edit_bdate_chooser)).setText(date);
                }
                switch (info.getInt("bdate_vis")) {
                    case 0:
                        ProfileEditFragment.this.bdateVisSpinner.setSelection(2);
                        break;
                    case 1:
                        ProfileEditFragment.this.bdateVisSpinner.setSelection(0);
                        break;
                    case 2:
                        ProfileEditFragment.this.bdateVisSpinner.setSelection(1);
                        break;
                }
                ProfileEditFragment.this.relationSpinner.setSelection(Math.min(Relation.getRelationsById(info.getInt("relation")).ordinal(), ProfileEditFragment.this.relationAdapter.getCount() - 1));
                if (info.containsKey("relation_partner")) {
                    UserProfile u = (UserProfile) info.getParcelable("relation_partner");
                    ProfileEditFragment.this.setRelationPartner(u);
                } else {
                    boolean show = Relation.getRelationsById(info.getInt("relation")).partner;
                    ProfileEditFragment.this.form.findViewById(R.id.edit_relation_divider).setVisibility(show ? 0 : 8);
                    ProfileEditFragment.this.form.findViewById(R.id.edit_relation_partner).setVisibility(show ? 0 : 8);
                    ProfileEditFragment.this.setRelationPartner(null);
                }
                ProfileEditFragment.this.ignoreCountryChange = true;
                int countryID = info.getInt("country_id");
                boolean found = false;
                int i = 0;
                while (true) {
                    if (i < ProfileEditFragment.this.countryAdapter.getCount()) {
                        if (((Country) ProfileEditFragment.this.countryAdapter.getItem(i)).id != countryID) {
                            i++;
                        } else {
                            found = true;
                            ProfileEditFragment.this.countrySpinner.setSelection(i);
                        }
                    }
                }
                if (!found) {
                    Country c = new Country();
                    c.id = countryID;
                    c.name = info.getString("country_name");
                    ProfileEditFragment.this.countryAdapter.add(c);
                    ProfileEditFragment.this.countrySpinner.setSelection(ProfileEditFragment.this.countryAdapter.getCount() - 1);
                }
                ProfileEditFragment.this.citySelector.setEnabled(countryID > 0);
                if (info.getInt("city_id") > 0) {
                    ProfileEditFragment.this.citySelector.setText(info.getString("city_name"));
                    ProfileEditFragment.this.cityID = info.getInt("city_id");
                }
                if (!info.containsKey("name_req_status")) {
                    ProfileEditFragment.this.form.findViewById(R.id.edit_info_box).setVisibility(8);
                } else {
                    int status = info.getInt("name_req_status");
                    if (status == 1) {
                        ((TextView) ProfileEditFragment.this.form.findViewById(R.id.info_new_name)).setText(info.getString("name_req_name"));
                        ((TextView) ProfileEditFragment.this.form.findViewById(R.id.info_message)).setText(R.string.edit_name_req_processing);
                        ProfileEditFragment.this.form.findViewById(R.id.info_cancel_btn).setVisibility(status == 1 ? 0 : 8);
                    } else {
                        ((TextView) ProfileEditFragment.this.form.findViewById(R.id.info_message)).setText(Html.fromHtml(ProfileEditFragment.this.getString(R.string.edit_name_declined)));
                        ProfileEditFragment.this.form.findViewById(R.id.info_cancel_btn).setVisibility(8);
                        ProfileEditFragment.this.form.findViewById(R.id.info_new_name).setVisibility(8);
                    }
                }
                ProfileEditFragment.this.invalidateOptionsMenu();
                ProfileEditFragment.this.dataLoaded();
            }
        }).exec((Context) getActivity());
    }

    private void cancelNameRequest() {
        new AccountSaveProfileInfo(this.currentInfo.getInt("name_req_id")).setCallback(new SimpleCallback<AccountSaveProfileInfo.Result>(this) { // from class: com.vkontakte.android.fragments.ProfileEditFragment.13
            @Override // com.vkontakte.android.api.Callback
            public void success(AccountSaveProfileInfo.Result res) {
                Toast.makeText(ProfileEditFragment.this.getActivity(), (int) R.string.name_request_canceled, 1).show();
                ProfileEditFragment.this.form.findViewById(R.id.edit_info_box).setVisibility(8);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setRelationPartner(UserProfile p) {
        this.relationPartner = p;
        if (p != null) {
            ((TextView) this.form.findViewById(R.id.edit_relation_partner_name)).setText(p.fullName);
            this.form.findViewById(R.id.edit_relation_partner_remove).setVisibility(0);
            ((VKImageView) this.form.findViewById(R.id.edit_relation_partner_photo)).load(this.relationPartner.photo);
            return;
        }
        ((TextView) this.form.findViewById(R.id.edit_relation_partner_name)).setText(R.string.edit_relation_partner);
        ((VKImageView) this.form.findViewById(R.id.edit_relation_partner_photo)).clear();
        this.form.findViewById(R.id.edit_relation_partner_remove).setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void selectBirthDate() {
        int i = 1;
        Activity activity = getActivity();
        DatePickerDialog.OnDateSetListener onDateSetListener = new DatePickerDialog.OnDateSetListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.14
            @Override // android.app.DatePickerDialog.OnDateSetListener
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                ProfileEditFragment.this.byear = Math.min(Calendar.getInstance().get(1) - 14, Math.max((int) AccountGetProfileInfo.MIN_BDATE_YEAR, year));
                ProfileEditFragment.this.bmonth = monthOfYear + 1;
                ProfileEditFragment.this.bday = dayOfMonth;
                String date = ProfileEditFragment.this.bday + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileEditFragment.this.getResources().getStringArray(R.array.months_full)[ProfileEditFragment.this.bmonth - 1];
                if (ProfileEditFragment.this.byear > 0) {
                    date = date + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + ProfileEditFragment.this.byear;
                }
                ((TextView) ProfileEditFragment.this.form.findViewById(R.id.edit_bdate_chooser)).setText(date);
            }
        };
        int i2 = this.byear >= 1901 ? this.byear : Calendar.getInstance().get(1) - 14;
        int i3 = this.bmonth > 0 ? this.bmonth - 1 : 1;
        if (this.bday > 0) {
            i = this.bday;
        }
        DatePickerDialog dpd = new DatePickerDialog(activity, onDateSetListener, i2, i3, i);
        dpd.show();
    }

    private void save() {
        final Bundle newInfo = new Bundle();
        String firstName = ((TextView) this.form.findViewById(R.id.edit_first_name)).getText().toString();
        String lastName = ((TextView) this.form.findViewById(R.id.edit_last_name)).getText().toString();
        if (firstName.length() < 2 || lastName.length() < 2) {
            Toast.makeText(getActivity(), (int) R.string.signup_invalid_name, 0).show();
            return;
        }
        if (!firstName.equals(this.currentInfo.getString("first_name")) || !lastName.equals(this.currentInfo.getString("last_name"))) {
            newInfo.putString("first_name", firstName);
            newInfo.putString("last_name", lastName);
        }
        if (this.gender != this.currentInfo.getInt("gender")) {
            newInfo.putInt("gender", this.gender);
        }
        Relation relation = (Relation) this.relationSpinner.getSelectedItem();
        if (relation.id != this.currentInfo.getInt("relation")) {
            newInfo.putInt("relation", relation.id);
        }
        UserProfile relPartner = (UserProfile) this.currentInfo.getParcelable("relation_partner");
        int newRelPartnerId = relPartner != null ? relPartner.uid : 0;
        int relPartnerId = this.relationPartner != null ? this.relationPartner.uid : 0;
        if (relPartnerId != newRelPartnerId) {
            newInfo.putParcelable("relation_partner", this.relationPartner);
        }
        if (this.bday != this.currentInfo.getInt("bday") || this.bmonth != this.currentInfo.getInt("bmonth") || this.byear != this.currentInfo.getInt("byear")) {
            newInfo.putInt("bday", this.bday);
            newInfo.putInt("bmonth", this.bmonth);
            newInfo.putInt("byear", this.byear);
        }
        int bdateVis = -1;
        switch (this.bdateVisSpinner.getSelectedItemPosition()) {
            case 0:
                bdateVis = 1;
                break;
            case 1:
                bdateVis = 2;
                break;
            case 2:
                bdateVis = 0;
                break;
        }
        if (bdateVis != this.currentInfo.getInt("bdate_vis")) {
            newInfo.putInt("bdate_vis", bdateVis);
        }
        int country = ((Country) this.countrySpinner.getSelectedItem()).id;
        if (country != this.currentInfo.getInt("country_id")) {
            newInfo.putInt("country_id", country);
        }
        if (this.cityID != this.currentInfo.getInt("city_id")) {
            newInfo.putInt("city_id", this.cityID);
        }
        if (newInfo.size() == 0) {
            Log.d("vk", "Nothing to save.");
            getActivity().finish();
            return;
        }
        new AccountSaveProfileInfo(newInfo).setCallback(new SimpleCallback<AccountSaveProfileInfo.Result>(this) { // from class: com.vkontakte.android.fragments.ProfileEditFragment.15
            @Override // com.vkontakte.android.api.Callback
            public void success(AccountSaveProfileInfo.Result res) {
                if (res.nameStatus == 0) {
                    if (newInfo.containsKey("first_name") || newInfo.containsKey("last_name")) {
                        Intent intent = new Intent(Posts.ACTION_USER_NAME_CHANGED);
                        intent.putExtra("name", res.newFirst + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + res.newLast);
                        ProfileEditFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                    }
                    ProfileEditFragment.this.getActivity().setResult(-1);
                    ProfileEditFragment.this.getActivity().finish();
                    return;
                }
                if (res.nameStatus == 1) {
                    ProfileEditFragment.this.showNameInfoDialog(ProfileEditFragment.this.getString(R.string.edit_name_processing), true);
                }
                if (res.nameStatus == 2) {
                    ProfileEditFragment.this.showNameInfoDialog(ProfileEditFragment.this.getString(R.string.edit_name_declined), false);
                }
                if (res.nameStatus == 3) {
                    ProfileEditFragment.this.showNameInfoDialog(ProfileEditFragment.this.getString(R.string.edit_name_was_accepted, new Object[]{TimeUtils.langDate(res.nameRetryIn)}), false);
                }
                if (res.nameStatus == 4) {
                    ProfileEditFragment.this.showNameInfoDialog(ProfileEditFragment.this.getString(R.string.edit_name_was_declined, new Object[]{TimeUtils.langDate(res.nameRetryIn)}), false);
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (error.getCodeValue() == 100) {
                    new VKAlertDialog.Builder(ProfileEditFragment.this.getActivity()).setMessage(ProfileEditFragment.this.getString(R.string.signup_invalid_name)).setTitle(R.string.error).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                } else {
                    super.fail(error);
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showNameInfoDialog(String text, final boolean finish) {
        AlertDialog dlg = new VKAlertDialog.Builder(getActivity()).setTitle(R.string.edit_name_dialog_title).setMessage(Html.fromHtml(text)).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
        dlg.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.16
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialog) {
                if (finish) {
                    ProfileEditFragment.this.getActivity().setResult(-1);
                    ProfileEditFragment.this.getActivity().finish();
                }
            }
        });
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    public void showUpdatePhotoDlg(boolean havePhotos) {
        Intent intent = new Intent(getActivity(), ImagePickerActivity.class);
        intent.putExtra("allow_album", false);
        intent.putExtra(ArgKeys.LIMIT, 1);
        ArrayList<String> acts = new ArrayList<>();
        if (havePhotos) {
            acts.add(getString(R.string.delete));
            intent.putExtra(SchedulerSupport.CUSTOM, acts);
        }
        intent.putExtra("no_thumbs", true);
        intent.putExtra(AttachIntent.INTENT_THUMB, true);
        startActivityForResult(intent, AVA_RESULT);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deletePhoto() {
        new PhotosDeleteAvatar(VKAccountManager.getCurrent().getUid()).setCallback(new SimpleCallback<String>(getActivity()) { // from class: com.vkontakte.android.fragments.ProfileEditFragment.17
            @Override // com.vkontakte.android.api.Callback
            public void success(String newPhoto) {
                ProfileEditFragment.this.setUserPhoto(newPhoto);
                Intent intent = new Intent(Posts.ACTION_USER_PHOTO_CHANGED);
                intent.putExtra("photo", newPhoto);
                intent.putExtra("id", VKAccountManager.getCurrent().getUid());
                ProfileEditFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setUserPhoto(final String photo) {
        if (!TextUtils.isEmpty(photo) && !photo.endsWith(".png") && !photo.endsWith(".gif")) {
            this.form.findViewById(R.id.photo).setVisibility(0);
            this.form.findViewById(R.id.photo_placeholder).setVisibility(8);
            ((VKImageView) this.form.findViewById(R.id.photo)).load(photo);
        } else {
            this.form.findViewById(R.id.photo).setVisibility(8);
            this.form.findViewById(R.id.photo_placeholder).setVisibility(0);
        }
        this.form.findViewById(R.id.photo_wrap).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.ProfileEditFragment.18
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ProfileEditFragment.this.showUpdatePhotoDlg(!TextUtils.isEmpty(photo) && !photo.endsWith(".png") && !photo.endsWith(".gif"));
            }
        });
    }
}
