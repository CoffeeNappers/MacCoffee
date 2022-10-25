package com.facebook.soloader;

import android.content.Context;
import android.os.Parcel;
import android.util.Log;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.Closeable;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
/* loaded from: classes.dex */
public abstract class UnpackingSoSource extends DirectorySoSource {
    private static final String DEPS_FILE_NAME = "dso_deps";
    private static final String LOCK_FILE_NAME = "dso_lock";
    private static final String MANIFEST_FILE_NAME = "dso_manifest";
    private static final byte MANIFEST_VERSION = 1;
    private static final byte STATE_CLEAN = 1;
    private static final byte STATE_DIRTY = 0;
    private static final String STATE_FILE_NAME = "dso_state";
    private static final String TAG = "fb-UnpackingSoSource";
    protected final Context mContext;

    protected abstract Unpacker makeUnpacker() throws IOException;

    static /* synthetic */ void access$000(File x0, byte x1) throws IOException {
        writeState(x0, x1);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UnpackingSoSource(Context context, String name) {
        super(getSoStorePath(context, name), 1);
        this.mContext = context;
    }

    public static File getSoStorePath(Context context, String name) {
        return new File(context.getApplicationInfo().dataDir + CameraUtilsEffects.FILE_DELIM + name);
    }

    /* loaded from: classes.dex */
    public static class Dso {
        public final String hash;
        public final String name;

        public Dso(String name, String hash) {
            this.name = name;
            this.hash = hash;
        }
    }

    /* loaded from: classes.dex */
    public static final class DsoManifest {
        public final Dso[] dsos;

        public DsoManifest(Dso[] dsos) {
            this.dsos = dsos;
        }

        static final DsoManifest read(DataInput xdi) throws IOException {
            int version = xdi.readByte();
            if (version != 1) {
                throw new RuntimeException("wrong dso manifest version");
            }
            int nrDso = xdi.readInt();
            if (nrDso < 0) {
                throw new RuntimeException("illegal number of shared libraries");
            }
            Dso[] dsos = new Dso[nrDso];
            for (int i = 0; i < nrDso; i++) {
                dsos[i] = new Dso(xdi.readUTF(), xdi.readUTF());
            }
            return new DsoManifest(dsos);
        }

        public final void write(DataOutput xdo) throws IOException {
            xdo.writeByte(1);
            xdo.writeInt(this.dsos.length);
            for (int i = 0; i < this.dsos.length; i++) {
                xdo.writeUTF(this.dsos[i].name);
                xdo.writeUTF(this.dsos[i].hash);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static final class InputDso implements Closeable {
        public final InputStream content;
        public final Dso dso;

        public InputDso(Dso dso, InputStream content) {
            this.dso = dso;
            this.content = content;
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.content.close();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static abstract class InputDsoIterator implements Closeable {
        public abstract boolean hasNext();

        public abstract InputDso next() throws IOException;

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static abstract class Unpacker implements Closeable {
        protected abstract DsoManifest getDsoManifest() throws IOException;

        protected abstract InputDsoIterator openDsoIterator() throws IOException;

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void writeState(File stateFileName, byte state) throws IOException {
        RandomAccessFile stateFile = new RandomAccessFile(stateFileName, "rw");
        Throwable th = null;
        try {
            stateFile.seek(0L);
            stateFile.write(state);
            stateFile.setLength(stateFile.getFilePointer());
            stateFile.getFD().sync();
            if (stateFile == null) {
                return;
            }
            if (0 != 0) {
                try {
                    stateFile.close();
                    return;
                } catch (Throwable x2) {
                    th.addSuppressed(x2);
                    return;
                }
            }
            stateFile.close();
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                if (stateFile != null) {
                    if (th2 != null) {
                        try {
                            stateFile.close();
                        } catch (Throwable x22) {
                            th2.addSuppressed(x22);
                        }
                    } else {
                        stateFile.close();
                    }
                }
                throw th3;
            }
        }
    }

    private void deleteUnmentionedFiles(Dso[] dsos) throws IOException {
        String[] existingFiles = this.soDirectory.list();
        if (existingFiles == null) {
            throw new IOException("unable to list directory " + this.soDirectory);
        }
        for (String fileName : existingFiles) {
            if (!fileName.equals(STATE_FILE_NAME) && !fileName.equals(LOCK_FILE_NAME) && !fileName.equals(DEPS_FILE_NAME) && !fileName.equals(MANIFEST_FILE_NAME)) {
                boolean found = false;
                for (int j = 0; !found && j < dsos.length; j++) {
                    if (dsos[j].name.equals(fileName)) {
                        found = true;
                    }
                }
                if (!found) {
                    File fileNameToDelete = new File(this.soDirectory, fileName);
                    Log.v(TAG, "deleting unaccounted-for file " + fileNameToDelete);
                    SysUtil.dumbDeleteRecursive(fileNameToDelete);
                }
            }
        }
    }

    private void extractDso(InputDso iDso, byte[] ioBuffer) throws IOException {
        RandomAccessFile dsoFile;
        Log.i(TAG, "extracting DSO " + iDso.dso.name);
        File dsoFileName = new File(this.soDirectory, iDso.dso.name);
        try {
            dsoFile = new RandomAccessFile(dsoFileName, "rw");
        } catch (IOException ex) {
            Log.w(TAG, "error overwriting " + dsoFileName + " trying to delete and start over", ex);
            dsoFileName.delete();
            dsoFile = new RandomAccessFile(dsoFileName, "rw");
        }
        try {
            InputStream dsoContent = iDso.content;
            int sizeHint = dsoContent.available();
            if (sizeHint > 1) {
                SysUtil.fallocateIfSupported(dsoFile.getFD(), sizeHint);
            }
            SysUtil.copyBytes(dsoFile, iDso.content, Integer.MAX_VALUE, ioBuffer);
            dsoFile.setLength(dsoFile.getFilePointer());
            if (!dsoFileName.setExecutable(true, false)) {
                throw new IOException("cannot make file executable: " + dsoFileName);
            }
        } finally {
            dsoFile.close();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0060 A[Catch: Throwable -> 0x00b2, TRY_LEAVE, TryCatch #7 {Throwable -> 0x00b2, blocks: (B:4:0x003d, B:8:0x004c, B:9:0x005a, B:11:0x0060, B:42:0x00c0, B:23:0x0093, B:29:0x00a9, B:14:0x0069, B:16:0x006e, B:18:0x007e, B:26:0x00a0), top: B:77:0x003d }] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0044 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void regenerate(byte r17, com.facebook.soloader.UnpackingSoSource.DsoManifest r18, com.facebook.soloader.UnpackingSoSource.InputDsoIterator r19) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.soloader.UnpackingSoSource.regenerate(byte, com.facebook.soloader.UnpackingSoSource$DsoManifest, com.facebook.soloader.UnpackingSoSource$InputDsoIterator):void");
    }

    /*  JADX ERROR: JadxRuntimeException in pass: BlockProcessor
        jadx.core.utils.exceptions.JadxRuntimeException: Found unreachable blocks
        	at jadx.core.dex.visitors.blocks.DominatorTree.sortBlocks(DominatorTree.java:35)
        	at jadx.core.dex.visitors.blocks.DominatorTree.compute(DominatorTree.java:25)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.computeDominators(BlockProcessor.java:203)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.processBlocksTree(BlockProcessor.java:46)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.visit(BlockProcessor.java:40)
        */
    private boolean refreshLocked(com.facebook.soloader.FileLocker r24, int r25, byte[] r26) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 435
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.soloader.UnpackingSoSource.refreshLocked(com.facebook.soloader.FileLocker, int, byte[]):boolean");
    }

    protected byte[] getDepsBlock() throws IOException {
        Parcel parcel = Parcel.obtain();
        Unpacker u = makeUnpacker();
        Throwable th = null;
        try {
            Dso[] dsos = u.getDsoManifest().dsos;
            parcel.writeByte((byte) 1);
            parcel.writeInt(dsos.length);
            for (int i = 0; i < dsos.length; i++) {
                parcel.writeString(dsos[i].name);
                parcel.writeString(dsos[i].hash);
            }
            if (u != null) {
                if (0 != 0) {
                    try {
                        u.close();
                    } catch (Throwable x2) {
                        th.addSuppressed(x2);
                    }
                } else {
                    u.close();
                }
            }
            byte[] depsBlock = parcel.marshall();
            parcel.recycle();
            return depsBlock;
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                if (u != null) {
                    if (th2 != null) {
                        try {
                            u.close();
                        } catch (Throwable x22) {
                            th2.addSuppressed(x22);
                        }
                    } else {
                        u.close();
                    }
                }
                throw th3;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.soloader.SoSource
    public void prepare(int flags) throws IOException {
        SysUtil.mkdirOrThrow(this.soDirectory);
        File lockFileName = new File(this.soDirectory, LOCK_FILE_NAME);
        FileLocker lock = FileLocker.lock(lockFileName);
        try {
            Log.v(TAG, "locked dso store " + this.soDirectory);
            if (refreshLocked(lock, flags, getDepsBlock())) {
                lock = null;
            } else {
                Log.i(TAG, "dso store is up-to-date: " + this.soDirectory);
            }
        } finally {
            if (lock != null) {
                Log.v(TAG, "releasing dso store lock for " + this.soDirectory);
                lock.close();
            } else {
                Log.v(TAG, "not releasing dso store lock for " + this.soDirectory + " (syncer thread started)");
            }
        }
    }
}
