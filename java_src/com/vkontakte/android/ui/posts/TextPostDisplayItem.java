package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.preference.PreferenceManager;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.R;
import com.vkontakte.android.data.PostInteract;
/* loaded from: classes3.dex */
public class TextPostDisplayItem extends PostDisplayItem {
    public boolean clickableLinks;
    public boolean expanded;
    public String fullText;
    public boolean gray;
    public final PostInteract postInteract;
    public CharSequence text;

    public TextPostDisplayItem(int _postID, int _postOwnerID, CharSequence _text, String _fullText, boolean _gray, boolean _clickableLinks, PostInteract postInteract) {
        super(_postID, _postOwnerID);
        this.expanded = false;
        this.text = _text;
        this.gray = _gray;
        this.clickableLinks = _clickableLinks;
        this.fullText = _fullText;
        this.postInteract = postInteract;
    }

    public int hashCode() {
        return this.postID + (this.postOwnerID * 7);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof TextPostDisplayItem)) {
            return false;
        }
        TextPostDisplayItem newItem = (TextPostDisplayItem) o;
        return newItem.postID == this.postID && newItem.postOwnerID == this.postOwnerID && TextUtils.equals(newItem.text, this.text);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 2;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    public static View createView(Context context, boolean clickableLinks) {
        View view = View.inflate(context, R.layout.news_item_text, null);
        ViewHolder holder = new ViewHolder();
        holder.text = (TextView) view.findViewById(R.id.post_view);
        int k = Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(context).getString(TtmlNode.ATTR_TTS_FONT_SIZE, AppEventsConstants.EVENT_PARAM_VALUE_NO));
        holder.text.setTextSize(1, 15.0f + (k * 2.0f));
        holder.text.setTextIsSelectable(clickableLinks);
        view.setTag(holder);
        return view;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        if (!TextUtils.equals(this.text, holder.text.getText())) {
            holder.text.setText(this.text);
        }
        if (this.gray) {
            holder.text.setTextColor(1426063360);
        } else {
            holder.text.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        }
    }

    public TextPostDisplayItem expandText() {
        return new TextPostDisplayItem(this.postID, this.postOwnerID, Global.replaceEmoji(LinkParser.parseLinks(this.fullText, 7, this.postInteract)), null, this.gray, this.clickableLinks, this.postInteract);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        TextView text;

        private ViewHolder() {
        }
    }
}
