package com.vk.attachpicker.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.mediastore.AlbumEntry;
import com.vk.attachpicker.widget.CustomSpinner;
import com.vk.attachpicker.widget.LocalImageView;
import com.vk.attachpicker.widget.ViewHolder;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AlbumPickSpinnerAdapter extends BaseAdapter implements SpinnerAdapter {
    private static final int COLOR_TITLE = -10394263;
    private static final int COLOR_TITLE_CURRENT = -11435592;
    private static final int COLOR_TITLE_ITEM = -13750221;
    private final ArrayList<AlbumEntry> albumEntries = new ArrayList<>();
    private Context context;
    private final ArrayList<AlbumEntry> realAlbumEntries;
    private CustomSpinner spinner;
    public static final AlbumEntry PHOTO_ENTRY = new AlbumEntry(-100, Picker.getContext().getString(R.string.picker_other_photo));
    public static final AlbumEntry VIDEO_ENTRY = new AlbumEntry(-200, Picker.getContext().getString(R.string.picker_other_video));
    private static final int DP_18 = Screen.dp(18);

    public AlbumPickSpinnerAdapter(Context context, ArrayList<AlbumEntry> albumEntry, int mediaType) {
        this.context = context;
        this.realAlbumEntries = albumEntry;
        this.albumEntries.addAll(this.realAlbumEntries);
        if (mediaType == 111) {
            this.albumEntries.add(PHOTO_ENTRY);
            this.albumEntries.add(VIDEO_ENTRY);
        } else if (mediaType == 222) {
            this.albumEntries.add(PHOTO_ENTRY);
        } else if (mediaType == 333) {
            this.albumEntries.add(VIDEO_ENTRY);
        }
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.albumEntries.size();
    }

    @Override // android.widget.Adapter
    /* renamed from: getItem */
    public AlbumEntry mo449getItem(int i) {
        return this.albumEntries.get(i);
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        return 0L;
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public View getDropDownView(int i, View convertView, ViewGroup viewGroup) {
        DropDownHolder dropDownHolder;
        if (convertView == null || convertView.getTag() == null) {
            dropDownHolder = new DropDownHolder();
        } else {
            dropDownHolder = (DropDownHolder) convertView.getTag();
        }
        return dropDownHolder.getView(this.context, convertView, i, 0, this.albumEntries.get(i));
    }

    public void setSpinner(CustomSpinner spinner) {
        this.spinner = spinner;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        Holder holder;
        int selectedItemPosition = position;
        if (parent instanceof AdapterView) {
            selectedItemPosition = ((AdapterView) parent).getSelectedItemPosition();
        }
        if (convertView == null || convertView.getTag() == null) {
            holder = new Holder(parent);
        } else {
            holder = (Holder) convertView.getTag();
        }
        return holder.getView(this.context, convertView, selectedItemPosition, 0, this.albumEntries.get(selectedItemPosition));
    }

    /* loaded from: classes2.dex */
    private class Holder extends ViewHolder<AlbumEntry> {
        private View main;
        private final ViewGroup parent;
        private TextView title;

        public Holder(ViewGroup parent) {
            this.parent = parent;
        }

        @Override // com.vk.attachpicker.widget.ViewHolder
        public View initialize(Context context, int viewType) {
            this.main = LayoutInflater.from(context).inflate(R.layout.picker_adapter_album_spinner_selected, this.parent, false);
            this.main.setLayoutParams(new AbsListView.LayoutParams(-2, -1));
            this.title = (TextView) this.main.findViewById(R.id.tv_title);
            return this.main;
        }

        @Override // com.vk.attachpicker.widget.ViewHolder
        public void update(Context context, int position, int viewType, AlbumEntry data) {
            if (data != null) {
                this.title.setText(data.getName());
            }
        }

        @Override // com.vk.attachpicker.widget.ViewHolder
        public void clear() {
        }
    }

    /* loaded from: classes2.dex */
    private class DropDownHolder extends ViewHolder<AlbumEntry> {
        private LinearLayout main;
        private TextView photosCount;
        private LocalImageView thumbnailImageView;
        private TextView title;

        private DropDownHolder() {
        }

        @Override // com.vk.attachpicker.widget.ViewHolder
        public View initialize(Context context, int viewType) {
            this.main = (LinearLayout) LayoutInflater.from(context).inflate(R.layout.picker_adapter_album_spinner, (ViewGroup) null);
            this.title = (TextView) this.main.findViewById(R.id.tv_title);
            this.photosCount = (TextView) this.main.findViewById(R.id.tv_photos_count);
            this.thumbnailImageView = (LocalImageView) this.main.findViewById(R.id.tiv_album_image);
            return this.main;
        }

        @Override // com.vk.attachpicker.widget.ViewHolder
        public void update(Context context, int position, int viewType, AlbumEntry data) {
            if (data != null) {
                this.title.setText(data.getName());
                this.photosCount.setText(String.valueOf(data.getImagesCount()));
                if (data == AlbumPickSpinnerAdapter.PHOTO_ENTRY) {
                    this.thumbnailImageView.setImageResource(R.drawable.picker_ic_gallery_more_photos);
                } else if (data == AlbumPickSpinnerAdapter.VIDEO_ENTRY) {
                    this.thumbnailImageView.setImageResource(R.drawable.picker_ic_gallery_more_videos);
                } else {
                    this.thumbnailImageView.setImage(data.getMediaStoreEntry(), false);
                }
            }
            if (AlbumPickSpinnerAdapter.this.spinner != null && AlbumPickSpinnerAdapter.this.spinner.getSelectedItemPosition() == position) {
                this.title.setTextColor(AlbumPickSpinnerAdapter.COLOR_TITLE_CURRENT);
            } else {
                this.title.setTextColor(AlbumPickSpinnerAdapter.COLOR_TITLE_ITEM);
            }
            if (data.getMediaStoreEntry() != null || data == AlbumPickSpinnerAdapter.PHOTO_ENTRY || data == AlbumPickSpinnerAdapter.VIDEO_ENTRY) {
                this.thumbnailImageView.setVisibility(0);
            } else {
                this.thumbnailImageView.setVisibility(8);
            }
            if (data.getImagesCount() == 0) {
                this.photosCount.setVisibility(8);
            } else {
                this.photosCount.setVisibility(0);
            }
        }

        @Override // com.vk.attachpicker.widget.ViewHolder
        public void clear() {
        }
    }
}
