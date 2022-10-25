package com.vkontakte.android;

import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.cache.Gifs;
import com.vkontakte.android.gifs.GifViewer;
import com.vkontakte.android.utils.Utils;
import java.io.File;
/* loaded from: classes2.dex */
public class DocAttachView extends LinearLayout implements View.OnClickListener, View.OnLongClickListener {
    private DocumentAttachment doc;

    public DocAttachView(Context context) {
        super(context);
    }

    public DocAttachView(Context context, AttributeSet attrs) {
        super(context, attrs);
        setOnClickListener(this);
        setOnLongClickListener(this);
    }

    public void setData(DocumentAttachment doc) {
        this.doc = doc;
        if ("gif".equals(doc.extension) && Gifs.allowAutoPlay()) {
            ((TextView) findViewById(R.id.att_doc_title)).setText(doc.extension.toUpperCase());
        } else {
            String size = Global.langFileSize(doc.size, getResources());
            String text = TextUtils.isEmpty(doc.extension) ? size : doc.extension.toUpperCase() + ", " + size;
            ((TextView) findViewById(R.id.att_doc_title)).setText(text);
        }
        if (TextUtils.isEmpty(doc.url)) {
            setOnClickListener(null);
            setOnLongClickListener(null);
            setBackgroundColor(-1);
            getChildAt(0).setLayoutParams(new LinearLayout.LayoutParams(Global.scale(150.0f), Global.scale(150.0f)));
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int w, int h) {
        super.onMeasure(w, h);
        if (TextUtils.isEmpty(this.doc.thumb)) {
            setMeasuredDimension(View.MeasureSpec.getSize(w), getMeasuredHeight());
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (this.doc != null && this.doc.extension != null && this.doc.extension.equalsIgnoreCase("gif")) {
            GifViewer.start(Utils.castToActivity(v.getContext()), this.doc);
        } else if (this.doc != null && this.doc.url.startsWith(UriUtil.HTTP_SCHEME)) {
            if (!TextUtils.isEmpty(this.doc.thumb)) {
                new PhotoViewer(Utils.castToActivity(getContext()), this.doc.url, this.doc.title).show();
                return;
            }
            Uri uri = Uri.parse(this.doc.url);
            DownloadManager.Request req = new DownloadManager.Request(uri);
            req.setDestinationUri(Uri.fromFile(new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), uri.getLastPathSegment())));
            req.setNotificationVisibility(1);
            req.allowScanningByMediaScanner();
            DownloadManager mgr = (DownloadManager) getContext().getSystemService("download");
            mgr.enqueue(req);
        }
    }

    public void reset() {
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        if (this.doc == null || this.doc.extension == null || !this.doc.extension.equalsIgnoreCase("gif")) {
            return false;
        }
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(this.doc.url));
        getContext().startActivity(intent);
        return true;
    }
}
