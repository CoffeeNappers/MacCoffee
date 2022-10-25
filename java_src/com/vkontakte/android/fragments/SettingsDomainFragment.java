package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.Html;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.LinkMovementMethod;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountSaveProfileInfo;
import com.vkontakte.android.api.utils.UtilsCheckScreenName;
import java.util.List;
/* loaded from: classes2.dex */
public class SettingsDomainFragment extends VKToolbarFragment {
    private static final int COLOR_ERROR = -3201242;
    private static final int COLOR_NEUTRAL = -11435592;
    private static final int COLOR_SUCCESS = -12410809;
    private TextView currentLinkText;
    private VKAPIRequest currentReq;
    private Runnable delayedLoader;
    private EditText domainInput;
    private TextView explainText;
    private TextView statusText;
    private boolean canSave = false;
    private ClickableSpan mentionSpan = new ClickableSpan() { // from class: com.vkontakte.android.fragments.SettingsDomainFragment.1
        @Override // android.text.style.ClickableSpan
        public void onClick(View view) {
            ClipboardManager cm = (ClipboardManager) SettingsDomainFragment.this.getActivity().getSystemService("clipboard");
            cm.setText("@" + SettingsDomainFragment.this.getArguments().getString("domain"));
            Toast.makeText(SettingsDomainFragment.this.getActivity(), (int) R.string.link_copied, 0).show();
        }

        @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint ds) {
        }
    };

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        setTitle(R.string.page_address);
        setHasOptionsMenu(true);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        Drawable drawable = getResources().getDrawable(R.drawable.ic_check_24dp);
        MenuItem item = menu.add(0, R.id.save, 0, R.string.save);
        item.setIcon(drawable.mutate());
        item.setShowAsAction(2);
        item.setEnabled(this.canSave);
        item.getIcon().setAlpha(this.canSave ? 255 : 100);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.save) {
            save();
            return true;
        }
        return false;
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.settings_domain, (ViewGroup) null);
        this.domainInput = (EditText) view.findViewById(R.id.domain_input);
        this.statusText = (TextView) view.findViewById(R.id.domain_status);
        this.currentLinkText = (TextView) view.findViewById(R.id.domain_current_link);
        this.explainText = (TextView) view.findViewById(R.id.domain_explain);
        this.explainText.setMovementMethod(LinkMovementMethod.getInstance());
        this.domainInput.setText(getArguments().getString("domain"));
        this.domainInput.setSelection(this.domainInput.length());
        this.currentLinkText.setText("https://vk.com/" + getArguments().getString("domain"));
        this.currentLinkText.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SettingsDomainFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                ClipboardManager cm = (ClipboardManager) SettingsDomainFragment.this.getActivity().getSystemService("clipboard");
                cm.setText(SettingsDomainFragment.this.currentLinkText.getText());
                Toast.makeText(SettingsDomainFragment.this.getActivity(), (int) R.string.link_copied, 0).show();
            }
        });
        updateStatusTextVisibility();
        setFieldColor(COLOR_NEUTRAL);
        updateDomainExplanation(true, null);
        this.domainInput.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.SettingsDomainFragment.3
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                boolean needCheck = SettingsDomainFragment.this.updateStatusTextVisibility();
                if (SettingsDomainFragment.this.delayedLoader != null) {
                    SettingsDomainFragment.this.domainInput.removeCallbacks(SettingsDomainFragment.this.delayedLoader);
                    if (!needCheck) {
                        SettingsDomainFragment.this.delayedLoader = null;
                    }
                } else if (needCheck) {
                    SettingsDomainFragment.this.delayedLoader = new DelayedLoader();
                }
                if (SettingsDomainFragment.this.currentReq != null) {
                    SettingsDomainFragment.this.currentReq.cancel();
                    SettingsDomainFragment.this.currentReq = null;
                }
                if (needCheck) {
                    SettingsDomainFragment.this.domainInput.postDelayed(SettingsDomainFragment.this.delayedLoader, 250L);
                }
                SettingsDomainFragment.this.canSave = false;
                SettingsDomainFragment.this.invalidateOptionsMenu();
                SettingsDomainFragment.this.setFieldColor(SettingsDomainFragment.COLOR_NEUTRAL);
                SettingsDomainFragment.this.statusText.setText(R.string.domain_checking);
            }
        });
        return view;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setFieldColor(int color) {
        this.domainInput.getBackground().setColorFilter(color, PorterDuff.Mode.SRC_OVER);
        this.statusText.setTextColor(color);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean updateStatusTextVisibility() {
        String domain = this.domainInput.getText().toString();
        if (domain.equals(getArguments().getString("domain")) || domain.length() == 0) {
            this.statusText.setVisibility(8);
            updateDomainExplanation(true, null);
            return false;
        }
        this.statusText.setVisibility(0);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkDomain() {
        this.currentReq = new UtilsCheckScreenName(this.domainInput.getText().toString()).setCallback(new SimpleCallback<UtilsCheckScreenName.Result>() { // from class: com.vkontakte.android.fragments.SettingsDomainFragment.4
            @Override // com.vkontakte.android.api.Callback
            public void success(UtilsCheckScreenName.Result result) {
                SettingsDomainFragment.this.currentReq = null;
                SettingsDomainFragment.this.updateStatusTextVisibility();
                if (result.isValid) {
                    SettingsDomainFragment.this.statusText.setText(R.string.domain_available);
                    SettingsDomainFragment.this.setFieldColor(SettingsDomainFragment.COLOR_SUCCESS);
                } else {
                    SettingsDomainFragment.this.statusText.setText(result.reason);
                    SettingsDomainFragment.this.setFieldColor(SettingsDomainFragment.COLOR_ERROR);
                }
                SettingsDomainFragment.this.canSave = result.isValid;
                SettingsDomainFragment.this.invalidateOptionsMenu();
                SettingsDomainFragment.this.updateDomainExplanation(result.isValid, result.suggestions);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                SettingsDomainFragment.this.updateStatusTextVisibility();
                SettingsDomainFragment.this.statusText.setText(R.string.error);
                SettingsDomainFragment.this.setFieldColor(SettingsDomainFragment.COLOR_ERROR);
                SettingsDomainFragment.this.currentReq = null;
            }
        }).exec((Context) getActivity());
    }

    private void save() {
        final String domain = this.domainInput.getText().toString();
        new AccountSaveProfileInfo(domain).setCallback(new SimpleCallback<AccountSaveProfileInfo.Result>(getActivity()) { // from class: com.vkontakte.android.fragments.SettingsDomainFragment.5
            @Override // com.vkontakte.android.api.Callback
            public void success(AccountSaveProfileInfo.Result result) {
                Intent res = new Intent();
                res.putExtra("new_domain", domain);
                SettingsDomainFragment.this.getActivity().setResult(-1, res);
                SettingsDomainFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateDomainExplanation(boolean isValid, List<String> suggestions) {
        String domain = this.domainInput.getText().toString();
        SpannableStringBuilder explain = new SpannableStringBuilder("");
        if (suggestions != null) {
            explain.append((CharSequence) getString(R.string.sett_domain_options));
            explain.append('\n');
            SpannableString options = new SpannableString(TextUtils.join(", ", suggestions));
            if (Build.VERSION.SDK_INT >= 21) {
                options.setSpan(new TypefaceSpan("sans-serif-medium"), 0, options.length(), 0);
            } else {
                options.setSpan(new StyleSpan(1), 0, options.length(), 0);
            }
            explain.append((CharSequence) options);
            explain.append((CharSequence) "\n\n");
        }
        if (isValid) {
            Spannable s = (Spannable) Html.fromHtml(getString(R.string.domain_explain, new Object[]{"<font color='#4d6a8b'>@" + domain + "</font>"}).replace("\n", "<br/>"));
            ForegroundColorSpan colorSpan = ((ForegroundColorSpan[]) s.getSpans(0, s.length(), ForegroundColorSpan.class))[0];
            s.setSpan(this.mentionSpan, s.getSpanStart(colorSpan), s.getSpanEnd(colorSpan), 0);
            explain.append((CharSequence) s);
            this.currentLinkText.setVisibility(0);
            this.currentLinkText.setText("https://vk.com/" + domain);
        } else {
            explain.append((CharSequence) getString(R.string.domain_explain_invalid));
            this.currentLinkText.setVisibility(8);
        }
        this.explainText.setText(explain);
    }

    /* loaded from: classes2.dex */
    private class DelayedLoader implements Runnable {
        private DelayedLoader() {
        }

        @Override // java.lang.Runnable
        public void run() {
            SettingsDomainFragment.this.delayedLoader = null;
            SettingsDomainFragment.this.checkDomain();
        }
    }
}
