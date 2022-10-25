package com.vkontakte.android.ui.holder.messages;

import android.content.Intent;
import android.net.Uri;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Link;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.L;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class LinkHolder extends RecyclerHolder<Link> implements UsableRecyclerView.Clickable {
    private VKImageView imageView;
    private final TextView link;
    private final TextView thumb;
    private final TextView title;

    public LinkHolder(ViewGroup parent) {
        super((int) R.layout.link_holder, parent);
        this.imageView = (VKImageView) $(R.id.image);
        this.title = (TextView) $(R.id.title);
        this.link = (TextView) $(R.id.link);
        this.thumb = (TextView) $(R.id.thumb_text);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Link item) {
        this.imageView.load(item.image_src);
        this.title.setText(item.title);
        this.title.setText(item.getDisplayText());
        this.link.setText(item.url);
        this.thumb.setText(item.thumb);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        try {
            Intent intent = new Intent(this.itemView.getContext(), LinkRedirActivity.class);
            intent.setData(Uri.parse(getItem().url));
            this.itemView.getContext().startActivity(intent);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }
}
