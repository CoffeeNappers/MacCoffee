package com.vkontakte.android;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import com.vkontakte.android.data.PostInteract;
/* loaded from: classes2.dex */
public class LinkSpan extends CharacterStyle {
    private static final int DEFAULT_COLOR = VKApplication.context.getResources().getColorStateList(R.color.link).getDefaultColor();
    private int color;
    private String link;
    private final PostInteract postInteract;

    public LinkSpan(String l) {
        this(l, null);
    }

    public LinkSpan(String l, PostInteract postInteract) {
        this.color = DEFAULT_COLOR;
        this.link = l;
        this.postInteract = postInteract;
    }

    public void setColor(int c) {
        this.color = c;
    }

    public int getColor() {
        return this.color;
    }

    @Override // android.text.style.CharacterStyle
    public void updateDrawState(TextPaint tp) {
        tp.setColor(this.color);
    }

    public void onClick(Context context) {
        Intent intent = new Intent(context, LinkRedirActivity.class);
        intent.setData(Uri.parse(this.link));
        context.startActivity(intent);
        if (this.postInteract != null) {
            this.postInteract.setLink(this.link).sendNow(PostInteract.Type.link_click);
        }
    }

    public String getLink() {
        return this.link;
    }
}
