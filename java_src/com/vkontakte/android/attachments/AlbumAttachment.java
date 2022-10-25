package com.vkontakte.android.attachments;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.FixedSizeFrameLayout;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.HashMap;
import java.util.Set;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class AlbumAttachment extends PhotoAttachment {
    public static final Serializer.Creator<AlbumAttachment> CREATOR = new Serializer.CreatorAdapter<AlbumAttachment>() { // from class: com.vkontakte.android.attachments.AlbumAttachment.3
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public AlbumAttachment mo1087createFromSerializer(Serializer is) {
            int nImgs = is.readInt();
            PhotoAttachment.Image[] imgs = new PhotoAttachment.Image[nImgs];
            for (int i = 0; i < nImgs; i++) {
                imgs[i] = new PhotoAttachment.Image(is.readChar(), is.readString(), is.readInt(), is.readInt());
            }
            return new AlbumAttachment(imgs, is.readInt(), is.readInt(), is.readInt(), is.readString(), is.readInt());
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public AlbumAttachment[] mo1088newArray(int size) {
            return new AlbumAttachment[size];
        }
    };
    public int size;

    public AlbumAttachment(HashMap<String, PhotoAttachment.Image> _images, int _oid, int _pid, int _aid, String _descr, int _size) {
        super(_images, _oid, _pid, _aid, _descr);
        this.size = _size;
        fillEmptyImages();
    }

    public AlbumAttachment(PhotoAttachment.Image[] _images, int _oid, int _pid, int _aid, String _descr, int _size) {
        super(_images, _oid, _pid, _aid, _descr, 0, 0, "", 0, -9000.0d, -9000.0d);
        this.size = _size;
        fillEmptyImages();
    }

    private void fillEmptyImages() {
        PhotoAttachment.Image image = this.images.get("x");
        if (image != null && image.width == 0 && image.height == 0 && image.url != null && image.url.endsWith(".gif")) {
            image.width = 432;
            image.height = 249;
            this.displayW = image.width;
            this.displayH = image.height;
            this.ratio = image.width / image.height;
        }
    }

    @Override // com.vkontakte.android.attachments.PhotoAttachment, com.vkontakte.android.attachments.ThumbAttachment
    public float getRatio() {
        return 1.5f;
    }

    @Override // com.vkontakte.android.attachments.PhotoAttachment, com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View iv = super.getViewForList(context, reuse);
        iv.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.attachments.AlbumAttachment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (AlbumAttachment.this.images.get("m") == null) {
                    Toast.makeText(v.getContext(), (int) R.string.access_error, 0).show();
                    return;
                }
                PhotoAlbum album = new PhotoAlbum();
                album.title = AlbumAttachment.this.descr;
                album.oid = AlbumAttachment.this.oid;
                album.id = AlbumAttachment.this.aid;
                album.thumbURL = AlbumAttachment.this.images.get("m").url;
                album.numPhotos = AlbumAttachment.this.size;
                new PhotoListFragment.Builder(album).go(v.getContext());
            }
        });
        iv.setId(R.id.attach_album_image);
        final View view = Attachment.getReusableView(context, ArgKeys.ALBUM);
        ((TextView) view.findViewById(R.id.attach_title)).setText(this.descr);
        ((TextView) view.findViewById(R.id.attach_subtitle)).setText(context.getResources().getQuantityString(R.plurals.photos, this.size, Integer.valueOf(this.size)));
        ((TextView) view.findViewById(R.id.attach_duration)).setText(String.format("%,d", Integer.valueOf(this.size)));
        if (((ViewGroup) view).getChildAt(0) instanceof ImageView) {
            ((ViewGroup) view).removeViewAt(0);
        }
        ((ViewGroup) view).addView(iv, 0);
        ((FixedSizeFrameLayout) view).setSize(this.displayW, this.displayH);
        ((ImageView) view.findViewById(R.id.attach_album_image)).setImageDrawable(new ColorDrawable(-855310));
        view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.attachments.AlbumAttachment.2
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                if (view.getWidth() < V.dp(120.0f)) {
                    view.findViewById(R.id.attach_album_info).setVisibility(4);
                    view.findViewById(R.id.attach_duration).setVisibility(0);
                    return true;
                }
                view.findViewById(R.id.attach_album_info).setVisibility(0);
                view.findViewById(R.id.attach_duration).setVisibility(4);
                return true;
            }
        });
        return view;
    }

    @Override // com.vkontakte.android.attachments.PhotoAttachment, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        Set<String> keys = this.images.keySet();
        s.writeInt(keys.size());
        for (String k : keys) {
            PhotoAttachment.Image im = this.images.get(k);
            s.writeChar(k.charAt(0));
            s.writeString(im.url);
            s.writeInt(im.width);
            s.writeInt(im.height);
        }
        s.writeInt(this.oid);
        s.writeInt(this.pid);
        s.writeInt(this.aid);
        s.writeString(this.descr);
        s.writeInt(this.size);
    }

    @Override // com.vkontakte.android.attachments.PhotoAttachment
    public String toString() {
        return ArgKeys.ALBUM + this.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.aid;
    }

    @Override // com.vkontakte.android.attachments.PhotoAttachment, com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        ((VKImageView) view.findViewById(R.id.attach_album_image)).load(getImageURL());
    }
}
