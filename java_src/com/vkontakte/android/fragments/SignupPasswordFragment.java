package com.vkontakte.android.fragments;

import android.os.Bundle;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.cardview.CardDrawable;
import com.vkontakte.android.utils.TypefaceSpanAssets;
import java.math.BigInteger;
import java.security.SecureRandom;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SignupPasswordFragment extends VKFragment {
    private VoidF0 doneFunc;
    private String explainText;
    private long initTime;
    private SecureRandom random = new SecureRandom();
    private View view;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        if (b != null) {
            this.initTime = b.getLong("init_time");
        } else {
            this.initTime = System.currentTimeMillis();
        }
    }

    public void setOnDoneFunc(VoidF0 doneFunc) {
        this.doneFunc = doneFunc;
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.view = inflater.inflate(R.layout.signup_password, (ViewGroup) null);
        TextView textView = (TextView) this.view.findViewById(R.id.signup_text_info_2);
        textView.setText(getString(R.string.signup_example_pass, new Object[]{new BigInteger(40, this.random).toString(32)}));
        View topBlock = this.view.findViewById(R.id.top_block);
        int pl = topBlock.getPaddingLeft();
        int pt = topBlock.getPaddingTop();
        int pr = topBlock.getPaddingRight();
        int pb = topBlock.getPaddingBottom();
        topBlock.setBackgroundDrawable(new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet));
        topBlock.setPadding(pl, pt, pr, pb);
        if (this.explainText != null) {
            ((TextView) this.view.findViewById(R.id.signup_text_info_1)).setText(this.explainText);
        }
        this.view.findViewById(R.id.signup_pass_edit).requestFocus();
        ((EditText) this.view.findViewById(R.id.signup_pass_edit)).setOnEditorActionListener(SignupPasswordFragment$$Lambda$1.lambdaFactory$(this));
        TextView textViewExample = (TextView) this.view.findViewById(R.id.signup_text_info_2);
        String examplePass = textViewExample.getText().toString();
        int index = examplePass.indexOf(":") + 1;
        if (index > 0 && index < examplePass.length()) {
            SpannableStringBuilder builder = new SpannableStringBuilder(examplePass.substring(0, index));
            Spannable sp = Spannable.Factory.getInstance().newSpannable(examplePass.substring(index, examplePass.length()));
            sp.setSpan(new TypefaceSpanAssets(Font.Medium.typeface), 0, sp.length(), 0);
            sp.setSpan(new ForegroundColorSpan(getResources().getColor(R.color.text_blue)), 0, sp.length(), 0);
            builder.append((CharSequence) sp);
            textViewExample.setText(builder);
        }
        this.view.post(SignupPasswordFragment$$Lambda$2.lambdaFactory$(this));
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateView$0(TextView v, int actionId, KeyEvent event) {
        if (this.doneFunc != null) {
            this.doneFunc.f();
            return false;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$1() {
        this.view.findViewById(R.id.signup_pass_edit).requestFocus();
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
        imm.showSoftInput(this.view.findViewById(R.id.signup_phone_number), 0);
    }

    public void setExplainText(String txt) {
        this.explainText = txt;
        if (this.view != null) {
            ((TextView) this.view.findViewById(R.id.signup_text_info_1)).setText(txt);
        }
    }

    public String getPassword() {
        return ((TextView) this.view.findViewById(R.id.signup_pass_edit)).getText().toString();
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.view = null;
    }
}
