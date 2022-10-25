package com.vk.stories.dialog;

import android.app.Dialog;
import android.content.Context;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.Toast;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.widget.BackPressEditText;
import com.vk.attachpicker.widget.EmptyLineTextWatcher;
import com.vk.core.util.KeyboardUtils;
import com.vk.stories.model.StoryEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.data.Messages;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StorySendMessageDialog extends Dialog {
    private static final float DISABLED_SEND_ALPHA = 0.4f;
    private View clickHandler;
    private BackPressEditText editText;
    private ImageView sendButton;
    private final StoryEntry storyEntry;
    private final int uid;

    public StorySendMessageDialog(Context context, int uid, StoryEntry entry) {
        super(context, R.style.PickerFullScreenNoStatusDialog);
        View.OnClickListener onClickListener;
        this.uid = uid;
        this.storyEntry = entry;
        KeyboardUtils.setSoftInputModeAdjustPan(getWindow());
        getWindow().setWindowAnimations(R.style.PickerDialogAnimation);
        View view = LayoutInflater.from(context).inflate(R.layout.layout_dialog_send_message, (ViewGroup) null);
        setContentView(view);
        this.editText = (BackPressEditText) findViewById(R.id.et_send_message);
        this.sendButton = (ImageView) findViewById(R.id.iv_send);
        this.clickHandler = findViewById(R.id.click_handler);
        this.sendButton.setOnClickListener(StorySendMessageDialog$$Lambda$1.lambdaFactory$(this));
        this.sendButton.setAlpha(DISABLED_SEND_ALPHA);
        this.sendButton.setEnabled(false);
        this.editText.addTextChangedListener(new TextWatcher() { // from class: com.vk.stories.dialog.StorySendMessageDialog.1
            {
                StorySendMessageDialog.this = this;
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                StorySendMessageDialog.this.sendButton.setAlpha(editable.length() > 0 ? 1.0f : StorySendMessageDialog.DISABLED_SEND_ALPHA);
                StorySendMessageDialog.this.sendButton.setEnabled(editable.length() > 0);
            }
        });
        this.editText.addTextChangedListener(EmptyLineTextWatcher.INSTANCE);
        this.editText.setAlpha(0.0f);
        this.sendButton.setAlpha(0.0f);
        this.editText.getViewTreeObserver().addOnPreDrawListener(new AnonymousClass2());
        this.editText.setCallback(new BackPressEditText.OnBackPressedCallback() { // from class: com.vk.stories.dialog.StorySendMessageDialog.3
            {
                StorySendMessageDialog.this = this;
            }

            @Override // com.vk.attachpicker.widget.BackPressEditText.OnBackPressedCallback
            public void onBackPressed() {
                StorySendMessageDialog.this.dismiss();
            }
        });
        View view2 = this.clickHandler;
        onClickListener = StorySendMessageDialog$$Lambda$2.instance;
        view2.setOnClickListener(onClickListener);
    }

    public /* synthetic */ void lambda$new$0(View view1) {
        sendMessage();
    }

    /* renamed from: com.vk.stories.dialog.StorySendMessageDialog$2 */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements ViewTreeObserver.OnPreDrawListener {
        AnonymousClass2() {
            StorySendMessageDialog.this = this$0;
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            StorySendMessageDialog.this.editText.getViewTreeObserver().removeOnPreDrawListener(this);
            KeyboardUtils.showKeyboard(StorySendMessageDialog.this.editText);
            Picker.runDelayed(StorySendMessageDialog$2$$Lambda$1.lambdaFactory$(this), 300L);
            return true;
        }

        public /* synthetic */ void lambda$onPreDraw$0() {
            StorySendMessageDialog.this.editText.animate().alpha(1.0f).setDuration(200L).start();
            StorySendMessageDialog.this.sendButton.animate().alpha(StorySendMessageDialog.DISABLED_SEND_ALPHA).setDuration(200L).start();
        }
    }

    public static /* synthetic */ void lambda$new$1(View view1) {
    }

    public /* synthetic */ void lambda$openKeyboard$2() {
        KeyboardUtils.showKeyboard(this.editText);
    }

    public void openKeyboard() {
        Picker.runDelayed(StorySendMessageDialog$$Lambda$3.lambdaFactory$(this), 300L);
    }

    private void sendMessage() {
        String text = this.editText.getText().toString().trim();
        if (!TextUtils.isEmpty(text)) {
            Messages.send(this.uid, this.storyEntry.link() + "\n" + text, new ArrayList(), new ArrayList(), 0);
            Toast.makeText(getContext(), (int) R.string.messages_sent, 0).show();
            dismiss();
        }
    }
}
