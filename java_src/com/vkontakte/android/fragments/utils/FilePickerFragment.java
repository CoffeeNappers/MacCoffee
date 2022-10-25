package com.vkontakte.android.fragments.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcelable;
import android.os.StatFs;
import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.facebook.drawee.drawable.ScalingUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.BaseDocument;
import com.vkontakte.android.attachments.PendingDocumentAttachment;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.VKToolbarFragment;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.EmptyView;
import com.vkontakte.android.ui.holder.documents.DocumentHolder;
import com.vkontakte.android.upload.Upload;
import io.reactivex.annotations.SchedulerSupport;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class FilePickerFragment extends VKToolbarFragment implements BackListener {
    private File currentDir;
    private EmptyView empty;
    private LinearLayoutManager layoutManager;
    private UsableRecyclerView list;
    private ArrayList<ListItem> items = new ArrayList<>();
    private FileListAdapter adapter = new FileListAdapter();
    private ArrayList<HistoryEntry> history = new ArrayList<>();
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.utils.FilePickerFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context arg0, Intent intent) {
            Log.i("vk", "Receive " + intent);
            Runnable r = new Runnable() { // from class: com.vkontakte.android.fragments.utils.FilePickerFragment.1.1
                @Override // java.lang.Runnable
                public void run() {
                    if (FilePickerFragment.this.currentDir == null) {
                        FilePickerFragment.this.listRoots();
                    } else {
                        FilePickerFragment.this.listFiles(FilePickerFragment.this.currentDir);
                    }
                }
            };
            if ("android.intent.action.MEDIA_UNMOUNTED".equals(intent.getAction())) {
                ViewUtils.postDelayed(r, 1000L);
            } else {
                r.run();
            }
        }
    };

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(FilePickerFragment.class);
        }

        public Builder setSizeLimit(long sizeLimit) {
            this.args.putLong("size_limit", sizeLimit);
            return this;
        }
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        FrameLayout contentView = new FrameLayout(getActivity());
        contentView.setBackgroundColor(-1);
        this.list = new UsableRecyclerView(getActivity());
        this.list.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        this.list.setClipToPadding(false);
        UsableRecyclerView usableRecyclerView = this.list;
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(inflater.getContext());
        this.layoutManager = linearLayoutManager;
        usableRecyclerView.setLayoutManager(linearLayoutManager);
        this.list.setAdapter(this.adapter);
        this.list.setSelector(R.drawable.highlight);
        contentView.addView(this.list);
        this.empty = EmptyView.create(getActivity());
        this.empty.setButtonVisible(false);
        this.empty.setText(R.string.no_files);
        contentView.addView(this.empty);
        this.list.setEmptyView(this.empty);
        return contentView;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        listRoots();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.intent.action.MEDIA_BAD_REMOVAL");
        filter.addAction("android.intent.action.MEDIA_CHECKING");
        filter.addAction("android.intent.action.MEDIA_EJECT");
        filter.addAction("android.intent.action.MEDIA_MOUNTED");
        filter.addAction("android.intent.action.MEDIA_NOFS");
        filter.addAction("android.intent.action.MEDIA_REMOVED");
        filter.addAction("android.intent.action.MEDIA_SHARED");
        filter.addAction("android.intent.action.MEDIA_UNMOUNTABLE");
        filter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        filter.addDataScheme(UriUtil.LOCAL_FILE_SCHEME);
        VKApplication.context.registerReceiver(this.receiver, filter);
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        VKApplication.context.unregisterReceiver(this.receiver);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showErrorBox(String error) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.error).setMessage(error).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean listFiles(File dir) {
        if (!dir.canRead()) {
            if ((dir.getAbsolutePath().startsWith(Environment.getExternalStorageDirectory().toString()) || dir.getAbsolutePath().startsWith("/sdcard") || dir.getAbsolutePath().startsWith("/mnt/sdcard")) && !Environment.getExternalStorageState().equals("mounted") && !Environment.getExternalStorageState().equals("mounted_ro")) {
                this.currentDir = dir;
                this.items.clear();
                String state = Environment.getExternalStorageState();
                if ("shared".equals(state)) {
                    this.empty.setText(R.string.file_usb_active);
                } else {
                    this.empty.setText(R.string.file_not_mounted);
                }
                updateList();
                return true;
            }
            showErrorBox(getString(R.string.access_error));
            return false;
        }
        this.empty.setText(R.string.no_files);
        try {
            File[] files = dir.listFiles();
            if (files == null) {
                showErrorBox(getString(R.string.unknown_error));
                return false;
            }
            this.currentDir = dir;
            this.items.clear();
            Arrays.sort(files, new Comparator<File>() { // from class: com.vkontakte.android.fragments.utils.FilePickerFragment.2
                @Override // java.util.Comparator
                public int compare(File lhs, File rhs) {
                    if (lhs.isDirectory() != rhs.isDirectory()) {
                        return lhs.isDirectory() ? -1 : 1;
                    }
                    return lhs.getName().compareToIgnoreCase(rhs.getName());
                }
            });
            for (File file : files) {
                if (!file.getName().startsWith(".")) {
                    ListItem item = new ListItem();
                    item.title = file.getName();
                    item.file = file;
                    if (file.isDirectory()) {
                        item.icon = R.drawable.ic_directory;
                    } else {
                        String fname = file.getName();
                        String[] sp = fname.split("\\.");
                        item.ext = sp.length > 1 ? sp[sp.length - 1] : "?";
                        item.subtitle = Global.langFileSize(file.length(), getResources());
                        if (file.lastModified() > 0) {
                            item.subtitle += ", " + TimeUtils.langDateRelativeNoDiff((int) (file.lastModified() / 1000), getResources());
                        }
                        String fname2 = fname.toLowerCase();
                        if (fname2.endsWith(".jpg") || fname2.endsWith(".png") || fname2.endsWith(".gif") || fname2.endsWith(".jpeg")) {
                            item.thumb = new Uri.Builder().scheme(UriUtil.LOCAL_FILE_SCHEME).path(file.getAbsolutePath()).appendQueryParameter("max_w", Global.scale(64.0f) + "").appendQueryParameter("max_h", Global.scale(48.0f) + "").build().toString().replace("file:/", "file:///");
                        }
                    }
                    this.items.add(item);
                }
            }
            updateList();
            return true;
        } catch (Exception x) {
            Log.w("vk", x);
            showErrorBox(x.getLocalizedMessage());
            return false;
        }
    }

    private String getRootSubtitle(String path) {
        StatFs stat = new StatFs(path);
        long total = stat.getBlockCount() * stat.getBlockSize();
        long free = stat.getAvailableBlocks() * stat.getBlockSize();
        Log.i("vk", path + ": " + free + CameraUtilsEffects.FILE_DELIM + total);
        return total == 0 ? "" : getString(R.string.file_free_subtitle, new Object[]{Global.langFileSize(free, getResources()), Global.langFileSize(total, getResources())});
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void listRoots() {
        setTitle(R.string.pick_file);
        this.currentDir = null;
        this.items.clear();
        String extStorage = Environment.getExternalStorageDirectory().getAbsolutePath();
        ListItem ext = new ListItem();
        ext.title = getString(Environment.isExternalStorageRemovable() ? R.string.file_sd_card : R.string.file_internal_storage);
        ext.icon = Environment.isExternalStorageRemovable() ? R.drawable.ic_external_storage : R.drawable.ic_storage;
        ext.subtitle = getRootSubtitle(extStorage);
        ext.file = Environment.getExternalStorageDirectory();
        this.items.add(ext);
        try {
            BufferedReader reader = new BufferedReader(new FileReader("/proc/mounts"));
            HashMap<String, ArrayList<String>> aliases = new HashMap<>();
            ArrayList<String> result = new ArrayList<>();
            String extDevice = null;
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                } else if (line.contains("/mnt") || line.contains("/storage") || line.contains("/sdcard")) {
                    if (!line.contains("asec") && !line.contains("tmpfs") && !line.contains(SchedulerSupport.NONE)) {
                        String[] info = line.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                        if (!aliases.containsKey(info[0])) {
                            aliases.put(info[0], new ArrayList<>());
                        }
                        aliases.get(info[0]).add(info[1]);
                        if (info[1].equals(extStorage)) {
                            extDevice = info[0];
                        }
                        result.add(info[1]);
                    }
                }
            }
            reader.close();
            if (extDevice != null) {
                result.removeAll(aliases.get(extDevice));
                Iterator<String> it = result.iterator();
                while (it.hasNext()) {
                    String path = it.next();
                    try {
                        boolean isSd = Utils.isSdCardPath(path);
                        ListItem item = new ListItem();
                        item.title = getString(isSd ? R.string.file_sd_card : R.string.file_external_storage);
                        item.icon = R.drawable.ic_external_storage;
                        item.subtitle = getRootSubtitle(path);
                        item.file = new File(path);
                        this.items.add(item);
                    } catch (Exception e) {
                    }
                }
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
        ListItem fs = new ListItem();
        fs.title = CameraUtilsEffects.FILE_DELIM;
        fs.subtitle = getString(R.string.file_system_root);
        fs.icon = R.drawable.ic_directory;
        fs.file = new File(CameraUtilsEffects.FILE_DELIM);
        this.items.add(fs);
        updateList();
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 16908332) {
            getActivity().finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.history.size() > 0) {
            HistoryEntry he = this.history.remove(this.history.size() - 1);
            setTitle(he.title);
            if (he.dir != null) {
                listFiles(he.dir);
            } else {
                listRoots();
            }
            this.layoutManager.scrollToPositionWithOffset(he.scrollItem, he.scrollOffset);
            return true;
        }
        return false;
    }

    private void updateList() {
        this.adapter.notifyDataSetChanged();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ViewHolder extends DocumentHolder<ListItem> {
        int viewType;

        public ViewHolder(@NonNull Context context, int viewType) {
            super(context);
            this.viewType = viewType;
            switch (viewType) {
                case 0:
                    this.thumb.setActualScaleType(ScalingUtils.ScaleType.CENTER);
                    return;
                case 1:
                    this.thumb.setActualScaleType(ScalingUtils.ScaleType.CENTER_CROP);
                    return;
                default:
                    return;
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.ui.holder.documents.DocumentHolder
        public void setInfo(TextView info, ListItem doc) {
            super.setInfo(info, (TextView) doc);
            ViewUtils.setText(info, doc.subtitle, true);
            this.thumb.loadResource(doc.icon);
        }

        @Override // com.vkontakte.android.ui.holder.documents.DocumentHolder, me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            File file = ((ListItem) getItem()).file;
            if (file.isDirectory()) {
                HistoryEntry he = new HistoryEntry();
                he.scrollItem = FilePickerFragment.this.layoutManager.findFirstVisibleItemPosition();
                he.scrollOffset = FilePickerFragment.this.list.getChildAt(0).getTop();
                he.dir = FilePickerFragment.this.currentDir;
                he.title = FilePickerFragment.this.getToolbar().getTitle().toString();
                if (FilePickerFragment.this.listFiles(file)) {
                    FilePickerFragment.this.history.add(he);
                    FilePickerFragment.this.setTitle(((ListItem) getItem()).title);
                    FilePickerFragment.this.layoutManager.scrollToPosition(0);
                }
            } else if (!file.canRead()) {
                FilePickerFragment.this.showErrorBox(getString(R.string.access_error));
            } else {
                if (FilePickerFragment.this.getArguments().containsKey("size_limit")) {
                    long lim = FilePickerFragment.this.getArguments().getLong("size_limit", 0L);
                    if (file.length() > lim) {
                        FilePickerFragment.this.showErrorBox(getString(R.string.file_upload_limit, Global.langFileSize(lim, getResources())));
                        return;
                    }
                }
                String path = new Uri.Builder().scheme(UriUtil.LOCAL_FILE_SCHEME).path(file.getAbsolutePath()).build().toString();
                String[] ext = path.split("\\.");
                Parcelable att = new PendingDocumentAttachment(file.getName(), file.getAbsolutePath(), (int) file.length(), ((ListItem) getItem()).thumb != null ? path : null, 0, Upload.getNewID(), ext[ext.length - 1]);
                ArrayList<Parcelable> a = new ArrayList<>();
                a.add(att);
                Intent result = new Intent();
                result.putParcelableArrayListExtra("files", a);
                FilePickerFragment.this.getActivity().setResult(-1, result);
                FilePickerFragment.this.getActivity().finish();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class FileListAdapter extends UsableRecyclerView.Adapter<DocumentHolder<ListItem>> {
        private FileListAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int pos) {
            return (((ListItem) FilePickerFragment.this.items.get(pos)).thumb != null || ((ListItem) FilePickerFragment.this.items.get(pos)).icon == 0) ? 1 : 0;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public DocumentHolder<ListItem> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new ViewHolder(parent.getContext(), viewType);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(DocumentHolder<ListItem> holder, int position) {
            holder.bind(FilePickerFragment.this.items.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return FilePickerFragment.this.items.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int item) {
            return ((ListItem) FilePickerFragment.this.items.get(item)).thumb != null ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int item, int image) {
            return ((ListItem) FilePickerFragment.this.items.get(item)).thumb;
        }
    }

    /* loaded from: classes3.dex */
    public static class ListItem implements BaseDocument {
        File file;
        int icon;
        String thumb;
        String title;
        String subtitle = "";
        String ext = "";

        @Override // com.vkontakte.android.api.BaseDocument
        public String getTitle() {
            return this.title;
        }

        @Override // com.vkontakte.android.api.BaseDocument
        public String getExt() {
            return this.ext;
        }

        @Override // com.vkontakte.android.api.BaseDocument
        public int getSize() {
            return 0;
        }

        @Override // com.vkontakte.android.api.BaseDocument
        public int getDate() {
            return 0;
        }
    }

    /* loaded from: classes3.dex */
    private class HistoryEntry {
        File dir;
        int scrollItem;
        int scrollOffset;
        String title;

        private HistoryEntry() {
        }
    }
}
