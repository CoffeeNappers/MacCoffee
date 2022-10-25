package com.vkontakte.android.fragments.videos;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import com.vk.core.util.ToastUtils;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGetAlbumsByVideo;
import com.vkontakte.android.api.video.VideoSetAlbums;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class VideoAddHelper {
    public static final String ACTION_RELOAD_VIDEO_ALBUMS = "com.vkontakte.android.RELOAD_VIDEO_ALBUMS";
    private Context context;

    public VideoAddHelper(Context context) {
        this.context = context;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.videos.VideoAddHelper$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 extends SimpleCallback<VideoGetAlbumsByVideo.Result> {
        final /* synthetic */ int val$targetID;
        final /* synthetic */ VideoFile val$video;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(Context context, VideoFile videoFile, int i) {
            super(context);
            this.val$video = videoFile;
            this.val$targetID = i;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(final VideoGetAlbumsByVideo.Result result) {
            ArrayList<String> items = new ArrayList<>();
            ArrayList<Boolean> _states = new ArrayList<>();
            if (this.val$video.oid == this.val$targetID) {
                items.add(VideoAddHelper.this.context.getString(R.string.video_album_uploaded));
                _states.add(true);
            }
            items.add(VideoAddHelper.this.context.getString(R.string.video_album_added));
            _states.add(Boolean.valueOf(result.addedAlbums.contains(-2)));
            for (VideoAlbum va : result.userAlbums) {
                items.add(va.title);
                _states.add(Boolean.valueOf(result.addedAlbums.contains(Integer.valueOf(va.id))));
            }
            final boolean[] states = new boolean[_states.size()];
            final boolean[] oldStates = new boolean[_states.size()];
            for (int i = 0; i < _states.size(); i++) {
                states[i] = _states.get(i).booleanValue();
                oldStates[i] = _states.get(i).booleanValue();
            }
            final AlertDialog dlg = new VKAlertDialog.Builder(VideoAddHelper.this.context).setTitle(R.string.video_add_to_album).setMultiChoiceItems((CharSequence[]) items.toArray(new String[items.size()]), states, new DialogInterface.OnMultiChoiceClickListener() { // from class: com.vkontakte.android.fragments.videos.VideoAddHelper.1.1
                @Override // android.content.DialogInterface.OnMultiChoiceClickListener
                public void onClick(DialogInterface dialogInterface, int i2, boolean b) {
                }
            }).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
            dlg.getButton(-1).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.videos.VideoAddHelper.1.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    final ArrayList<Integer> add = new ArrayList<>();
                    final ArrayList<Integer> remove = new ArrayList<>();
                    for (int i2 = 0; i2 < states.length; i2++) {
                        if (states[i2] != oldStates[i2]) {
                            int index = i2 - (AnonymousClass1.this.val$video.oid == AnonymousClass1.this.val$targetID ? 2 : 1);
                            if (oldStates[i2]) {
                                remove.add(Integer.valueOf(index == -1 ? -2 : result.userAlbums.get(index).id));
                            } else {
                                add.add(Integer.valueOf(index == -1 ? -2 : result.userAlbums.get(index).id));
                            }
                        }
                    }
                    if (add.size() > 0 || remove.size() > 0) {
                        new VideoSetAlbums(AnonymousClass1.this.val$targetID, AnonymousClass1.this.val$video.oid, AnonymousClass1.this.val$video.vid, add, remove).setCallback(new ResultlessCallback(VideoAddHelper.this.context) { // from class: com.vkontakte.android.fragments.videos.VideoAddHelper.1.2.1
                            @Override // com.vkontakte.android.api.ResultlessCallback
                            public void success() {
                                ViewUtils.dismissDialogSafety(dlg);
                                Intent intent = new Intent(VideoAddHelper.ACTION_RELOAD_VIDEO_ALBUMS);
                                intent.putExtra("target_id", AnonymousClass1.this.val$targetID);
                                VideoAddHelper.this.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                                ToastUtils.showToast(VideoAddHelper.this.context.getResources().getString(R.string.video_added, AnonymousClass1.this.val$video.title));
                                Videos.notifyVideoMoved(VideoAddHelper.this.context, AnonymousClass1.this.val$video, AnonymousClass1.this.val$targetID, add, remove);
                            }
                        }).wrapProgress(VideoAddHelper.this.context).exec(Looper.getMainLooper());
                    } else {
                        ViewUtils.dismissDialogSafety(dlg);
                    }
                }
            });
            final ListAdapter adapter = dlg.getListView().getAdapter();
            BaseAdapter disableableAdapter = new BaseAdapter() { // from class: com.vkontakte.android.fragments.videos.VideoAddHelper.1.3
                @Override // android.widget.Adapter
                public int getCount() {
                    return adapter.getCount();
                }

                @Override // android.widget.Adapter
                public Object getItem(int i2) {
                    return adapter.getItem(i2);
                }

                @Override // android.widget.Adapter
                public long getItemId(int i2) {
                    return adapter.getItemId(i2);
                }

                @Override // android.widget.BaseAdapter, android.widget.ListAdapter
                public boolean areAllItemsEnabled() {
                    return false;
                }

                @Override // android.widget.BaseAdapter, android.widget.ListAdapter
                public boolean isEnabled(int position) {
                    return (position == 0 && AnonymousClass1.this.val$video.oid == AnonymousClass1.this.val$targetID) ? false : true;
                }

                @Override // android.widget.Adapter
                public View getView(int i2, View view, ViewGroup viewGroup) {
                    View v = adapter.getView(i2, view, viewGroup);
                    if (i2 == 0 && AnonymousClass1.this.val$video.oid == AnonymousClass1.this.val$targetID) {
                        v.setAlpha(0.5f);
                    } else {
                        v.setAlpha(1.0f);
                    }
                    return v;
                }
            };
            dlg.getListView().setAdapter((ListAdapter) disableableAdapter);
        }
    }

    public void showAlbumsDialog(int targetID, VideoFile video) {
        new VideoGetAlbumsByVideo(targetID, video.oid, video.vid).setCallback(new AnonymousClass1(this.context, video, targetID)).wrapProgress(this.context).exec(Looper.getMainLooper());
    }
}
