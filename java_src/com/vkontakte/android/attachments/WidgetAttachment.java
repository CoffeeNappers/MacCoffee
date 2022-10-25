package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.ui.widget.WidgetBinder;
import com.vkontakte.android.ui.widget.WidgetView;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class WidgetAttachment extends Attachment {
    public static final Serializer.Creator<WidgetAttachment> CREATOR = new Serializer.CreatorAdapter<WidgetAttachment>() { // from class: com.vkontakte.android.attachments.WidgetAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetAttachment mo1087createFromSerializer(Serializer s) {
            return new WidgetAttachment(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetAttachment[] mo1088newArray(int size) {
            return new WidgetAttachment[size];
        }
    };
    private final Widget widget;

    public WidgetAttachment(Widget widget) {
        this.widget = widget;
    }

    public WidgetAttachment(Serializer s) {
        this.widget = (Widget) s.readSerializable(Widget.class.getClassLoader());
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        String widgetType = "widget_" + this.widget.getType();
        View view = getReusableView(context, widgetType);
        if (!(view instanceof WidgetBinder)) {
            view = this.widget.createContentView(context);
        }
        Object holder = view.getTag();
        if (!(holder instanceof ViewHolder)) {
            holder = new ViewHolder((WidgetView) view, widgetType);
            view.setTag(holder);
        }
        ((WidgetBinder) ((ViewHolder) holder).widgetView).bind(this.widget);
        return view;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.widget);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class ViewHolder extends AttachmentViewHolder {
        private final View widgetView;

        public ViewHolder(View view, String tag) {
            super(tag);
            this.widgetView = view;
        }
    }
}
