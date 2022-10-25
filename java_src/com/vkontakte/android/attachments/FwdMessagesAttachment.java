package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import com.vkontakte.android.Message;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class FwdMessagesAttachment extends Attachment {
    public ArrayList<Message> msgs = new ArrayList<>();

    public FwdMessagesAttachment(List<Message> fw) {
        this.msgs.addAll(fw);
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return null;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return null;
    }
}
