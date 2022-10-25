package com.vkontakte.android;

import android.graphics.Point;
import android.graphics.Rect;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.attachments.AlbumAttachment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class NewsItemView {
    public static void addAttachments(final View item, ArrayList<Attachment> atts, final NewsEntry e, final int containerID) {
        FlowLayout.LayoutParams lp;
        int pi = 0;
        int ai = 0;
        final ArrayList<Photo> photos = new ArrayList<>();
        ArrayList<MusicTrack> audios = new ArrayList<>();
        int nPhotos = 0;
        Iterator<Attachment> it = atts.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if ((att instanceof PhotoAttachment) && !(att instanceof AlbumAttachment)) {
                nPhotos++;
                photos.add(new Photo((PhotoAttachment) att));
            }
            if (att instanceof AudioAttachment) {
                AudioAttachment aa = (AudioAttachment) att;
                aa.setReferData("comments", null);
                audios.add(aa.musicTrack);
            }
            if (att instanceof SnippetAttachment) {
                ((SnippetAttachment) att).setReferData(null);
            }
        }
        View thumb = null;
        Iterator<Attachment> it2 = atts.iterator();
        while (it2.hasNext()) {
            Attachment att2 = it2.next();
            if (att2 != null) {
                View v = e != null ? att2.getViewForList(item.getContext(), null) : att2.getFullView(item.getContext());
                if (nPhotos > 0 && (att2 instanceof PhotoAttachment) && !(att2 instanceof AlbumAttachment)) {
                    final int idx = pi;
                    v.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.NewsItemView.1
                        long lastClick = 0;

                        @Override // android.view.View.OnClickListener
                        public void onClick(View v2) {
                            if (System.currentTimeMillis() - this.lastClick >= 500) {
                                this.lastClick = System.currentTimeMillis();
                                NewsItemView.openPhotoList(idx, v2, photos, e, item, containerID);
                            }
                        }
                    });
                    pi++;
                    if (nPhotos == 1) {
                        ((ImageView) v).setScaleType(ImageView.ScaleType.FIT_START);
                    }
                }
                if (att2 instanceof AudioAttachment) {
                    AudioAttachView aav = (AudioAttachView) v;
                    aav.playlist = audios;
                    aav.playlistPos = ai;
                    ai++;
                }
                if (att2 instanceof VideoAttachment) {
                    ((VideoAttachment) att2).setReferData("comments", null);
                }
                if ((att2 instanceof ThumbAttachment) || ((att2 instanceof DocumentAttachment) && !TextUtils.isEmpty(((DocumentAttachment) att2).thumb))) {
                    thumb = v;
                } else {
                    FlowLayout.LayoutParams lp2 = new FlowLayout.LayoutParams();
                    lp2.width = -1;
                    v.setLayoutParams(lp2);
                }
                ((ViewGroup) item.findViewById(containerID)).addView(v);
            }
        }
        if (thumb != null && (lp = (FlowLayout.LayoutParams) thumb.getLayoutParams()) != null) {
            lp.breakAfter = true;
            thumb.setLayoutParams(lp);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void openPhotoList(int index, View view, ArrayList<Photo> photos, NewsEntry e, final View container, int vID) {
        if (container.getTag(R.id.photo_viewer) == null) {
            ViewGroup attachContainer = (ViewGroup) container.findViewById(vID);
            for (int i = 0; i < Math.min(attachContainer.getChildCount(), photos.size()); i++) {
                View v = attachContainer.getChildAt(i);
                int[] pos = {0, 0};
                v.getLocationOnScreen(pos);
                photos.get(i).viewBounds = new Rect(pos[0], pos[1], pos[0] + v.getWidth(), pos[1] + v.getHeight());
                int top = ViewUtils.getViewOffset(v, (View) container.getParent()).y;
                photos.get(i).viewClipTop = top < 0 ? -top : 0;
            }
            PhotoViewer photoViewer = new PhotoViewer(Utils.castToActivity(view.getContext()), photos, index, new PhotoViewer.PhotoViewerCallbackAdapter() { // from class: com.vkontakte.android.NewsItemView.2
                @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallbackAdapter, com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                public void getPhotoBounds(int index2, Rect outRect, Rect outClip) {
                    View v2 = ((ViewGroup) container).getChildAt(index2);
                    if (v2 != null) {
                        int[] loc = {0, 0};
                        v2.getLocationInWindow(loc);
                        outRect.set(loc[0], loc[1], loc[0] + v2.getWidth(), loc[1] + v2.getHeight());
                        View list = v2.getRootView().findViewById(R.id.list);
                        Point offset = V.getViewOffset(v2, list);
                        if (offset.y < 0) {
                            outClip.top = -offset.y;
                        }
                        if (offset.y + v2.getHeight() > list.getHeight()) {
                            outClip.bottom = (offset.y + v2.getHeight()) - list.getHeight();
                        }
                    }
                }

                @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallbackAdapter, com.vkontakte.android.PhotoViewer.PhotoViewerCallback
                public void onDismissed() {
                    container.setTag(R.id.photo_viewer, null);
                }
            });
            container.setTag(R.id.photo_viewer, photoViewer);
            photoViewer.show();
        }
    }
}
