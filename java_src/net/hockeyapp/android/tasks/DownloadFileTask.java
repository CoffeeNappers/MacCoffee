package net.hockeyapp.android.tasks;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Environment;
import android.os.StrictMode;
import io.fabric.sdk.android.services.network.HttpRequest;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.UUID;
import net.hockeyapp.android.Constants;
import net.hockeyapp.android.R;
import net.hockeyapp.android.listeners.DownloadFileListener;
/* loaded from: classes3.dex */
public class DownloadFileTask extends AsyncTask<Void, Integer, Long> {
    protected static final int MAX_REDIRECTS = 6;
    protected Context mContext;
    protected DownloadFileListener mNotifier;
    protected ProgressDialog mProgressDialog;
    protected String mUrlString;
    protected String mFilename = UUID.randomUUID() + ".apk";
    protected String mFilePath = Environment.getExternalStorageDirectory().getAbsolutePath() + "/Download";
    private String mDownloadErrorMessage = null;

    public DownloadFileTask(Context context, String urlString, DownloadFileListener notifier) {
        this.mContext = context;
        this.mUrlString = urlString;
        this.mNotifier = notifier;
    }

    public void attach(Context context) {
        this.mContext = context;
    }

    public void detach() {
        this.mContext = null;
        this.mProgressDialog = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Long doInBackground(Void... args) {
        long j;
        OutputStream output;
        InputStream input = null;
        OutputStream output2 = null;
        try {
            try {
                URL url = new URL(getURLString());
                URLConnection connection = createConnection(url, 6);
                connection.connect();
                int lengthOfFile = connection.getContentLength();
                String contentType = connection.getContentType();
                if (contentType == null || !contentType.contains("text")) {
                    File dir = new File(this.mFilePath);
                    boolean result = dir.mkdirs();
                    if (!result && !dir.exists()) {
                        throw new IOException("Could not create the dir(s):" + dir.getAbsolutePath());
                    }
                    File file = new File(dir, this.mFilename);
                    InputStream input2 = new BufferedInputStream(connection.getInputStream());
                    try {
                        output = new FileOutputStream(file);
                    } catch (IOException e) {
                        e = e;
                        input = input2;
                    } catch (Throwable th) {
                        th = th;
                        input = input2;
                    }
                    try {
                        byte[] data = new byte[1024];
                        long total = 0;
                        while (true) {
                            int count = input2.read(data);
                            if (count == -1) {
                                break;
                            }
                            total += count;
                            publishProgress(Integer.valueOf(Math.round((((float) total) * 100.0f) / lengthOfFile)));
                            output.write(data, 0, count);
                        }
                        output.flush();
                        j = Long.valueOf(total);
                        if (output != null) {
                            try {
                                output.close();
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                        if (input2 != null) {
                            input2.close();
                        }
                    } catch (IOException e3) {
                        e = e3;
                        output2 = output;
                        input = input2;
                        e.printStackTrace();
                        j = 0L;
                        if (output2 != null) {
                            try {
                                output2.close();
                            } catch (IOException e4) {
                                e4.printStackTrace();
                            }
                        }
                        if (input != null) {
                            input.close();
                        }
                        return j;
                    } catch (Throwable th2) {
                        th = th2;
                        output2 = output;
                        input = input2;
                        if (output2 != null) {
                            try {
                                output2.close();
                            } catch (IOException e5) {
                                e5.printStackTrace();
                                throw th;
                            }
                        }
                        if (input != null) {
                            input.close();
                        }
                        throw th;
                    }
                } else {
                    this.mDownloadErrorMessage = "The requested download does not appear to be a file.";
                    j = 0L;
                    if (0 != 0) {
                        try {
                            output2.close();
                        } catch (IOException e6) {
                            e6.printStackTrace();
                        }
                    }
                    if (0 != 0) {
                        input.close();
                    }
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e7) {
            e = e7;
        }
        return j;
    }

    protected void setConnectionProperties(HttpURLConnection connection) {
        connection.addRequestProperty("User-Agent", Constants.SDK_USER_AGENT);
        connection.setInstanceFollowRedirects(true);
        if (Build.VERSION.SDK_INT <= 9) {
            connection.setRequestProperty("connection", "close");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public URLConnection createConnection(URL url, int remainingRedirects) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        setConnectionProperties(connection);
        int code = connection.getResponseCode();
        if ((code == 301 || code == 302 || code == 303) && remainingRedirects != 0) {
            URL movedUrl = new URL(connection.getHeaderField(HttpRequest.HEADER_LOCATION));
            if (!url.getProtocol().equals(movedUrl.getProtocol())) {
                connection.disconnect();
                return createConnection(movedUrl, remainingRedirects - 1);
            }
            return connection;
        }
        return connection;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onProgressUpdate(Integer... args) {
        try {
            if (this.mProgressDialog == null) {
                this.mProgressDialog = new ProgressDialog(this.mContext);
                this.mProgressDialog.setProgressStyle(1);
                this.mProgressDialog.setMessage("Loading...");
                this.mProgressDialog.setCancelable(false);
                this.mProgressDialog.show();
            }
            this.mProgressDialog.setProgress(args[0].intValue());
        } catch (Exception e) {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Long result) {
        String message;
        if (this.mProgressDialog != null) {
            try {
                this.mProgressDialog.dismiss();
            } catch (Exception e) {
            }
        }
        if (result.longValue() > 0) {
            this.mNotifier.downloadSuccessful(this);
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(Uri.fromFile(new File(this.mFilePath, this.mFilename)), "application/vnd.android.package-archive");
            intent.setFlags(268435456);
            StrictMode.VmPolicy oldVmPolicy = null;
            if (Build.VERSION.SDK_INT >= 24) {
                oldVmPolicy = StrictMode.getVmPolicy();
                StrictMode.VmPolicy policy = new StrictMode.VmPolicy.Builder().penaltyLog().build();
                StrictMode.setVmPolicy(policy);
            }
            this.mContext.startActivity(intent);
            if (oldVmPolicy != null) {
                StrictMode.setVmPolicy(oldVmPolicy);
                return;
            }
            return;
        }
        try {
            AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
            builder.setTitle(R.string.hockeyapp_download_failed_dialog_title);
            if (this.mDownloadErrorMessage == null) {
                message = this.mContext.getString(R.string.hockeyapp_download_failed_dialog_message);
            } else {
                message = this.mDownloadErrorMessage;
            }
            builder.setMessage(message);
            builder.setNegativeButton(R.string.hockeyapp_download_failed_dialog_negative_button, new DialogInterface.OnClickListener() { // from class: net.hockeyapp.android.tasks.DownloadFileTask.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    DownloadFileTask.this.mNotifier.downloadFailed(DownloadFileTask.this, false);
                }
            });
            builder.setPositiveButton(R.string.hockeyapp_download_failed_dialog_positive_button, new DialogInterface.OnClickListener() { // from class: net.hockeyapp.android.tasks.DownloadFileTask.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    DownloadFileTask.this.mNotifier.downloadFailed(DownloadFileTask.this, true);
                }
            });
            builder.create().show();
        } catch (Exception e2) {
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getURLString() {
        return this.mUrlString + "&type=apk";
    }
}
