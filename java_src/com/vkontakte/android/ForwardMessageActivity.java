package com.vkontakte.android;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.FrameLayout;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.FragmentHelper;
/* loaded from: classes2.dex */
public class ForwardMessageActivity extends VKActivity {
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        FrameLayout dialogsWrap = new FrameLayout(this);
        dialogsWrap.setId(R.id.fragment_wrapper);
        setContentView(dialogsWrap);
        if ("android.intent.action.CREATE_SHORTCUT".equals(getIntent().getAction())) {
            setTitle(R.string.add_shortcut_title);
            if (Build.VERSION.SDK_INT >= 21) {
                getWindow().setStatusBarColor(-12886137);
            }
        } else if (getIntent().hasExtra("title")) {
            setTitle(getIntent().getStringExtra("title"));
        }
        DialogsFragment dialogs = new DialogsFragment();
        Bundle args = new Bundle();
        args.putBoolean(ArgKeys.SELECT, true);
        dialogs.setArguments(args);
        dialogs.setListener(ForwardMessageActivity$$Lambda$1.lambdaFactory$(this));
        FragmentHelper.replace(this, dialogs);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(DialogEntry e) {
        if ("android.intent.action.CREATE_SHORTCUT".equals(getIntent().getAction())) {
            setResult(-1, Messages.getShortcutIntent(e.profile));
            finish();
            return;
        }
        Intent intent = new Intent();
        intent.putExtra("profile", e.profile);
        setResult(-1, intent);
        finish();
    }

    @Override // com.vkontakte.android.VKActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 16908332) {
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
