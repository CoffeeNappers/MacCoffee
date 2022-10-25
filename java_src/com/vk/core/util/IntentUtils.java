package com.vk.core.util;

import android.app.Activity;
import android.app.Fragment;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.ContentUris;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.attachpicker.util.AsyncTask;
import com.vk.attachpicker.widget.LoadingDialog;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.R;
import com.vkontakte.android.data.UserNotification;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes2.dex */
public class IntentUtils {

    /* loaded from: classes2.dex */
    public interface ResolveCallback {
        void onError();

        void onResolved(File file);
    }

    public static void dispatchImageIntent(Activity activity, int requestCode) {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction("android.intent.action.GET_CONTENT");
        try {
            activity.startActivityForResult(Intent.createChooser(intent, "Select Picture"), requestCode);
        } catch (ActivityNotFoundException e) {
        }
    }

    public static void dispatchImageIntent(Fragment fragment, int requestCode) {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction("android.intent.action.GET_CONTENT");
        fragment.startActivityForResult(Intent.createChooser(intent, "Select Picture"), requestCode);
    }

    public static void dispatchVideoIntent(Fragment fragment, int requestCode) {
        Intent intent = new Intent();
        intent.setType("video/*");
        intent.setAction("android.intent.action.GET_CONTENT");
        fragment.startActivityForResult(Intent.createChooser(intent, "Select Video"), requestCode);
    }

    public static void handleResult(Activity activity, Intent result, ResolveCallback resolveCallback) {
        Uri selectedImageUri = result.getData();
        String path = getPathFromUri(activity, selectedImageUri);
        if (!TextUtils.isEmpty(path)) {
            checkIsMedia(activity, new File(path), resolveCallback);
        } else {
            downloadUri(activity, selectedImageUri, resolveCallback);
        }
    }

    public static String getPathFromUri(Context context, Uri uri) {
        boolean isKitKat = true;
        try {
            if (Build.VERSION.SDK_INT < 19) {
                isKitKat = false;
            }
            if (isKitKat && DocumentsContract.isDocumentUri(context, uri)) {
                if (isExternalStorageDocument(uri)) {
                    String docId = DocumentsContract.getDocumentId(uri);
                    String[] split = docId.split(":");
                    if (!UserNotification.BUTTON_STYLE_PRIMARY.equalsIgnoreCase(split[0])) {
                        return null;
                    }
                    return Environment.getExternalStorageDirectory() + CameraUtilsEffects.FILE_DELIM + split[1];
                } else if (isDownloadsDocument(uri)) {
                    String id = DocumentsContract.getDocumentId(uri);
                    Uri contentUri = ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"), Long.valueOf(id).longValue());
                    return getDataColumn(context, contentUri, null, null);
                } else if (!isMediaDocument(uri)) {
                    return null;
                } else {
                    String docId2 = DocumentsContract.getDocumentId(uri);
                    String[] split2 = docId2.split(":");
                    String type = split2[0];
                    Uri contentUri2 = null;
                    if ("image".equals(type)) {
                        contentUri2 = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
                    } else if ("video".equals(type)) {
                        contentUri2 = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
                    } else if (MimeTypes.BASE_TYPE_AUDIO.equals(type)) {
                        contentUri2 = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
                    }
                    String[] selectionArgs = {split2[1]};
                    return getDataColumn(context, contentUri2, "_id=?", selectionArgs);
                }
            } else if (UriUtil.LOCAL_CONTENT_SCHEME.equalsIgnoreCase(uri.getScheme())) {
                return getDataColumn(context, uri, null, null);
            } else {
                if (!UriUtil.LOCAL_FILE_SCHEME.equalsIgnoreCase(uri.getScheme())) {
                    return null;
                }
                return uri.getPath();
            }
        } catch (Exception e) {
            return null;
        }
    }

    public static String getDataColumn(Context context, Uri uri, String selection, String[] selectionArgs) {
        Cursor cursor = null;
        String[] projection = {"_data"};
        try {
            cursor = context.getContentResolver().query(uri, projection, selection, selectionArgs, null);
            if (cursor != null && cursor.moveToFirst()) {
                int column_index = cursor.getColumnIndexOrThrow("_data");
                String string = cursor.getString(column_index);
            }
            if (cursor != null) {
                cursor.close();
            }
            return null;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    public static boolean isExternalStorageDocument(Uri uri) {
        return "com.android.externalstorage.documents".equals(uri.getAuthority());
    }

    public static boolean isDownloadsDocument(Uri uri) {
        return "com.android.providers.downloads.documents".equals(uri.getAuthority());
    }

    public static boolean isMediaDocument(Uri uri) {
        return "com.android.providers.media.documents".equals(uri.getAuthority());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.core.util.IntentUtils$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public static class AnonymousClass1 extends AsyncTask<File, Float, File> {
        private ProgressDialog dialog;
        final /* synthetic */ Activity val$activity;
        final /* synthetic */ File val$file;
        final /* synthetic */ ResolveCallback val$resolveCallback;

        AnonymousClass1(Activity activity, ResolveCallback resolveCallback, File file) {
            this.val$activity = activity;
            this.val$resolveCallback = resolveCallback;
            this.val$file = file;
        }

        @Override // com.vk.attachpicker.util.AsyncTask
        protected void onPreExecute() {
            this.dialog = LoadingDialog.getInstance(this.val$activity, Integer.valueOf((int) R.string.picker_loading));
            this.dialog.setOnCancelListener(IntentUtils$1$$Lambda$1.lambdaFactory$(this));
            this.dialog.show();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPreExecute$0(DialogInterface dialog1) {
            cancel();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vk.attachpicker.util.AsyncTask
        public void onPostExecute(File file) {
            this.dialog.dismiss();
            if (file != null) {
                this.val$resolveCallback.onResolved(file);
            } else {
                this.val$resolveCallback.onError();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vk.attachpicker.util.AsyncTask
        public File doInBackground(File... args) throws Throwable {
            boolean success = (IntentUtils.getImageMimeType(this.val$file) == null && IntentUtils.getVideoMimeType(this.val$file) == null) ? false : true;
            if (success && this.val$file != null && this.val$file.length() > 0) {
                return this.val$file;
            }
            return null;
        }
    }

    private static void checkIsMedia(Activity activity, File file, ResolveCallback resolveCallback) {
        new AnonymousClass1(activity, resolveCallback, file).execPool(file);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.core.util.IntentUtils$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public static class AnonymousClass2 extends AsyncTask<Uri, Float, File> {
        private ProgressDialog dialog;
        final /* synthetic */ Activity val$activity;
        final /* synthetic */ ResolveCallback val$resolveCallback;
        final /* synthetic */ Uri val$selectedUri;

        AnonymousClass2(Activity activity, ResolveCallback resolveCallback, Uri uri) {
            this.val$activity = activity;
            this.val$resolveCallback = resolveCallback;
            this.val$selectedUri = uri;
        }

        @Override // com.vk.attachpicker.util.AsyncTask
        protected void onPreExecute() {
            this.dialog = LoadingDialog.getInstance(this.val$activity, Integer.valueOf((int) R.string.picker_loading));
            this.dialog.setOnCancelListener(IntentUtils$2$$Lambda$1.lambdaFactory$(this));
            this.dialog.show();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPreExecute$0(DialogInterface dialog1) {
            cancel();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vk.attachpicker.util.AsyncTask
        public void onPostExecute(File file) {
            this.dialog.dismiss();
            if (file != null) {
                this.val$resolveCallback.onResolved(file);
            } else {
                this.val$resolveCallback.onError();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vk.attachpicker.util.AsyncTask
        public File doInBackground(Uri... args) throws Throwable {
            boolean success = false;
            File file = FileUtils.getTempFile();
            FileOutputStream fout = new FileOutputStream(file);
            InputStream in = null;
            try {
                in = this.val$activity.getContentResolver().openInputStream(this.val$selectedUri);
                byte[] data = new byte[1024];
                while (true) {
                    int count = in.read(data, 0, 1024);
                    if (count == -1 || isCanceled()) {
                        break;
                    }
                    fout.write(data, 0, count);
                }
                String imageMimeType = IntentUtils.getImageMimeType(file);
                String videoMimeType = IntentUtils.getVideoMimeType(file);
                if (imageMimeType != null || videoMimeType != null) {
                    success = true;
                }
                if (imageMimeType != null) {
                    file = IntentUtils.renameByMimeType(file, imageMimeType);
                } else if (videoMimeType != null) {
                    file = IntentUtils.renameByMimeType(file, videoMimeType);
                } else {
                    throw new IOException("Not an media");
                }
            } catch (Throwable th) {
                try {
                    FileUtils.deleteFile(file);
                    success = false;
                    if (in != null) {
                        try {
                            in.close();
                        } catch (IOException e) {
                        }
                    }
                    if (fout != null) {
                        try {
                            fout.close();
                        } catch (IOException e2) {
                        }
                    }
                } finally {
                    if (in != null) {
                        try {
                            in.close();
                        } catch (IOException e3) {
                        }
                    }
                    if (fout != null) {
                        try {
                            fout.close();
                        } catch (IOException e4) {
                        }
                    }
                }
            }
            if (!success || file == null || file.length() <= 0) {
                return null;
            }
            return file;
        }
    }

    private static void downloadUri(Activity activity, Uri selectedUri, ResolveCallback resolveCallback) {
        new AnonymousClass2(activity, resolveCallback, selectedUri).execPool(selectedUri);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getImageMimeType(File file) {
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file.getAbsolutePath(), options);
            if (options.outWidth != -1 && options.outHeight != -1) {
                return options.outMimeType;
            }
            return null;
        } catch (Throwable th) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getVideoMimeType(File file) {
        try {
            MediaMetadataRetriever m = new MediaMetadataRetriever();
            m.setDataSource(Uri.fromFile(file).getEncodedPath());
            String duration = m.extractMetadata(9);
            if (Long.parseLong(duration) <= 0) {
                return null;
            }
            return m.extractMetadata(12);
        } catch (Throwable th) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static File renameByMimeType(File file, String mimeType) {
        String ext = mimeType.substring(mimeType.lastIndexOf(CameraUtilsEffects.FILE_DELIM) + 1);
        String path = file.getParent();
        String name = file.getName();
        String newName = name.substring(0, name.lastIndexOf(".")) + '.' + ext;
        File newFile = new File(path, newName);
        return file.renameTo(newFile) ? newFile : file;
    }
}
