package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vk.imageloader.view.VKSnippetImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.money.MoneyTransferDetailsFragment;
import com.vkontakte.android.fragments.money.MoneyWebViewFragment;
import com.vkontakte.android.utils.Serializer;
import com.vkontakte.android.utils.UriUtil;
/* loaded from: classes2.dex */
public class MoneyTransferAttachment extends Attachment implements ImageAttachment, View.OnClickListener {
    public static final Serializer.Creator<MoneyTransferAttachment> CREATOR = new Serializer.CreatorAdapter<MoneyTransferAttachment>() { // from class: com.vkontakte.android.attachments.MoneyTransferAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public MoneyTransferAttachment mo1087createFromSerializer(Serializer s) {
            int id = s.readInt();
            int fromId = s.readInt();
            int toId = s.readInt();
            String title = s.readString();
            return new MoneyTransferAttachment(id, fromId, toId, title);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public MoneyTransferAttachment[] mo1088newArray(int i) {
            return new MoneyTransferAttachment[i];
        }
    };
    private String buttonText;
    private int fromId;
    private int id;
    private String subtitle;
    private String title;
    private int toId;

    private boolean getIsForwarded() {
        return !VKAccountManager.isCurrentUser(this.fromId) && !VKAccountManager.isCurrentUser(this.toId);
    }

    public MoneyTransferAttachment(MoneyTransfer mt) {
        this(mt.id, mt.from_id, mt.to_id, mt.getAmountWithCurrencyFormatted());
    }

    private MoneyTransferAttachment(int id, int fromId, int toId, String title) {
        this.id = id;
        this.fromId = fromId;
        this.toId = toId;
        this.title = title;
        init();
    }

    private void init() {
        this.subtitle = VKApplication.context.getResources().getString(R.string.money_transfer_money_transfer);
        this.buttonText = getIsForwarded() ? VKApplication.context.getResources().getString(R.string.money_transfer_info) : VKApplication.context.getResources().getString(R.string.money_transfer_open);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        View v = View.inflate(context, R.layout.attach_money_transfer, null);
        ((VKSnippetImageView) v.findViewById(R.id.snippet_image)).setType(2);
        ((TextView) v.findViewById(R.id.attach_title)).setText(this.title);
        ((TextView) v.findViewById(R.id.attach_subtitle)).setText(this.subtitle);
        ((TextView) v.findViewById(R.id.attach_button)).setText(this.buttonText);
        ViewGroup container = (ViewGroup) v.findViewById(R.id.money_attach_container);
        float topLeftPadding = getIsForwarded() ? 0.0f : 8.0f;
        container.setPadding(Global.scale(topLeftPadding), Global.scale(topLeftPadding), Global.scale(8.0f), Global.scale(6.0f));
        v.setOnClickListener(this);
        v.findViewById(R.id.attach_button).setOnClickListener(this);
        return v;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return getFullView(context);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return UriUtil.resourceToUri(R.drawable.payment_snippet);
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        VKImageView imageView = (VKImageView) view.findViewById(R.id.snippet_image);
        imageView.load(getImageURL());
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (getIsForwarded()) {
            MoneyWebViewFragment.showTerms(view.getContext(), MoneyTransfer.getLandingUrl());
        } else {
            MoneyTransferDetailsFragment.show(this.id, this.fromId, this.toId, view.getContext());
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.fromId);
        s.writeInt(this.toId);
        s.writeString(this.title);
    }
}
