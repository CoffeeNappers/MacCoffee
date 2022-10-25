package com.vk.attachpicker.mediastore;

import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import com.vk.attachpicker.Picker;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public class MediaStoreController {
    public static final int MEDIA_TYPE_PHOTO = 222;
    public static final int MEDIA_TYPE_PHOTO_AND_VIDEO = 111;
    public static final int MEDIA_TYPE_VIDEO = 333;
    private static final String TAG = "MediaStoreUtils";
    private static ArrayList<AlbumEntry> lastLoadedPhoto;
    private static ArrayList<AlbumEntry> lastLoadedPhotoVideo;
    private static ArrayList<AlbumEntry> lastLoadedVideo;
    private static final ExecutorService mediaStoreExecutor = Executors.newSingleThreadExecutor();
    private static final Handler uiHandler = new Handler(Looper.getMainLooper());
    private static final String cameraFolder = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).getAbsolutePath() + "/Camera/";
    private static final Comparator<MediaStoreEntry> descDateComparator = MediaStoreController$$Lambda$3.lambdaFactory$();
    private static final String[] PHOTOS_PROJECTION = {"_id", "bucket_id", "bucket_display_name", "_data", "datetaken", FragmentWrapperActivity.ORIENTATION_KEY};
    private static final String[] VIDEO_PROJECTION = {"_id", "datetaken", "_data", "duration", "bucket_display_name", "bucket_id"};

    /* loaded from: classes2.dex */
    public interface MediaStoreCallback {
        void onLoaded(ArrayList<AlbumEntry> arrayList);
    }

    /* loaded from: classes2.dex */
    public interface MediaStoreMediaEntryCallback {
        void onLoaded(MediaStoreEntry mediaStoreEntry);
    }

    public static /* synthetic */ int lambda$static$0(MediaStoreEntry lhs, MediaStoreEntry rhs) {
        if (lhs.dateTaken > rhs.dateTaken) {
            return -1;
        }
        if (lhs.dateTaken < rhs.dateTaken) {
            return 1;
        }
        return 0;
    }

    private static AlbumEntry findCameraBucket(ArrayList<AlbumEntry> buckets) {
        if (buckets == null) {
            return null;
        }
        Iterator<AlbumEntry> it = buckets.iterator();
        while (it.hasNext()) {
            AlbumEntry e = it.next();
            if (e.isCameraBucket()) {
                return e;
            }
        }
        return null;
    }

    private static void processMediaStoreItem(ArrayList<AlbumEntry> albumsList, HashMap<Integer, AlbumEntry> albumsMap, AlbumEntry allPhotosAlbum, MediaStoreEntry mediaStoreEntry, int bucketId, String bucketName, String path) {
        if (!albumsMap.containsKey(Integer.valueOf(bucketId))) {
            AlbumEntry albumEntry = new AlbumEntry(bucketId, bucketName);
            albumsMap.put(Integer.valueOf(bucketId), albumEntry);
            albumsList.add(albumEntry);
            if (path.startsWith(cameraFolder)) {
                albumEntry.setCameraBucket(true);
            }
        }
        albumsMap.get(Integer.valueOf(bucketId)).addImage(mediaStoreEntry);
        allPhotosAlbum.addImage(mediaStoreEntry);
    }

    private static ArrayList<AlbumEntry> loadMediaStore(int mediaType, long onlyLastNMilliseconds) {
        int titleResId;
        ArrayList<AlbumEntry> albumsList = new ArrayList<>();
        HashMap<Integer, AlbumEntry> albumsMap = new HashMap<>();
        if (mediaType == 222) {
            titleResId = R.string.picker_all_photos;
        } else if (mediaType == 333) {
            titleResId = R.string.picker_all_videos;
        } else {
            titleResId = R.string.picker_all_photos_videos;
        }
        AlbumEntry allPhotosAlbum = new AlbumEntry(-1, Picker.getContext().getString(titleResId));
        albumsList.add(allPhotosAlbum);
        albumsMap.put(Integer.valueOf(allPhotosAlbum.getId()), allPhotosAlbum);
        if (mediaType == 111 || mediaType == 222) {
            Cursor photosCursor = MediaStore.Images.Media.query(Picker.getContext().getContentResolver(), MediaStore.Images.Media.EXTERNAL_CONTENT_URI, PHOTOS_PROJECTION, "", null, null);
            loadPhotos(photosCursor, albumsList, albumsMap, allPhotosAlbum);
        }
        if (mediaType == 111 || mediaType == 333) {
            Cursor videoCursor = Picker.getContext().getContentResolver().query(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, VIDEO_PROJECTION, null, null, null);
            loadVideos(videoCursor, albumsList, albumsMap, allPhotosAlbum);
        }
        Iterator<AlbumEntry> it = albumsList.iterator();
        while (it.hasNext()) {
            AlbumEntry e = it.next();
            Collections.sort(e.getBucketImages(), descDateComparator);
            if (e.getBucketImages() != null && e.getBucketImages().size() > 0) {
                e.setMediaStoreEntry(e.getBucketImages().get(0));
            }
        }
        if (allPhotosAlbum.getImagesCount() == 0) {
            albumsList.remove(allPhotosAlbum);
            albumsMap.remove(allPhotosAlbum);
        }
        AlbumEntry cameraAlbum = findCameraBucket(albumsList);
        if (cameraAlbum != null && albumsList.size() > 1) {
            albumsList.remove(cameraAlbum);
            albumsList.add(1, cameraAlbum);
        }
        return albumsList;
    }

    public static void findPhoto(final Uri uri, final MediaStoreMediaEntryCallback entryCallback) {
        load(222, new MediaStoreCallback() { // from class: com.vk.attachpicker.mediastore.MediaStoreController.1
            @Override // com.vk.attachpicker.mediastore.MediaStoreController.MediaStoreCallback
            public void onLoaded(ArrayList<AlbumEntry> mediaStore) {
                if (mediaStore == null || mediaStore.isEmpty()) {
                    entryCallback.onLoaded(null);
                    return;
                }
                List<MediaStoreEntry> entries = mediaStore.get(0).getBucketImages();
                for (MediaStoreEntry entry : entries) {
                    if (entry.path.equals(uri)) {
                        entryCallback.onLoaded(entry);
                        return;
                    }
                }
                entryCallback.onLoaded(null);
            }
        });
    }

    public static ArrayList<AlbumEntry> loadPhotos(Cursor cursor, ArrayList<AlbumEntry> albumsList, HashMap<Integer, AlbumEntry> albumsMap, AlbumEntry allPhotosAlbum) {
        if (cursor != null) {
            int imageIdColumn = cursor.getColumnIndex("_id");
            int bucketIdColumn = cursor.getColumnIndex("bucket_id");
            int bucketNameColumn = cursor.getColumnIndex("bucket_display_name");
            int dataColumn = cursor.getColumnIndex("_data");
            int dateColumn = cursor.getColumnIndex("datetaken");
            int orientationColumn = cursor.getColumnIndex(FragmentWrapperActivity.ORIENTATION_KEY);
            ArrayList<MediaStoreEntry> entries = new ArrayList<>();
            while (cursor.moveToNext()) {
                try {
                    int imageId = cursor.getInt(imageIdColumn);
                    int bucketId = cursor.getInt(bucketIdColumn);
                    String bucketName = cursor.getString(bucketNameColumn);
                    String path = cursor.getString(dataColumn);
                    long dateTaken = cursor.getLong(dateColumn);
                    int orientation = cursor.getInt(orientationColumn);
                    if (path != null && path.length() != 0) {
                        MediaStoreEntry mediaStoreEntry = new MediaStoreEntry(imageId, Uri.parse("file://" + path), orientation, dateTaken);
                        processMediaStoreItem(albumsList, albumsMap, allPhotosAlbum, mediaStoreEntry, bucketId, bucketName, path);
                        entries.add(mediaStoreEntry);
                    }
                } catch (Exception e) {
                    L.e(e, TAG);
                }
            }
            cursor.close();
            return albumsList;
        }
        return new ArrayList<>();
    }

    public static ArrayList<AlbumEntry> loadVideos(Cursor cursor, ArrayList<AlbumEntry> albumsList, HashMap<Integer, AlbumEntry> albumsMap, AlbumEntry allPhotosAlbum) {
        if (cursor != null) {
            int imageIdColumn = cursor.getColumnIndex("_id");
            int bucketIdColumn = cursor.getColumnIndex("bucket_id");
            int bucketNameColumn = cursor.getColumnIndex("bucket_display_name");
            int dataColumn = cursor.getColumnIndex("_data");
            int dateColumn = cursor.getColumnIndex("datetaken");
            int durationColumn = cursor.getColumnIndex("duration");
            ArrayList<MediaStoreEntry> entries = new ArrayList<>();
            while (cursor.moveToNext()) {
                try {
                    int imageId = cursor.getInt(imageIdColumn);
                    int bucketId = cursor.getInt(bucketIdColumn);
                    String bucketName = cursor.getString(bucketNameColumn);
                    String path = cursor.getString(dataColumn);
                    long dateTaken = cursor.getLong(dateColumn);
                    long duration = cursor.getLong(durationColumn);
                    if (path != null && path.length() != 0 && (path.endsWith("mp4") || path.endsWith("3gp"))) {
                        MediaStoreEntry mediaStoreEntry = new MediaStoreEntry(imageId, Uri.parse("file://" + path), duration, dateTaken);
                        processMediaStoreItem(albumsList, albumsMap, allPhotosAlbum, mediaStoreEntry, bucketId, bucketName, path);
                        entries.add(mediaStoreEntry);
                    }
                } catch (Exception e) {
                    L.e(e, TAG);
                }
            }
            cursor.close();
            return albumsList;
        }
        return new ArrayList<>();
    }

    private static ArrayList<AlbumEntry> filterLastNMilliseconds(ArrayList<AlbumEntry> albumEntries, long lastNMilliseconds) {
        if (lastNMilliseconds > 0) {
            ArrayList<AlbumEntry> newAlbums = new ArrayList<>();
            Iterator<AlbumEntry> it = albumEntries.iterator();
            while (it.hasNext()) {
                AlbumEntry a = it.next();
                if (a.getBucketImages() != null && a.getBucketImages().size() > 0) {
                    AlbumEntry newAlbum = null;
                    Iterator<MediaStoreEntry> it2 = a.getBucketImages().iterator();
                    while (it2.hasNext()) {
                        MediaStoreEntry e = it2.next();
                        if (System.currentTimeMillis() - e.dateTaken >= lastNMilliseconds) {
                            break;
                        }
                        if (newAlbum == null) {
                            newAlbum = new AlbumEntry(a.getId(), a.getName());
                            newAlbum.setCameraBucket(a.isCameraBucket());
                            newAlbum.setMediaStoreEntry(a.getMediaStoreEntry());
                        }
                        newAlbum.addImage(e);
                    }
                    if (newAlbum != null) {
                        newAlbums.add(newAlbum);
                    }
                }
            }
            return newAlbums;
        }
        return albumEntries;
    }

    public static void load(int mediaType, MediaStoreCallback callback) {
        load(mediaType, 0L, callback);
    }

    public static void load(int mediaType, long lastNMilliseconds, MediaStoreCallback callback) {
        mediaStoreExecutor.submit(MediaStoreController$$Lambda$1.lambdaFactory$(mediaType, lastNMilliseconds, callback));
    }

    public static /* synthetic */ void lambda$load$2(int mediaType, long lastNMilliseconds, MediaStoreCallback callback) {
        ArrayList<AlbumEntry> result = loadMediaStore(mediaType, lastNMilliseconds);
        ArrayList<AlbumEntry> filteredResult = filterLastNMilliseconds(result, lastNMilliseconds);
        uiHandler.post(MediaStoreController$$Lambda$2.lambdaFactory$(mediaType, result, callback, filteredResult));
    }

    public static /* synthetic */ void lambda$null$1(int mediaType, ArrayList result, MediaStoreCallback callback, ArrayList filteredResult) {
        if (mediaType == 111) {
            lastLoadedPhotoVideo = result;
        } else if (mediaType == 222) {
            lastLoadedPhoto = result;
        } else if (mediaType == 333) {
            lastLoadedVideo = result;
        }
        callback.onLoaded(filteredResult);
    }

    public static ArrayList<AlbumEntry> lastLoadedPhotoVideo() {
        return lastLoadedPhotoVideo;
    }

    public static ArrayList<AlbumEntry> lastLoadedPhoto() {
        return lastLoadedPhoto;
    }

    public static ArrayList<AlbumEntry> lastLoadedVideo() {
        return lastLoadedVideo;
    }
}
