package net.hockeyapp.android.metrics;

import android.content.Context;
import android.text.TextUtils;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.UUID;
import net.hockeyapp.android.utils.HockeyLog;
/* loaded from: classes3.dex */
class Persistence {
    private static final String BIT_TELEMETRY_DIRECTORY = "/net.hockeyapp.android/telemetry/";
    private static final Object LOCK = new Object();
    private static final Integer MAX_FILE_COUNT = 50;
    private static final String TAG = "HA-MetricsPersistence";
    protected ArrayList<File> mServedFiles;
    protected final File mTelemetryDirectory;
    private final WeakReference<Context> mWeakContext;
    protected WeakReference<Sender> mWeakSender;

    protected Persistence(Context context, File telemetryDirectory, Sender sender) {
        this.mWeakContext = new WeakReference<>(context);
        this.mServedFiles = new ArrayList<>(51);
        this.mTelemetryDirectory = telemetryDirectory;
        this.mWeakSender = new WeakReference<>(sender);
        createDirectoriesIfNecessary();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Persistence(Context context, Sender sender) {
        this(context, new File(context.getFilesDir().getAbsolutePath() + BIT_TELEMETRY_DIRECTORY), null);
        setSender(sender);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void persist(String[] data) {
        if (!isFreeSpaceAvailable()) {
            HockeyLog.warn(TAG, "Failed to persist file: Too many files on disk.");
            getSender().triggerSending();
            return;
        }
        StringBuilder buffer = new StringBuilder();
        for (String aData : data) {
            if (buffer.length() > 0) {
                buffer.append('\n');
            }
            buffer.append(aData);
        }
        String serializedData = buffer.toString();
        boolean isSuccess = writeToDisk(serializedData);
        if (isSuccess) {
            getSender().triggerSending();
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x006c -> B:16:0x006d). Please submit an issue!!! */
    protected boolean writeToDisk(String data) {
        String uuid = UUID.randomUUID().toString();
        Boolean isSuccess = false;
        FileOutputStream outputStream = null;
        try {
            try {
            } catch (Exception e) {
                e = e;
            }
            synchronized (LOCK) {
                try {
                    File filesDir = new File(this.mTelemetryDirectory + CameraUtilsEffects.FILE_DELIM + uuid);
                    FileOutputStream outputStream2 = new FileOutputStream(filesDir, true);
                    try {
                        outputStream2.write(data.getBytes());
                        HockeyLog.warn(TAG, "Saving data to: " + filesDir.toString());
                        try {
                            isSuccess = true;
                            if (outputStream2 != null) {
                                try {
                                    outputStream2.close();
                                } catch (IOException e2) {
                                    e2.printStackTrace();
                                }
                            }
                        } catch (Exception e3) {
                            e = e3;
                            outputStream = outputStream2;
                            HockeyLog.warn(TAG, "Failed to save data with exception: " + e.toString());
                            if (outputStream != null) {
                                try {
                                    outputStream.close();
                                } catch (IOException e4) {
                                    e4.printStackTrace();
                                }
                            }
                            return isSuccess.booleanValue();
                        } catch (Throwable th) {
                            th = th;
                            outputStream = outputStream2;
                            if (outputStream != null) {
                                try {
                                    outputStream.close();
                                } catch (IOException e5) {
                                    e5.printStackTrace();
                                }
                            }
                            throw th;
                        }
                        return isSuccess.booleanValue();
                    } catch (Throwable th2) {
                        th = th2;
                        outputStream = outputStream2;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String load(File file) {
        StringBuilder buffer = new StringBuilder();
        if (file != null) {
            BufferedReader reader = null;
            try {
                try {
                    synchronized (LOCK) {
                        try {
                            FileInputStream inputStream = new FileInputStream(file);
                            InputStreamReader streamReader = new InputStreamReader(inputStream);
                            BufferedReader reader2 = new BufferedReader(streamReader);
                            while (true) {
                                try {
                                    int c = reader2.read();
                                    if (c == -1) {
                                        break;
                                    }
                                    buffer.append((char) c);
                                } catch (Throwable th) {
                                    th = th;
                                    reader = reader2;
                                    throw th;
                                }
                            }
                            if (reader2 != null) {
                                try {
                                    reader2.close();
                                } catch (IOException e) {
                                    HockeyLog.warn(TAG, "Error closing stream." + e.getMessage());
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
                        }
                    }
                } catch (Exception e2) {
                    HockeyLog.warn(TAG, "Error reading telemetry data from file with exception message " + e2.getMessage());
                    if (reader != null) {
                        try {
                            reader.close();
                        } catch (IOException e3) {
                            HockeyLog.warn(TAG, "Error closing stream." + e3.getMessage());
                        }
                    }
                }
            } catch (Throwable th3) {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e4) {
                        HockeyLog.warn(TAG, "Error closing stream." + e4.getMessage());
                    }
                }
                throw th3;
            }
        }
        return buffer.toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean hasFilesAvailable() {
        return nextAvailableFileInDirectory() != null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public File nextAvailableFileInDirectory() {
        File file;
        File[] files;
        synchronized (LOCK) {
            if (this.mTelemetryDirectory != null && (files = this.mTelemetryDirectory.listFiles()) != null && files.length > 0) {
                for (int i = 0; i <= files.length - 1; i++) {
                    file = files[i];
                    if (!this.mServedFiles.contains(file)) {
                        HockeyLog.info(TAG, "The directory " + file.toString() + " (ADDING TO SERVED AND RETURN)");
                        this.mServedFiles.add(file);
                        break;
                    }
                    HockeyLog.info(TAG, "The directory " + file.toString() + " (WAS ALREADY SERVED)");
                }
            }
            if (this.mTelemetryDirectory != null) {
                HockeyLog.info(TAG, "The directory " + this.mTelemetryDirectory.toString() + " did not contain any unserved files");
            }
            file = null;
        }
        return file;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void deleteFile(File file) {
        if (file != null) {
            synchronized (LOCK) {
                boolean deletedFile = file.delete();
                if (!deletedFile) {
                    HockeyLog.warn(TAG, "Error deleting telemetry file " + file.toString());
                } else {
                    HockeyLog.warn(TAG, "Successfully deleted telemetry file at: " + file.toString());
                    this.mServedFiles.remove(file);
                }
            }
            return;
        }
        HockeyLog.warn(TAG, "Couldn't delete file, the reference to the file was null");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void makeAvailable(File file) {
        synchronized (LOCK) {
            if (file != null) {
                this.mServedFiles.remove(file);
            }
        }
    }

    protected boolean isFreeSpaceAvailable() {
        boolean z = false;
        synchronized (LOCK) {
            Context context = getContext();
            if (context.getFilesDir() != null) {
                File filesDir = context.getFilesDir();
                String path = filesDir.getAbsolutePath() + BIT_TELEMETRY_DIRECTORY;
                if (!TextUtils.isEmpty(path)) {
                    File dir = new File(path);
                    File[] files = dir.listFiles();
                    if (files != null && files.length < MAX_FILE_COUNT.intValue()) {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    protected void createDirectoriesIfNecessary() {
        if (this.mTelemetryDirectory != null && !this.mTelemetryDirectory.exists()) {
            if (this.mTelemetryDirectory.mkdirs()) {
                HockeyLog.info(TAG, "Successfully created directory");
            } else {
                HockeyLog.info(TAG, "Error creating directory");
            }
        }
    }

    private Context getContext() {
        if (this.mWeakContext == null) {
            return null;
        }
        Context context = this.mWeakContext.get();
        return context;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Sender getSender() {
        if (this.mWeakSender == null) {
            return null;
        }
        Sender sender = this.mWeakSender.get();
        return sender;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSender(Sender sender) {
        this.mWeakSender = new WeakReference<>(sender);
    }
}
