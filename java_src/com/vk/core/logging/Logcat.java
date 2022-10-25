package com.vk.core.logging;

import android.text.TextUtils;
import com.google.android.exoplayer2.upstream.cache.CacheDataSource;
import com.vk.core.util.FileUtils;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class Logcat {
    private static final int BUFFER_BYTES = 131072;
    private static final int BUFFER_LINES = 5000;
    private static final int MAX_FILE_SIZE = 2097152;
    private static final String TYPE_MAIN = "main";
    private static final String TYPE_SYSTEM = "system";
    private static final int WAIT_TIME_MS = 4000;
    private File archive;
    private ExecutorService executor;
    private File fileMain;
    private File fileSystem;
    private String logpath;
    private StringBuilder main;
    private StringBuilder system;
    private final Object object = new Object();
    private boolean collecting = false;
    private Runnable collectLogs = new Runnable() { // from class: com.vk.core.logging.Logcat.1
        @Override // java.lang.Runnable
        public void run() {
            Logcat.this.waitingForLogs();
        }
    };

    public Logcat(String logpath) {
        this.logpath = logpath;
        FileUtils.deleteFile(getArchiveUploadPath());
    }

    public void start() {
        if (!TextUtils.isEmpty(this.logpath)) {
            initPaths();
            this.executor = Executors.newSingleThreadExecutor();
            if (verify(this.fileMain) && verify(this.fileSystem)) {
                FileUtils.deleteFile(getArchivePath());
                FileUtils.deleteFile(getArchiveUploadPath());
                synchronized (this.object) {
                    this.main = new StringBuilder(131072);
                    this.system = new StringBuilder(131072);
                    this.collecting = true;
                    this.executor.execute(this.collectLogs);
                }
            }
        }
    }

    public boolean stop() {
        if (TextUtils.isEmpty(this.logpath)) {
            return false;
        }
        synchronized (this.object) {
            if (this.collecting) {
                this.collecting = false;
                this.object.notify();
            }
            try {
                if (this.executor != null && !this.executor.isTerminated()) {
                    this.executor.awaitTermination(500L, TimeUnit.MILLISECONDS);
                }
            } catch (Exception e) {
            }
        }
        return archive();
    }

    public String getDocumentUri() {
        if (this.archive != null) {
            String source = getArchivePath();
            if (FileUtils.isExist(source)) {
                try {
                    String destination = getArchiveUploadPath();
                    FileUtils.copyFile(new File(source), new File(destination));
                    FileUtils.deleteFile(source);
                    this.archive = null;
                    return destination;
                } catch (Exception e) {
                }
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void waitingForLogs() {
        try {
            synchronized (this.object) {
                this.object.wait(4000L);
                if (dump() && this.collecting) {
                    clear();
                    this.executor.execute(this.collectLogs);
                }
            }
        } catch (Exception e) {
        }
    }

    private boolean dump() {
        boolean hasMain = this.fileMain.length() < CacheDataSource.DEFAULT_MAX_CACHE_FILE_SIZE;
        boolean hasSystem = this.fileMain.length() < CacheDataSource.DEFAULT_MAX_CACHE_FILE_SIZE;
        if (hasMain) {
            collect(this.main, TYPE_MAIN);
            appendToFile(this.main, this.fileMain);
        }
        if (hasSystem) {
            collect(this.system, TYPE_SYSTEM);
            appendToFile(this.system, this.fileSystem);
        }
        return hasMain || hasSystem;
    }

    private void clear() {
        run(null, new String[]{"logcat", "-c"});
        if (this.main != null) {
            this.main.setLength(0);
        }
        if (this.system != null) {
            this.system.setLength(0);
        }
    }

    private void collect(StringBuilder builder, String type) {
        if (builder == null) {
            builder = new StringBuilder();
        }
        builder.append("\n");
        String[] args = {"logcat", "-t", String.valueOf(5000), "-b", type, "-v", "time", "brief"};
        run(builder, args);
    }

    private static void run(StringBuilder builder, String[] args) {
        if (args == null || args.length == 0) {
            return;
        }
        BufferedReader bufReader = null;
        Process process = null;
        try {
            process = new ProcessBuilder(new String[0]).command(args).redirectErrorStream(true).start();
            BufferedReader bufReader2 = new BufferedReader(new InputStreamReader(process.getInputStream()), 131072);
            while (true) {
                try {
                    String line = bufReader2.readLine();
                    if (line == null) {
                        break;
                    }
                    builder.append(line);
                    builder.append("\n");
                } catch (Exception e) {
                    bufReader = bufReader2;
                    if (process != null) {
                        process.destroy();
                    }
                    if (bufReader == null) {
                        return;
                    }
                    try {
                        bufReader.close();
                        return;
                    } catch (Exception e2) {
                        return;
                    }
                } catch (Throwable th) {
                    th = th;
                    bufReader = bufReader2;
                    if (process != null) {
                        process.destroy();
                    }
                    if (bufReader != null) {
                        try {
                            bufReader.close();
                        } catch (Exception e3) {
                        }
                    }
                    throw th;
                }
            }
            if (process != null) {
                process.destroy();
            }
            if (bufReader2 == null) {
                return;
            }
            try {
                bufReader2.close();
            } catch (Exception e4) {
            }
        } catch (Exception e5) {
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private String makePath(String path, String type) {
        return path + "-" + type + ".log";
    }

    private boolean verify(File file) {
        try {
            if (file.exists()) {
                file.delete();
            }
            return file.createNewFile();
        } catch (Exception e) {
            return false;
        }
    }

    private void appendToFile(StringBuilder builder, File file) {
        FileOutputStream f = null;
        try {
            if (!file.exists()) {
                file.createNewFile();
            }
            byte[] bytes = builder.toString().getBytes();
            FileOutputStream f2 = new FileOutputStream(file, true);
            if (f2 != null) {
                try {
                    f2.write(bytes);
                    f2.flush();
                    f2.close();
                } catch (IOException e) {
                    f = f2;
                    if (f != null) {
                        try {
                            f.close();
                            return;
                        } catch (IOException e2) {
                            return;
                        }
                    }
                    return;
                } catch (Throwable th) {
                    th = th;
                    f = f2;
                    if (f != null) {
                        try {
                            f.close();
                        } catch (IOException e3) {
                        }
                    }
                    throw th;
                }
            }
            if (f2 != null) {
                try {
                    f2.close();
                } catch (IOException e4) {
                }
            }
        } catch (IOException e5) {
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private void initPaths() {
        this.fileMain = new File(makePath(this.logpath, TYPE_MAIN));
        this.fileSystem = new File(makePath(this.logpath, TYPE_SYSTEM));
    }

    private boolean archive() {
        this.archive = new File(getArchivePath());
        if (this.archive.length() > 0) {
            return true;
        }
        initPaths();
        ArrayList<File> files = new ArrayList<>();
        if (this.fileSystem.exists()) {
            files.add(this.fileSystem);
        }
        if (this.fileMain.exists()) {
            files.add(this.fileMain);
        }
        if (new File(this.logpath).exists()) {
            files.add(new File(this.logpath));
        }
        if (FileUtils.zip(files, this.archive)) {
            Iterator<File> it = files.iterator();
            while (it.hasNext()) {
                File f = it.next();
                if (f != null && f.exists()) {
                    f.delete();
                }
            }
            return true;
        }
        FileUtils.deleteFile(this.archive);
        this.archive = null;
        return false;
    }

    private String getArchivePath() {
        if (!TextUtils.isEmpty(this.logpath)) {
            return this.logpath + ".zip";
        }
        return null;
    }

    private String getArchiveUploadPath() {
        if (!TextUtils.isEmpty(this.logpath)) {
            return this.logpath + "up.zip";
        }
        return null;
    }
}
