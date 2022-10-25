package com.vk.core.util;

import android.os.Environment;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
/* loaded from: classes2.dex */
public class FileUtils {
    private static final String BASE_DIR = "VK";
    private static final String BASE_HIDDEN_DIR = ".vkontakte";
    private static final long DELETE_TIMEOUT = 259200000;
    private static final String DOWNLOADS_DIR = "Downloads";
    private static final String PHOTOS_DIR = "Photos";
    public static final String TEMP_AYUV_PREFIX = "TEMP_AYUV_";
    public static final String TEMP_GRAF_PREFIX = "GRAF_";
    public static final String TEMP_TRIM_PREFIX = "TEMP_TRIM_";
    private static final String TEMP_UPLOADS_DIR = "TempUploads";
    private static final String VIDEOS_DIR = "Videos";
    private static final String VIDEO_CACHE_DIR = "vcache";

    public static File getDir(File baseFolder, String folderName) {
        File dir = new File(baseFolder, folderName);
        checkFolder(dir);
        return dir;
    }

    public static File getVKDir() {
        File basePath = Environment.getExternalStorageDirectory();
        checkFolder(basePath);
        return getDir(basePath, BASE_DIR);
    }

    private static File getHiddenDir() {
        File basePath = Environment.getExternalStorageDirectory();
        checkFolder(basePath);
        return getDir(basePath, BASE_HIDDEN_DIR);
    }

    private static File getPhotosDir() {
        return getDir(getVKDir(), PHOTOS_DIR);
    }

    private static File getVideosDir() {
        return getDir(getVKDir(), VIDEOS_DIR);
    }

    private static File getDownloadsDir() {
        return getDir(getVKDir(), DOWNLOADS_DIR);
    }

    public static File getPhotoFile() {
        return new File(getPhotosDir(), System.currentTimeMillis() + ".jpg");
    }

    public static File getVideoFile() {
        return new File(getVideosDir(), System.currentTimeMillis() + ".mp4");
    }

    public static File getPhotoFile(String name) {
        return new File(getPhotosDir(), name + ".jpg");
    }

    public static File getVideoFile(String name) {
        return new File(getVideosDir(), name + ".mp4");
    }

    public static File getDownloadFile(String name) {
        return new File(getDownloadsDir(), name);
    }

    public static File getVideoCacheDir() {
        return getDir(getHiddenDir(), VIDEO_CACHE_DIR);
    }

    public static File getUploadsDir() {
        return getDir(getHiddenDir(), TEMP_UPLOADS_DIR);
    }

    public static File getTempUploadFile(@Nullable String name, @Nullable String extension) {
        if (name == null) {
            name = String.valueOf(System.currentTimeMillis());
        }
        if (extension == null) {
            extension = "tmp";
        }
        return new File(getUploadsDir(), name + "." + extension);
    }

    public static File getTempUploadFile(@Nullable String extension) {
        return getTempUploadFile(null, extension);
    }

    public static File getTempUploadAudioFile() {
        return getTempUploadFile("mp3");
    }

    public static File getTempUploadJpgImageFile() {
        return getTempUploadFile("jpg");
    }

    public static File getTempUploadPngImageFile() {
        return getTempUploadFile("png");
    }

    public static File getTempUploadVideoFile() {
        return getTempUploadFile("mp4");
    }

    public static void clearOldFilesInUploads() {
        File[] listFiles;
        try {
            for (File f : getUploadsDir().listFiles()) {
                if (System.currentTimeMillis() - f.lastModified() > DELETE_TIMEOUT) {
                    deleteFile(f);
                }
            }
        } catch (Exception e) {
        }
    }

    public static File getTempFile() {
        File outputFolder = new File(Environment.getExternalStorageDirectory(), BASE_HIDDEN_DIR);
        File output = new File(outputFolder, TEMP_TRIM_PREFIX + System.currentTimeMillis() + ".tmp");
        if (!outputFolder.exists()) {
            outputFolder.mkdir();
        }
        return output;
    }

    public static File getTempTrimVideoFile() {
        File outputFolder = new File(Environment.getExternalStorageDirectory(), BASE_HIDDEN_DIR);
        File output = new File(outputFolder, TEMP_TRIM_PREFIX + System.currentTimeMillis() + ".mp4");
        if (!outputFolder.exists()) {
            outputFolder.mkdir();
        }
        return output;
    }

    public static File getTempGraffitiFile() {
        File outputFolder = new File(Environment.getExternalStorageDirectory(), BASE_HIDDEN_DIR);
        File output = new File(outputFolder, TEMP_GRAF_PREFIX + System.currentTimeMillis() + ".png");
        if (!outputFolder.exists()) {
            outputFolder.mkdir();
        }
        return output;
    }

    public static File getTempAyuvFile() {
        File outputFolder = new File(Environment.getExternalStorageDirectory(), BASE_HIDDEN_DIR);
        File output = new File(outputFolder, TEMP_AYUV_PREFIX + System.currentTimeMillis() + ".ayuv");
        if (!outputFolder.exists()) {
            outputFolder.mkdir();
        }
        return output;
    }

    public static boolean deleteFile(String path) {
        return !TextUtils.isEmpty(path) && deleteFile(new File(path));
    }

    public static void doubleTryDeleteFile(File file) {
        if (!deleteFile(file)) {
            deleteFile(file);
        }
    }

    public static boolean deleteFile(File file) {
        if (file != null && file.exists()) {
            if (file.isDirectory()) {
                return deleteDirectory(file);
            }
            return file.delete();
        }
        return false;
    }

    private static boolean deleteDirectory(File directory) {
        File[] files;
        if (directory.exists() && (files = directory.listFiles()) != null) {
            for (int i = 0; i < files.length; i++) {
                if (files[i].isDirectory()) {
                    deleteDirectory(files[i]);
                } else {
                    files[i].delete();
                }
            }
        }
        return directory.delete();
    }

    public static File checkFolder(File dir) {
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return dir;
    }

    public static void touch(File file) {
        long timestamp = System.currentTimeMillis();
        touch(file, timestamp);
    }

    public static void touch(File file, long timestamp) {
        try {
            if (!file.exists()) {
                new FileOutputStream(file).close();
            }
            file.setLastModified(timestamp);
        } catch (Exception e) {
        }
    }

    public static void saveToFile(File file, byte[] data) throws Exception {
        FileOutputStream stream;
        FileOutputStream stream2 = null;
        try {
            try {
                stream = new FileOutputStream(file);
            } catch (Throwable th) {
                th = th;
            }
            try {
                stream.write(data);
                if (stream != null) {
                    try {
                        stream.close();
                    } catch (Exception e) {
                    }
                }
            } catch (Exception e2) {
            } catch (Throwable th2) {
                th = th2;
                stream2 = stream;
                if (stream2 != null) {
                    try {
                        stream2.close();
                    } catch (Exception e3) {
                    }
                }
                throw th;
            }
        } catch (Exception e4) {
            throw e4;
        }
    }

    public static void copyFile(File sourceFile, File destFile) throws IOException {
        if (!destFile.exists()) {
            destFile.createNewFile();
        }
        FileChannel source = null;
        FileChannel destination = null;
        try {
            source = new FileInputStream(sourceFile).getChannel();
            destination = new FileOutputStream(destFile).getChannel();
            destination.transferFrom(source, 0L, source.size());
        } finally {
            if (source != null) {
                source.close();
            }
            if (destination != null) {
                destination.close();
            }
        }
    }

    public static boolean isExist(String path) {
        return !TextUtils.isEmpty(path) && new File(path).exists();
    }

    public static boolean zip(ArrayList<File> files, File output) {
        byte[] buffer;
        ZipOutputStream out;
        boolean z = false;
        if (!files.isEmpty()) {
            ZipOutputStream out2 = null;
            try {
                try {
                    buffer = new byte[1024];
                    out = new ZipOutputStream(new FileOutputStream(output));
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Exception e) {
            }
            try {
                Iterator<File> it = files.iterator();
                while (it.hasNext()) {
                    File file = it.next();
                    if (file.exists() && file.length() >= 4) {
                        FileInputStream fis = new FileInputStream(file.getAbsolutePath());
                        out.putNextEntry(new ZipEntry(file.getName()));
                        while (true) {
                            int length = fis.read(buffer);
                            if (length <= 0) {
                                break;
                            }
                            out.write(buffer, 0, length);
                        }
                        out.closeEntry();
                    }
                }
                if (output.length() == 0) {
                    deleteFile(output);
                    if (out != null) {
                        try {
                            out.close();
                        } catch (Exception e2) {
                        }
                    }
                } else {
                    z = true;
                    if (out != null) {
                        try {
                            out.close();
                        } catch (Exception e3) {
                        }
                    }
                }
            } catch (Exception e4) {
                out2 = out;
                deleteFile(output);
                if (out2 != null) {
                    try {
                        out2.close();
                    } catch (Exception e5) {
                    }
                }
                return z;
            } catch (Throwable th2) {
                th = th2;
                out2 = out;
                if (out2 != null) {
                    try {
                        out2.close();
                    } catch (Exception e6) {
                    }
                }
                throw th;
            }
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x005e, code lost:
        throw new java.io.FileNotFoundException("Failed to ensure directory: " + r2.getAbsolutePath());
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean unzip(java.io.File r10, java.io.File r11) throws java.io.IOException {
        /*
            deleteFile(r10)
            boolean r7 = r10.exists()
            if (r7 != 0) goto Lc
            r10.mkdir()
        Lc:
            java.util.zip.ZipInputStream r6 = new java.util.zip.ZipInputStream
            java.io.BufferedInputStream r7 = new java.io.BufferedInputStream
            java.io.FileInputStream r8 = new java.io.FileInputStream
            r8.<init>(r11)
            r7.<init>(r8)
            r6.<init>(r7)
            r7 = 8192(0x2000, float:1.148E-41)
            byte[] r0 = new byte[r7]     // Catch: java.lang.Throwable -> L5f
        L1f:
            java.util.zip.ZipEntry r5 = r6.getNextEntry()     // Catch: java.lang.Throwable -> L5f
            if (r5 == 0) goto L89
            java.io.File r3 = new java.io.File     // Catch: java.lang.Throwable -> L5f
            java.lang.String r7 = r5.getName()     // Catch: java.lang.Throwable -> L5f
            r3.<init>(r10, r7)     // Catch: java.lang.Throwable -> L5f
            boolean r7 = r5.isDirectory()     // Catch: java.lang.Throwable -> L5f
            if (r7 == 0) goto L64
            r2 = r3
        L35:
            boolean r7 = r2.isDirectory()     // Catch: java.lang.Throwable -> L5f
            if (r7 != 0) goto L69
            boolean r7 = r2.mkdirs()     // Catch: java.lang.Throwable -> L5f
            if (r7 != 0) goto L69
            java.io.FileNotFoundException r7 = new java.io.FileNotFoundException     // Catch: java.lang.Throwable -> L5f
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L5f
            r8.<init>()     // Catch: java.lang.Throwable -> L5f
            java.lang.String r9 = "Failed to ensure directory: "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Throwable -> L5f
            java.lang.String r9 = r2.getAbsolutePath()     // Catch: java.lang.Throwable -> L5f
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Throwable -> L5f
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Throwable -> L5f
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L5f
            throw r7     // Catch: java.lang.Throwable -> L5f
        L5f:
            r7 = move-exception
            r6.close()
            throw r7
        L64:
            java.io.File r2 = r3.getParentFile()     // Catch: java.lang.Throwable -> L5f
            goto L35
        L69:
            boolean r7 = r5.isDirectory()     // Catch: java.lang.Throwable -> L5f
            if (r7 != 0) goto L1f
            java.io.FileOutputStream r4 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L5f
            r4.<init>(r3)     // Catch: java.lang.Throwable -> L5f
        L74:
            int r1 = r6.read(r0)     // Catch: java.lang.Throwable -> L80
            r7 = -1
            if (r1 == r7) goto L85
            r7 = 0
            r4.write(r0, r7, r1)     // Catch: java.lang.Throwable -> L80
            goto L74
        L80:
            r7 = move-exception
            r4.close()     // Catch: java.lang.Throwable -> L5f
            throw r7     // Catch: java.lang.Throwable -> L5f
        L85:
            r4.close()     // Catch: java.lang.Throwable -> L5f
            goto L1f
        L89:
            r6.close()
            r7 = 1
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vk.core.util.FileUtils.unzip(java.io.File, java.io.File):boolean");
    }

    private FileUtils() {
    }
}
