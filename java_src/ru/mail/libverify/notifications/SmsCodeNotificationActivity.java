package ru.mail.libverify.notifications;

import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.text.util.Linkify;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import ru.mail.libverify.R;
import ru.mail.libverify.api.ac;
import ru.mail.libverify.api.k;
import ru.mail.libverify.notifications.e;
import ru.mail.libverify.utils.m;
/* loaded from: classes3.dex */
public class SmsCodeNotificationActivity extends AppCompatActivity implements b {
    private String a;
    private String b;
    private AlertDialog c;
    private Drawable d;
    private boolean e = false;

    @Override // ru.mail.libverify.notifications.b
    public final void a(ac.a aVar) {
        if (aVar == null || !TextUtils.equals(aVar.f, this.a)) {
            ru.mail.libverify.utils.d.a("SmsCodeActivity", "no such notification with id %s", this.a);
            finish();
        } else if (this.e) {
            ru.mail.libverify.utils.d.b("SmsCodeActivity", "activity with id %s has been already deactivated", this.a);
        } else {
            this.b = aVar.b;
            ru.mail.libverify.utils.d.c("SmsCodeActivity", "build dialog for notification %s", aVar);
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle(aVar.b);
            if (this.d == null) {
                this.d = DrawableCompat.wrap(getResources().getDrawable(R.drawable.libverify_ic_sms_white));
                DrawableCompat.setTint(this.d, getResources().getColor(R.color.libverify_secondary_icon_color));
            }
            builder.setIcon(this.d);
            String str = aVar.a;
            String str2 = aVar.c;
            if (!TextUtils.isEmpty(aVar.g)) {
                str = String.format("%s\n%s", str, aVar.g);
            }
            if (TextUtils.isEmpty(aVar.c)) {
                str2 = getString(R.string.notification_event_confirm);
            }
            builder.setMessage(str);
            if (aVar.d.booleanValue()) {
                builder.setPositiveButton(str2, new DialogInterface.OnClickListener() { // from class: ru.mail.libverify.notifications.SmsCodeNotificationActivity.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        try {
                            SmsCodeNotificationActivity smsCodeNotificationActivity = SmsCodeNotificationActivity.this;
                            new e.b(smsCodeNotificationActivity, "action_confirm").a("notification_id", SmsCodeNotificationActivity.this.a).a().send();
                        } catch (PendingIntent.CanceledException e) {
                            ru.mail.libverify.utils.d.a("SmsCodeActivity", "failed to confirm notification", e);
                        }
                        SmsCodeNotificationActivity.this.finish();
                    }
                });
            }
            builder.setNegativeButton(getString(R.string.notification_event_cancel), new DialogInterface.OnClickListener() { // from class: ru.mail.libverify.notifications.SmsCodeNotificationActivity.2
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    try {
                        SmsCodeNotificationActivity smsCodeNotificationActivity = SmsCodeNotificationActivity.this;
                        new e.b(smsCodeNotificationActivity, "action_cancel").a("notification_id", SmsCodeNotificationActivity.this.a).a().send();
                    } catch (PendingIntent.CanceledException e) {
                        ru.mail.libverify.utils.d.a("SmsCodeActivity", "failed to confirm notification", e);
                    }
                    SmsCodeNotificationActivity.this.finish();
                }
            });
            builder.setNeutralButton(getString(R.string.notification_settings), new DialogInterface.OnClickListener() { // from class: ru.mail.libverify.notifications.SmsCodeNotificationActivity.3
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    try {
                        SmsCodeNotificationActivity smsCodeNotificationActivity = SmsCodeNotificationActivity.this;
                        new e.c(smsCodeNotificationActivity).a("notification_id", SmsCodeNotificationActivity.this.a).a().send();
                    } catch (PendingIntent.CanceledException e) {
                        ru.mail.libverify.utils.d.a("SmsCodeActivity", "failed to open settings", e);
                    }
                    SmsCodeNotificationActivity.this.finish();
                }
            });
            AlertDialog create = builder.create();
            create.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: ru.mail.libverify.notifications.SmsCodeNotificationActivity.4
                @Override // android.content.DialogInterface.OnDismissListener
                public final void onDismiss(DialogInterface dialogInterface) {
                    SmsCodeNotificationActivity.this.finish();
                }
            });
            this.c = create;
            this.c.show();
            Linkify.addLinks((TextView) this.c.findViewById(16908299), 3);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_sms_code_notification);
        Intent intent = getIntent();
        if (intent == null) {
            finish();
            return;
        }
        ru.mail.libverify.utils.d.c("SmsCodeActivity", "create with %s", m.a(intent.getExtras()));
        this.a = intent.getStringExtra("notification_id");
        if (TextUtils.isEmpty(this.a)) {
            finish();
            return;
        }
        k.e(this).k(this.a);
        k.e(this).a(this.a, new a(this));
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        return true;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return super.onOptionsItemSelected(menuItem);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        g.a(this, R.drawable.libverify_ic_sms_white, this.b);
        super.onPause();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onStart() {
        super.onStart();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onStop() {
        super.onStop();
        this.e = true;
        if (this.c != null) {
            this.c.dismiss();
        }
    }
}
