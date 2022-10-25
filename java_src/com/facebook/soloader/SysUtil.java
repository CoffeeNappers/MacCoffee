package com.facebook.soloader;

import android.os.Build;
import android.os.Parcel;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
/* loaded from: classes.dex */
public final class SysUtil {
    private static final byte APK_SIGNATURE_VERSION = 1;

    public static int findAbiScore(String[] supportedAbis, String abi) {
        for (int i = 0; i < supportedAbis.length; i++) {
            if (supportedAbis[i] != null && abi.equals(supportedAbis[i])) {
                return i;
            }
        }
        return -1;
    }

    public static void deleteOrThrow(File file) throws IOException {
        if (!file.delete()) {
            throw new IOException("could not delete file " + file);
        }
    }

    public static String[] getSupportedAbis() {
        return Build.VERSION.SDK_INT < 21 ? new String[]{Build.CPU_ABI, Build.CPU_ABI2} : LollipopSysdeps.getSupportedAbis();
    }

    public static void fallocateIfSupported(FileDescriptor fd, long length) throws IOException {
        if (Build.VERSION.SDK_INT >= 21) {
            LollipopSysdeps.fallocateIfSupported(fd, length);
        }
    }

    public static void dumbDeleteRecursive(File file) throws IOException {
        if (file.isDirectory()) {
            File[] fileList = file.listFiles();
            if (fileList == null) {
                return;
            }
            for (File entry : fileList) {
                dumbDeleteRecursive(entry);
            }
        }
        if (!file.delete() && file.exists()) {
            throw new IOException("could not delete: " + file);
        }
    }

    /* loaded from: classes.dex */
    private static final class LollipopSysdeps {
        private LollipopSysdeps() {
        }

        public static String[] getSupportedAbis() {
            return Build.SUPPORTED_32_BIT_ABIS;
        }

        public static void fallocateIfSupported(FileDescriptor fd, long length) throws IOException {
            try {
                Os.posix_fallocate(fd, 0L, length);
            } catch (ErrnoException ex) {
                if (ex.errno != OsConstants.EOPNOTSUPP && ex.errno != OsConstants.ENOSYS && ex.errno != OsConstants.EINVAL) {
                    throw new IOException(ex.toString(), ex);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void mkdirOrThrow(File dir) throws IOException {
        if (!dir.mkdirs() && !dir.isDirectory()) {
            throw new IOException("cannot mkdir: " + dir);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int copyBytes(RandomAccessFile os, InputStream is, int byteLimit, byte[] buffer) throws IOException {
        int bytesCopied = 0;
        while (bytesCopied < byteLimit) {
            int nrRead = is.read(buffer, 0, Math.min(buffer.length, byteLimit - bytesCopied));
            if (nrRead == -1) {
                break;
            }
            os.write(buffer, 0, nrRead);
            bytesCopied += nrRead;
        }
        return bytesCopied;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void fsyncRecursive(File fileName) throws IOException {
        if (fileName.isDirectory()) {
            File[] files = fileName.listFiles();
            if (files == null) {
                throw new IOException("cannot list directory " + fileName);
            }
            for (File file : files) {
                fsyncRecursive(file);
            }
        } else if (!fileName.getPath().endsWith("_lock")) {
            RandomAccessFile file2 = new RandomAccessFile(fileName, "r");
            Throwable th = null;
            try {
                file2.getFD().sync();
                if (file2 == null) {
                    return;
                }
                if (0 != 0) {
                    try {
                        file2.close();
                        return;
                    } catch (Throwable x2) {
                        th.addSuppressed(x2);
                        return;
                    }
                }
                file2.close();
            } catch (Throwable th2) {
                try {
                    throw th2;
                } catch (Throwable th3) {
                    if (file2 != null) {
                        if (th2 != null) {
                            try {
                                file2.close();
                            } catch (Throwable x22) {
                                th2.addSuppressed(x22);
                            }
                        } else {
                            file2.close();
                        }
                    }
                    throw th3;
                }
            }
        }
    }

    public static byte[] makeApkDepBlock(File apkFile) {
        Parcel parcel = Parcel.obtain();
        parcel.writeByte((byte) 1);
        parcel.writeString(apkFile.getPath());
        parcel.writeLong(apkFile.lastModified());
        byte[] depsBlock = parcel.marshall();
        parcel.recycle();
        return depsBlock;
    }
}
