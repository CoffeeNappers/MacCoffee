package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.text.Editable;
import android.text.InputFilter;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import me.grishka.appkit.utils.V;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class SignupPhoneFragment extends VKToolbarFragment {
    public static final String KEY_PHONE = "phone";
    private static final String KEY_SHOW_TOOLBAR = "show_toolbar";
    private VoidF0 doneFunc;
    private boolean showForgot;
    private View view;
    private ArrayList<Country> countries = new ArrayList<>();
    private int selectedCountry = 0;
    private boolean ignoreSelCallback = false;
    private boolean dontUpdateField = false;
    private List<String> canadianPrefixes = Arrays.asList("403", "587", "780", "250", "604", "778", "418", "438", "450", "514", "579", "581", "819", "204", "902", "867", "506", "709", "226", "249", "289", "343", "416", "519", "613", "647", "705", "807", "905", "902", "306", "867");

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(SignupPhoneFragment.class);
            this.args.putBoolean(SignupPhoneFragment.KEY_SHOW_TOOLBAR, true);
        }
    }

    public void setOnDoneFunc(VoidF0 doneFunc) {
        this.doneFunc = doneFunc;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        String userCountry;
        super.onCreate(state);
        try {
            this.countries.clear();
            InputStream in = getActivity().getAssets().open("countries_" + Global.getDeviceLang() + ".txt");
            byte[] file = new byte[in.available()];
            in.read(file);
            in.close();
            String[] lines = new String(file, "UTF-8").split("\n");
            for (String line : lines) {
                String[] info = line.split(",", 4);
                Country c = new Country();
                c.code = info[0];
                c.isoCode = info[2];
                c.name = info[3];
                this.countries.add(c);
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
        TelephonyManager tm = (TelephonyManager) getActivity().getSystemService(KEY_PHONE);
        String simCountry = tm.getSimCountryIso().toUpperCase();
        if (simCountry.length() == 2) {
            userCountry = simCountry;
        } else {
            userCountry = Locale.getDefault().getCountry();
        }
        int i = 0;
        Iterator<Country> it = this.countries.iterator();
        while (it.hasNext()) {
            if (userCountry.equals(it.next().isoCode)) {
                this.selectedCountry = i;
            }
            i++;
        }
        setTitle(R.string.phone_number);
        setHasOptionsMenu(true);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.submit_code, menu);
        menu.findItem(R.id.done).setEnabled(!TextUtils.isEmpty(getNumber()));
        super.onCreateOptionsMenu(menu, inflater);
    }

    public void setResultAndFinish(String number) {
        Activity activity = getActivity();
        if (activity != null && !TextUtils.isEmpty(number)) {
            activity.setResult(-1, new Intent().putExtra(KEY_PHONE, number));
            activity.finish();
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.done) {
            String phone = getNumber();
            if (!TextUtils.isEmpty(phone)) {
                setResultAndFinish(phone);
            }
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // com.vkontakte.android.fragments.VKToolbarFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (getArguments() == null || !getArguments().getBoolean(KEY_SHOW_TOOLBAR, false)) {
            getToolbar().setVisibility(8);
        }
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        InputFilter inputFilter;
        InputFilter inputFilter2;
        this.view = inflater.inflate(R.layout.signup_phone, (ViewGroup) null);
        View topBlock = this.view.findViewById(R.id.top_block);
        int pl = topBlock.getPaddingLeft();
        int pt = topBlock.getPaddingTop();
        int pr = topBlock.getPaddingRight();
        int pb = topBlock.getPaddingBottom();
        topBlock.setBackgroundDrawable(new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet));
        topBlock.setPadding(pl, pt, pr, pb);
        Spinner spinner = (Spinner) this.view.findViewById(R.id.signup_phone_countries);
        spinner.setAdapter((SpinnerAdapter) new CountriesAdapter());
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.vkontakte.android.fragments.SignupPhoneFragment.1
            {
                SignupPhoneFragment.this = this;
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> arg0, View arg1, int pos, long arg3) {
                SignupPhoneFragment.this.selectedCountry = pos;
                SignupPhoneFragment.this.ignoreSelCallback = true;
                SignupPhoneFragment.this.setCountry(pos);
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> arg0) {
            }
        });
        spinner.setSelection(this.selectedCountry);
        setCountry(this.selectedCountry);
        Editable editableText = ((EditText) this.view.findViewById(R.id.signup_phone_code)).getEditableText();
        inputFilter = SignupPhoneFragment$$Lambda$1.instance;
        editableText.setFilters(new InputFilter[]{inputFilter});
        Editable editableText2 = ((EditText) this.view.findViewById(R.id.signup_phone_number)).getEditableText();
        inputFilter2 = SignupPhoneFragment$$Lambda$2.instance;
        editableText2.setFilters(new InputFilter[]{inputFilter2});
        ((EditText) this.view.findViewById(R.id.signup_phone_code)).addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.SignupPhoneFragment.2
            {
                SignupPhoneFragment.this = this;
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable arg0) {
                if (SignupPhoneFragment.this.ignoreSelCallback) {
                    SignupPhoneFragment.this.ignoreSelCallback = false;
                    return;
                }
                String code = ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_code)).getText().toString().replace(Marker.ANY_NON_NULL_MARKER, "");
                if (code.length() != 0) {
                    int c = SignupPhoneFragment.this.findCountryByCode(code);
                    int cut = 0;
                    boolean select = true;
                    if (c == -1 && (!code.startsWith(AppEventsConstants.EVENT_PARAM_VALUE_YES) || code.length() >= 4)) {
                        while (cut < code.length()) {
                            cut++;
                            c = SignupPhoneFragment.this.findCountryByCode(code.substring(0, code.length() - cut));
                            if (c != -1) {
                                break;
                            }
                        }
                    }
                    if (code.startsWith(AppEventsConstants.EVENT_PARAM_VALUE_YES) && (c == -1 || code.length() < ((Country) SignupPhoneFragment.this.countries.get(c)).code.length() || (code.length() == ((Country) SignupPhoneFragment.this.countries.get(c)).code.length() && !code.equals(((Country) SignupPhoneFragment.this.countries.get(c)).code)))) {
                        if (code.length() >= 4) {
                            c = SignupPhoneFragment.this.findCountryByIso("US");
                            cut = code.length() - 1;
                        } else {
                            select = false;
                        }
                    }
                    if (select) {
                        if (cut > 0) {
                            String codePart = code.substring(0, code.length() - cut);
                            String numberPart = code.substring(code.length() - cut);
                            String num = ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_number)).getText().toString();
                            ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_code)).setText(Marker.ANY_NON_NULL_MARKER + codePart);
                            ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_number)).setText(numberPart + num);
                            SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_number).requestFocus();
                            ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_number)).setSelection(cut);
                        }
                        SignupPhoneFragment.this.selectedCountry = c;
                        if (!code.startsWith(AppEventsConstants.EVENT_PARAM_VALUE_YES) && code.length() < ((Country) SignupPhoneFragment.this.countries.get(c)).code.length()) {
                            SignupPhoneFragment.this.dontUpdateField = true;
                        }
                        ((Spinner) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_countries)).setSelection(c);
                    }
                }
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence _s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence _s, int start, int before, int count) {
                String s = _s.toString();
                if (!s.startsWith(Marker.ANY_NON_NULL_MARKER)) {
                    ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_code)).setText(Marker.ANY_NON_NULL_MARKER + s);
                    ((EditText) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_code)).setSelection(1);
                }
            }
        });
        ((EditText) this.view.findViewById(R.id.signup_phone_number)).addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.SignupPhoneFragment.3
            {
                SignupPhoneFragment.this = this;
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable text) {
                if (SignupPhoneFragment.this.selectedCountry != -1) {
                    String code = ((Country) SignupPhoneFragment.this.countries.get(SignupPhoneFragment.this.selectedCountry)).isoCode;
                    if ("US".equals(code) || "CA".equals(code)) {
                        String t = text.toString();
                        if (t.length() >= 3) {
                            String ccode = t.substring(0, 3);
                            boolean isCanada = SignupPhoneFragment.this.canadianPrefixes.contains(ccode);
                            if (isCanada && !"CA".equals(code)) {
                                ((Spinner) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_countries)).setSelection(SignupPhoneFragment.this.findCountryByIso("CA"));
                            }
                            if (!isCanada && !"US".equals(code)) {
                                ((Spinner) SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_countries)).setSelection(SignupPhoneFragment.this.findCountryByIso("US"));
                            }
                        }
                    }
                }
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence _s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence _s, int start, int before, int count) {
            }
        });
        ((EditText) this.view.findViewById(R.id.signup_phone_number)).setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.vkontakte.android.fragments.SignupPhoneFragment.4
            {
                SignupPhoneFragment.this = this;
            }

            @Override // android.widget.TextView.OnEditorActionListener
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (SignupPhoneFragment.this.doneFunc != null) {
                    SignupPhoneFragment.this.doneFunc.f();
                    return false;
                }
                SignupPhoneFragment.this.setResultAndFinish(SignupPhoneFragment.this.getNumber());
                return false;
            }
        });
        this.view.post(new Runnable() { // from class: com.vkontakte.android.fragments.SignupPhoneFragment.5
            {
                SignupPhoneFragment.this = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_number).requestFocus();
                InputMethodManager imm = (InputMethodManager) SignupPhoneFragment.this.getActivity().getSystemService("input_method");
                imm.showSoftInput(SignupPhoneFragment.this.view.findViewById(R.id.signup_phone_number), 0);
            }
        });
        this.view.findViewById(R.id.auth_forgot).setOnClickListener(SignupPhoneFragment$$Lambda$3.lambdaFactory$(this));
        this.view.findViewById(R.id.auth_forgot).setVisibility(this.showForgot ? 0 : 8);
        return this.view;
    }

    public static /* synthetic */ CharSequence lambda$onCreateContentView$0(CharSequence source, int start, int end, Spanned dest, int dstart, int dend) {
        String s = source.toString().replaceAll("[^0-9+]", "");
        if (start != 0) {
            return s.replace(Marker.ANY_NON_NULL_MARKER, "");
        }
        return s;
    }

    public /* synthetic */ void lambda$onCreateContentView$2(View v) {
        getActivity().setResult(1);
        getActivity().finish();
    }

    public void setNumber(String _num) {
        String num = "";
        for (int i = 0; i < _num.length(); i++) {
            char c = _num.charAt(i);
            if (Character.isDigit(c)) {
                num = num + c;
            }
        }
        Country longestCode = null;
        Iterator<Country> it = this.countries.iterator();
        while (it.hasNext()) {
            Country c2 = it.next();
            if (num.startsWith(c2.code) && (longestCode == null || c2.code.length() > longestCode.code.length())) {
                longestCode = c2;
            }
        }
        if (longestCode != null) {
            String num2 = num.substring(longestCode.code.length());
            ((EditText) this.view.findViewById(R.id.signup_phone_code)).setText(Marker.ANY_NON_NULL_MARKER + longestCode.code);
            ((EditText) this.view.findViewById(R.id.signup_phone_number)).setText(num2);
        }
    }

    public int findCountryByIso(String code) {
        int i = 0;
        Iterator<Country> it = this.countries.iterator();
        while (it.hasNext()) {
            Country c = it.next();
            if (!c.isoCode.equals(code)) {
                i++;
            } else {
                return i;
            }
        }
        return -1;
    }

    public int findCountryByCode(String code) {
        int i = 0;
        int count = 0;
        Iterator<Country> it = this.countries.iterator();
        while (it.hasNext()) {
            Country c = it.next();
            if (c.code.equals(code) && (!code.equals(AppEventsConstants.EVENT_PARAM_VALUE_YES) || c.isoCode.equals("US"))) {
                return i;
            }
            i++;
        }
        int i2 = 0;
        if (code.startsWith(AppEventsConstants.EVENT_PARAM_VALUE_YES)) {
            Iterator<Country> it2 = this.countries.iterator();
            while (it2.hasNext()) {
                Country c2 = it2.next();
                if (c2.code.startsWith(code)) {
                    count++;
                }
            }
            if (count > 1 || count == 0) {
                return -1;
            }
        }
        Iterator<Country> it3 = this.countries.iterator();
        while (it3.hasNext()) {
            Country c3 = it3.next();
            if (c3.code.startsWith(code)) {
                return i2;
            }
            i2++;
        }
        return -1;
    }

    public void setCountry(int pos) {
        if (this.dontUpdateField) {
            this.dontUpdateField = false;
            return;
        }
        Country c = this.countries.get(pos);
        ((EditText) this.view.findViewById(R.id.signup_phone_code)).setText(Marker.ANY_NON_NULL_MARKER + c.code);
        ((EditText) this.view.findViewById(R.id.signup_phone_code)).setSelection(c.code.length() + 1);
    }

    public void setShowForgitButton(boolean show) {
        this.showForgot = show;
        if (this.view != null) {
            this.view.findViewById(R.id.auth_forgot).setVisibility(show ? 0 : 8);
        }
    }

    public String getNumber() {
        return ((EditText) this.view.findViewById(R.id.signup_phone_code)).getText().toString() + ((EditText) this.view.findViewById(R.id.signup_phone_number)).getText().toString();
    }

    public boolean isFilled() {
        return ((EditText) this.view.findViewById(R.id.signup_phone_code)).getText().length() > 1 && ((EditText) this.view.findViewById(R.id.signup_phone_number)).getText().length() > 3;
    }

    /* loaded from: classes2.dex */
    private class CountriesAdapter extends BaseAdapter {
        private CountriesAdapter() {
            SignupPhoneFragment.this = r1;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return SignupPhoneFragment.this.countries.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int pos) {
            return SignupPhoneFragment.this.countries.get(pos);
        }

        @Override // android.widget.Adapter
        public long getItemId(int pos) {
            return pos;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (view == null) {
                view = View.inflate(SignupPhoneFragment.this.getActivity(), R.layout.countries_list_item, null);
                view.setPadding(0, 0, 0, 0);
                view.findViewById(R.id.country_code).setVisibility(8);
            }
            ((TextView) view.findViewById(R.id.country_name)).setText(((Country) SignupPhoneFragment.this.countries.get(position)).name);
            return view;
        }

        @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
        public View getDropDownView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (view == null) {
                view = View.inflate(SignupPhoneFragment.this.getActivity(), R.layout.countries_list_item, null);
                view.findViewById(R.id.dropdown_icon).setVisibility(8);
            }
            ((TextView) view.findViewById(R.id.country_name)).setText(((Country) SignupPhoneFragment.this.countries.get(position)).name);
            ((TextView) view.findViewById(R.id.country_code)).setText(Marker.ANY_NON_NULL_MARKER + ((Country) SignupPhoneFragment.this.countries.get(position)).code);
            return view;
        }
    }

    /* loaded from: classes2.dex */
    public static class Country {
        String code;
        String isoCode;
        String name;

        private Country() {
        }

        public String toString() {
            return this.name + " (+" + this.code + ")";
        }
    }
}
