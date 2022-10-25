package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.photos.GetFullPhotoList;
import com.vkontakte.android.attachments.AlbumAttachment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AttachmentViewHolder;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Utils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ThumbsBlockPostDisplayItem extends PostDisplayItem implements PhotoViewer.PhotoViewerCallback {
    public List<ThumbAttachment> all;
    public ArrayList<ThumbAttachment> atts;
    private PhotoViewer photoViewer;
    private ViewGroup photoViewerParent;
    public boolean photosMode;
    public NewsEntry post;
    @NonNull
    private PostInteract postInteract;
    public String referer;
    public boolean useBigVideoView;

    public ThumbsBlockPostDisplayItem(NewsEntry _post, List<ThumbAttachment> _atts, boolean _photosMode, String _referer, List<ThumbAttachment> _all, @NonNull PostInteract postInteract) {
        super(_post);
        this.atts = new ArrayList<>();
        this.useBigVideoView = false;
        this.atts.addAll(_atts);
        this.photosMode = _photosMode;
        this.post = _post;
        this.referer = _referer;
        this.all = _all;
        this.postInteract = postInteract;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 5;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return this.atts.size();
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return ((ImageAttachment) this.atts.get(image)).getImageURL();
    }

    public static View createView(Context context) {
        FrameLayout fl = new FrameLayout(context) { // from class: com.vkontakte.android.ui.posts.ThumbsBlockPostDisplayItem.1
            @Override // android.widget.FrameLayout, android.view.View
            public void onMeasure(int wms, int hms) {
                super.onMeasure(wms, hms);
                setMeasuredDimension(View.MeasureSpec.getSize(wms), getMeasuredHeight());
            }
        };
        FlowLayout f = new FlowLayout(context);
        fl.addView(f);
        ViewHolder holder = new ViewHolder();
        holder.flowLayout = f;
        fl.setTag(holder);
        return fl;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        for (int i = 0; i < holder.flowLayout.getChildCount(); i++) {
            View att = holder.flowLayout.getChildAt(i);
            Object tag = att.getTag();
            if ((tag instanceof String) || (tag instanceof AttachmentViewHolder)) {
                Attachment.reuseView(att, tag.toString());
            }
        }
        ArrayList<Photo> photos = new ArrayList<>();
        for (ThumbAttachment att2 : this.all != null ? this.all : this.atts) {
            if ((att2 instanceof PhotoAttachment) && !(att2 instanceof AlbumAttachment)) {
                photos.add(new Photo((PhotoAttachment) att2));
            }
        }
        Statistic statistic = null;
        Iterator<Attachment> it = this.post.attachments.iterator();
        while (it.hasNext()) {
            Attachment att3 = it.next();
            if (att3 instanceof Statistic) {
                statistic = (Statistic) att3;
            }
        }
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2, 17);
        if (!this.useBigVideoView) {
            lp.topMargin = V.dp(4.0f);
        }
        if (this.atts.size() == this.post.attachments.size()) {
            Attachment last = this.post.attachments.get(this.post.attachments.size() - 1);
            lp.bottomMargin = last instanceof ThumbAttachment ? 0 : V.dp(3.0f);
        } else {
            lp.bottomMargin = 0;
        }
        holder.flowLayout.setLayoutParams(lp);
        holder.flowLayout.removeAllViews();
        int i2 = 0;
        Iterator<ThumbAttachment> it2 = this.atts.iterator();
        while (it2.hasNext()) {
            ThumbAttachment att4 = it2.next();
            if (att4 instanceof VideoAttachment) {
                String context = this.post.ownerID + "|" + (this.post.retweetUID == 0 ? this.post.ownerID : this.post.retweetUID) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.post.postID;
                VideoAttachment videoAttachment = (VideoAttachment) att4;
                videoAttachment.setReferData(this.referer, this.postInteract, context);
                videoAttachment.setStatistic(statistic);
                videoAttachment.setPostOwnerId(this.postOwnerID);
                videoAttachment.setPostId(this.postID);
            }
            View av = ((Attachment) att4).getViewForList(view.getContext(), null);
            if ((att4 instanceof PhotoAttachment) && !(att4 instanceof AlbumAttachment)) {
                int index = this.all != null ? this.all.indexOf(att4) : i2;
                View container = holder.flowLayout;
                if (this.post.type != 11) {
                    av.setOnClickListener(ThumbsBlockPostDisplayItem$$Lambda$1.lambdaFactory$(this, index, photos, container));
                } else {
                    av.setOnClickListener(null);
                    av.setClickable(false);
                }
            }
            i2++;
            FlowLayout.LayoutParams overridenLayoutParams = att4.overrideLayoutParams();
            if (overridenLayoutParams != null) {
                holder.flowLayout.addView(av, overridenLayoutParams);
            } else {
                holder.flowLayout.addView(av);
            }
        }
        if (this.post.type == 6 || this.post.type == 7 || this.post.type == 9) {
            view.setPadding(0, 0, 0, V.dp(4.0f));
        } else {
            view.setPadding(0, 0, 0, 0);
        }
        for (int j = 0; j < holder.flowLayout.getChildCount(); j++) {
            View av2 = holder.flowLayout.getChildAt(j);
            if (this.atts.size() > j && j >= 0) {
                ((ImageAttachment) this.atts.get(j)).bind(av2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBindView$0(int index, ArrayList photos, View container, View v) {
        openPhotoList(index, v, photos, this.post, (ViewGroup) container);
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
        View list;
        View v = this.photoViewerParent == null ? null : this.photoViewerParent.getChildAt(index);
        if (v != null && (list = v.getRootView().findViewById(R.id.list)) != null) {
            int[] loc = {0, 0};
            v.getLocationInWindow(loc);
            outRect.set(loc[0], loc[1], loc[0] + v.getWidth(), loc[1] + v.getHeight());
            Point offset = V.getViewOffset(v, list);
            if (offset.y < 0) {
                outClip.top = -offset.y;
            }
            if (offset.y + v.getHeight() > list.getHeight()) {
                outClip.bottom = (offset.y + v.getHeight()) - list.getHeight();
            }
        }
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public boolean isMoreAvailable() {
        return false;
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void loadMore() {
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void onDismissed() {
        this.photoViewer = null;
        this.photoViewerParent = null;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public AutoPlay getAutoPlayItem() {
        if (this.atts.size() == 1) {
            ThumbAttachment att = this.atts.get(0);
            if ((att instanceof AutoPlay) && ((AutoPlay) att).canAutoPlay()) {
                return (AutoPlay) att;
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        FlowLayout flowLayout;

        private ViewHolder() {
        }
    }

    private void openPhotoList(int index, View view, final ArrayList<Photo> photos, NewsEntry e, ViewGroup attachContainer) {
        if (this.photoViewer == null) {
            this.postInteract.commit(PostInteract.Type.open_photo);
            this.photoViewerParent = attachContainer;
            this.photoViewer = new PhotoViewer(Utils.castToActivity(view.getContext()), photos, index, this);
            if (e != null && ((e.type == 6 || e.type == 7 || e.type == 9) && e.postID > 5)) {
                this.photoViewer.setDisplayTotal(e.postID);
                new GetFullPhotoList(e).setCallback(new SimpleCallback<VKList<Photo>>(view.getContext()) { // from class: com.vkontakte.android.ui.posts.ThumbsBlockPostDisplayItem.2
                    @Override // com.vkontakte.android.api.Callback
                    public void success(VKList<Photo> photos2) {
                        if (ThumbsBlockPostDisplayItem.this.photoViewer != null) {
                            Iterator it = photos.iterator();
                            while (it.hasNext()) {
                                Photo op = (Photo) it.next();
                                Iterator it2 = photos2.iterator();
                                while (true) {
                                    if (it2.hasNext()) {
                                        Photo p = (Photo) it2.next();
                                        if (p.id == op.id && p.ownerID == op.ownerID) {
                                            photos2.remove(p);
                                            break;
                                        }
                                    }
                                }
                            }
                            ThumbsBlockPostDisplayItem.this.photoViewer.appendPhotos(photos2);
                        }
                    }

                    @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse err) {
                        super.fail(err);
                        if (ThumbsBlockPostDisplayItem.this.photoViewer != null) {
                            ThumbsBlockPostDisplayItem.this.photoViewer.dismiss();
                        }
                    }
                }).exec(view.getContext());
            }
            this.photoViewer.show();
        }
    }
}
