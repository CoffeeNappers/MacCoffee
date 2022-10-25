package ru.mail.libverify.notifications;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;
import ru.mail.libverify.R;
import ru.mail.libverify.api.ac;
import ru.mail.libverify.api.k;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public class SettingsActivity extends AppCompatActivity {

    /* loaded from: classes3.dex */
    public static class a extends PreferenceFragment implements b {
        private String a;
        private String b;
        private String c;

        static /* synthetic */ AlertDialog a(a aVar) {
            Activity activity = aVar.getActivity();
            if (activity == null) {
                return null;
            }
            AlertDialog.Builder builder = new AlertDialog.Builder(activity);
            builder.setTitle(aVar.b);
            Drawable wrap = DrawableCompat.wrap(aVar.getResources().getDrawable(R.drawable.libverify_ic_sms_white));
            DrawableCompat.setTint(wrap, aVar.getResources().getColor(R.color.libverify_secondary_icon_color));
            builder.setIcon(wrap);
            builder.setMessage(String.format(aVar.getResources().getString(R.string.report_reuse_text_confirmation), aVar.a));
            builder.setPositiveButton(aVar.getString(R.string.notification_event_confirm), new DialogInterface.OnClickListener() { // from class: ru.mail.libverify.notifications.SettingsActivity.a.3
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    if (!a.b(a.this)) {
                        return;
                    }
                    k.e(a.this.getActivity()).j(a.this.c);
                }
            });
            builder.setNegativeButton(aVar.getString(R.string.notification_event_cancel), new DialogInterface.OnClickListener() { // from class: ru.mail.libverify.notifications.SettingsActivity.a.4
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                }
            });
            return builder.create();
        }

        private void a() {
            if (this.c == null) {
                this.c = getArguments().getString("notification_id");
                if (TextUtils.isEmpty(this.c)) {
                    getActivity().finish();
                } else {
                    k.e(getActivity()).a(this.c, new ru.mail.libverify.notifications.a(this));
                }
            }
        }

        static /* synthetic */ boolean b(a aVar) {
            Activity activity = aVar.getActivity();
            if (activity == null) {
                return false;
            }
            activity.finish();
            Toast.makeText(activity, aVar.getResources().getString(R.string.setting_saved_toast_text), 1).show();
            return true;
        }

        @Override // ru.mail.libverify.notifications.b
        public final void a(ac.a aVar) {
            if (aVar == null || getActivity() == null || !TextUtils.equals(aVar.f, this.c)) {
                ru.mail.libverify.utils.d.a("SettingsActivity", "no such notification with id %s or activity has been finished", this.c);
                if (getActivity() == null) {
                    return;
                }
                getActivity().finish();
                return;
            }
            k.e(getActivity()).i(this.c);
            String str = aVar.e;
            if (str.length() > 4) {
                StringBuilder sb = new StringBuilder(str.length());
                int length = str.length() - 4;
                for (int i = 0; i < length; i++) {
                    sb.append('*');
                }
                sb.append(str.substring(length));
                str = sb.toString();
            }
            this.a = str;
            this.b = aVar.b;
            addPreferencesFromResource(R.xml.notification_settings);
            Preference findPreference = findPreference("preference_report_reuse");
            findPreference.setTitle(String.format(getResources().getString(R.string.report_reuse_text), this.a));
            findPreference.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: ru.mail.libverify.notifications.SettingsActivity.a.1
                @Override // android.preference.Preference.OnPreferenceClickListener
                public final boolean onPreferenceClick(Preference preference) {
                    AlertDialog a = a.a(a.this);
                    if (a == null) {
                        return false;
                    }
                    a.show();
                    return true;
                }
            });
            findPreference("preference_block_notifications").setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() { // from class: ru.mail.libverify.notifications.SettingsActivity.a.2
                @Override // android.preference.Preference.OnPreferenceClickListener
                public final boolean onPreferenceClick(Preference preference) {
                    preference.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() { // from class: ru.mail.libverify.notifications.SettingsActivity.a.2.1
                        @Override // android.preference.Preference.OnPreferenceChangeListener
                        public final boolean onPreferenceChange(Preference preference2, Object obj) {
                            if (!a.b(a.this)) {
                                return false;
                            }
                            k.e(a.this.getActivity()).a(a.this.c, Integer.parseInt(obj.toString()));
                            return true;
                        }
                    });
                    return true;
                }
            });
            getActivity().setTitle(String.format("%s (%s)", getResources().getString(R.string.title_activity_settings), this.b));
        }

        @Override // android.preference.PreferenceFragment, android.app.Fragment
        public final void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            a();
        }

        @Override // android.app.Fragment
        public final void setArguments(Bundle bundle) {
            super.setArguments(bundle);
            a();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent == null) {
            finish();
            return;
        }
        ru.mail.libverify.utils.d.c("SettingsActivity", "create with %s", m.a(intent.getExtras()));
        a aVar = new a();
        aVar.setArguments(getIntent().getExtras());
        getFragmentManager().beginTransaction().replace(16908290, aVar).commit();
        g.a(this, R.drawable.libverify_ic_sms_white, getResources().getString(R.string.title_activity_settings));
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        return true;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return super.onOptionsItemSelected(menuItem);
    }
}
