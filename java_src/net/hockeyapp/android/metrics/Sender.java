package net.hockeyapp.android.metrics;

import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Build;
import android.text.TextUtils;
import com.vkontakte.android.GCMBroadcastReceiver;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.zip.GZIPOutputStream;
import net.hockeyapp.android.utils.AsyncTaskUtils;
import net.hockeyapp.android.utils.HockeyLog;
/* loaded from: classes3.dex */
public class Sender {
    static final String DEFAULT_ENDPOINT_URL = "https://gate.hockeyapp.net/v2/track";
    static final int DEFAULT_SENDER_CONNECT_TIMEOUT = 15000;
    static final int DEFAULT_SENDER_READ_TIMEOUT = 10000;
    static final int MAX_REQUEST_COUNT = 10;
    private static final String TAG = "HockeyApp-Metrics";
    private String mCustomServerURL;
    private AtomicInteger mRequestCount = new AtomicInteger(0);
    protected WeakReference<Persistence> mWeakPersistence;

    /* JADX INFO: Access modifiers changed from: protected */
    public void triggerSending() {
        if (requestCount() < 10) {
            try {
                AsyncTaskUtils.execute(new AsyncTask<Void, Void, Void>() { // from class: net.hockeyapp.android.metrics.Sender.1
                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // android.os.AsyncTask
                    public Void doInBackground(Void... params) {
                        Sender.this.sendAvailableFiles();
                        return null;
                    }
                });
                return;
            } catch (RejectedExecutionException e) {
                HockeyLog.error("Could not send events. Executor rejected async task.", e);
                return;
            }
        }
        HockeyLog.debug(TAG, "We have already 10 pending requests, not sending anything.");
    }

    protected void triggerSendingForTesting(final HttpURLConnection connection, final File file, final String persistedData) {
        if (requestCount() < 10) {
            this.mRequestCount.getAndIncrement();
            AsyncTaskUtils.execute(new AsyncTask<Void, Void, Void>() { // from class: net.hockeyapp.android.metrics.Sender.2
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public Void doInBackground(Void... params) {
                    Sender.this.send(connection, file, persistedData);
                    return null;
                }
            });
        }
    }

    protected void sendAvailableFiles() {
        if (getPersistence() != null) {
            File fileToSend = getPersistence().nextAvailableFileInDirectory();
            String persistedData = loadData(fileToSend);
            HttpURLConnection connection = createConnection();
            if (persistedData != null && connection != null) {
                send(connection, fileToSend, persistedData);
            }
        }
    }

    protected void send(HttpURLConnection connection, File file, String persistedData) {
        logRequest(connection, persistedData);
        if (connection != null && file != null && persistedData != null) {
            this.mRequestCount.getAndIncrement();
            try {
                connection.connect();
                int responseCode = connection.getResponseCode();
                onResponse(connection, responseCode, persistedData, file);
            } catch (IOException e) {
                HockeyLog.debug(TAG, "Couldn't send data with IOException: " + e.toString());
                this.mRequestCount.getAndDecrement();
                if (getPersistence() != null) {
                    HockeyLog.debug(TAG, "Persisting because of IOException: We're probably offline.");
                    getPersistence().makeAvailable(file);
                }
            }
        }
    }

    protected String loadData(File file) {
        String persistedData = null;
        if (getPersistence() != null && file != null && (persistedData = getPersistence().load(file)) != null && persistedData.isEmpty()) {
            getPersistence().deleteFile(file);
        }
        return persistedData;
    }

    protected HttpURLConnection createConnection() {
        URL url;
        HttpURLConnection connection = null;
        try {
            if (getCustomServerURL() == null) {
                url = new URL(DEFAULT_ENDPOINT_URL);
            } else {
                url = new URL(this.mCustomServerURL);
                if (url == null) {
                    url = new URL(DEFAULT_ENDPOINT_URL);
                }
            }
            connection = (HttpURLConnection) url.openConnection();
            connection.setReadTimeout(10000);
            connection.setConnectTimeout(15000);
            connection.setRequestMethod(HttpRequest.METHOD_POST);
            connection.setRequestProperty("Content-Type", "application/x-json-stream");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setUseCaches(false);
            return connection;
        } catch (IOException e) {
            HockeyLog.error(TAG, "Could not open connection for provided URL with exception: ", e);
            return connection;
        }
    }

    protected void onResponse(HttpURLConnection connection, int responseCode, String payload, File fileToSend) {
        this.mRequestCount.getAndDecrement();
        HockeyLog.debug(TAG, "response code " + Integer.toString(responseCode));
        boolean isRecoverableError = isRecoverableError(responseCode);
        if (isRecoverableError) {
            HockeyLog.debug(TAG, "Recoverable error (probably a server error), persisting data:\n" + payload);
            if (getPersistence() != null) {
                getPersistence().makeAvailable(fileToSend);
                return;
            }
            return;
        }
        if (getPersistence() != null) {
            getPersistence().deleteFile(fileToSend);
        }
        StringBuilder builder = new StringBuilder();
        if (isExpected(responseCode)) {
            triggerSending();
        } else {
            onUnexpected(connection, responseCode, builder);
        }
    }

    protected boolean isRecoverableError(int responseCode) {
        List<Integer> recoverableCodes = Arrays.asList(408, 429, 500, Integer.valueOf((int) GCMBroadcastReceiver.ID_FRIEND_FOUND_NOTIFICATION), Integer.valueOf((int) GCMBroadcastReceiver.ID_FRIEND_ACCEPTED_NOTIFICATION));
        return recoverableCodes.contains(Integer.valueOf(responseCode));
    }

    protected boolean isExpected(int responseCode) {
        return 200 <= responseCode && responseCode <= 203;
    }

    protected void onUnexpected(HttpURLConnection connection, int responseCode, StringBuilder builder) {
        String message = String.format(Locale.ROOT, "Unexpected response code: %d", Integer.valueOf(responseCode));
        builder.append(message);
        builder.append("\n");
        HockeyLog.error(TAG, message);
        readResponse(connection, builder);
    }

    private void logRequest(HttpURLConnection connection, String payload) {
        Writer writer = null;
        if (connection != null) {
            try {
                if (payload != null) {
                    try {
                        HockeyLog.debug(TAG, "Sending payload:\n" + payload);
                        HockeyLog.debug(TAG, "Using URL:" + connection.getURL().toString());
                        writer = getWriter(connection);
                        writer.write(payload);
                        writer.flush();
                    } catch (IOException e) {
                        HockeyLog.debug(TAG, "Couldn't log data with: " + e.toString());
                        if (writer != null) {
                            try {
                                writer.close();
                                return;
                            } catch (IOException e2) {
                                HockeyLog.error(TAG, "Couldn't close writer with: " + e2.toString());
                                return;
                            }
                        }
                        return;
                    }
                }
            } catch (Throwable th) {
                if (writer != null) {
                    try {
                        writer.close();
                    } catch (IOException e3) {
                        HockeyLog.error(TAG, "Couldn't close writer with: " + e3.toString());
                    }
                }
                throw th;
            }
        }
        if (writer != null) {
            try {
                writer.close();
            } catch (IOException e4) {
                HockeyLog.error(TAG, "Couldn't close writer with: " + e4.toString());
            }
        }
    }

    protected void readResponse(HttpURLConnection connection, StringBuilder builder) {
        String result;
        StringBuffer buffer = new StringBuffer();
        InputStream inputStream = null;
        try {
            try {
                InputStream inputStream2 = connection.getErrorStream();
                if (inputStream2 == null) {
                    inputStream2 = connection.getInputStream();
                }
                if (inputStream2 != null) {
                    BufferedReader br = new BufferedReader(new InputStreamReader(inputStream2, "UTF-8"));
                    while (true) {
                        String inputLine = br.readLine();
                        if (inputLine == null) {
                            break;
                        }
                        buffer.append(inputLine);
                    }
                    result = buffer.toString();
                } else {
                    result = connection.getResponseMessage();
                }
                if (!TextUtils.isEmpty(result)) {
                    HockeyLog.verbose(result);
                } else {
                    HockeyLog.verbose(TAG, "Couldn't log response, result is null or empty string");
                }
                if (inputStream2 != null) {
                    try {
                        inputStream2.close();
                    } catch (IOException e) {
                        HockeyLog.error(TAG, e.toString());
                    }
                }
            } catch (IOException e2) {
                HockeyLog.error(TAG, e2.toString());
                if (0 != 0) {
                    try {
                        inputStream.close();
                    } catch (IOException e3) {
                        HockeyLog.error(TAG, e3.toString());
                    }
                }
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    inputStream.close();
                } catch (IOException e4) {
                    HockeyLog.error(TAG, e4.toString());
                }
            }
            throw th;
        }
    }

    @TargetApi(19)
    protected Writer getWriter(HttpURLConnection connection) throws IOException {
        if (Build.VERSION.SDK_INT >= 19) {
            connection.addRequestProperty(HttpRequest.HEADER_CONTENT_ENCODING, HttpRequest.ENCODING_GZIP);
            connection.setRequestProperty("Content-Type", "application/x-json-stream");
            GZIPOutputStream gzip = new GZIPOutputStream(connection.getOutputStream(), true);
            return new OutputStreamWriter(gzip, "UTF-8");
        }
        return new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
    }

    protected Persistence getPersistence() {
        if (this.mWeakPersistence == null) {
            return null;
        }
        Persistence persistence = this.mWeakPersistence.get();
        return persistence;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setPersistence(Persistence persistence) {
        this.mWeakPersistence = new WeakReference<>(persistence);
    }

    protected int requestCount() {
        return this.mRequestCount.get();
    }

    protected String getCustomServerURL() {
        return this.mCustomServerURL;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCustomServerURL(String customServerURL) {
        this.mCustomServerURL = customServerURL;
    }
}
