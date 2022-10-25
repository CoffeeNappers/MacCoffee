package com.vkontakte.android.ui.holder.documents;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.BaseDocument;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class DocumentHolder<T extends BaseDocument> extends RecyclerHolder<T> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable, View.OnClickListener {
    protected final TextView info;
    protected final VKImageView thumb;
    protected final TextView title;
    protected final TextView type;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public /* bridge */ /* synthetic */ void onBind(Object obj) {
        onBind((DocumentHolder<T>) ((BaseDocument) obj));
    }

    public DocumentHolder(@NonNull Context context) {
        super((int) R.layout.documents_item, context);
        this.title = (TextView) $(R.id.docs_item_title);
        this.type = (TextView) $(R.id.docs_item_type);
        this.info = (TextView) $(R.id.docs_item_info);
        this.thumb = (VKImageView) $(R.id.docs_item_thumb);
    }

    public void onBind(T doc) {
        this.title.setText(doc.getTitle());
        this.type.setText(doc.getExt().toUpperCase().substring(0, Math.min(doc.getExt().length(), 4)));
        setInfo(this.info, doc);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setInfo(TextView info, T doc) {
        info.setText(Global.langFileSize(doc.getSize(), getResources()) + " · " + TimeUtils.langDate(doc.getDate()));
    }

    public void onClick() {
    }

    public boolean onLongClick() {
        return false;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        onClick();
    }
}
