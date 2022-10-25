package net.hockeyapp.android.tasks;

import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.LinkedList;
import java.util.Queue;
import net.hockeyapp.android.Constants;
import net.hockeyapp.android.objects.FeedbackAttachment;
import net.hockeyapp.android.utils.AsyncTaskUtils;
import net.hockeyapp.android.utils.HockeyLog;
import net.hockeyapp.android.utils.ImageUtils;
import net.hockeyapp.android.views.AttachmentView;
/* loaded from: classes3.dex */
public class AttachmentDownloader {
    private boolean downloadRunning;
    private Queue<DownloadJob> queue;

    /* loaded from: classes3.dex */
    private static class AttachmentDownloaderHolder {
        public static final AttachmentDownloader INSTANCE = new AttachmentDownloader();

        private AttachmentDownloaderHolder() {
        }
    }

    public static AttachmentDownloader getInstance() {
        return AttachmentDownloaderHolder.INSTANCE;
    }

    private AttachmentDownloader() {
        this.queue = new LinkedList();
        this.downloadRunning = false;
    }

    public void download(FeedbackAttachment feedbackAttachment, AttachmentView attachmentView) {
        this.queue.add(new DownloadJob(feedbackAttachment, attachmentView));
        downloadNext();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void downloadNext() {
        DownloadJob downloadJob;
        if (!this.downloadRunning && (downloadJob = this.queue.peek()) != null) {
            DownloadTask downloadTask = new DownloadTask(downloadJob, new Handler() { // from class: net.hockeyapp.android.tasks.AttachmentDownloader.1
                @Override // android.os.Handler
                public void handleMessage(Message msg) {
                    final DownloadJob retryCandidate = (DownloadJob) AttachmentDownloader.this.queue.poll();
                    if (!retryCandidate.isSuccess() && retryCandidate.consumeRetry()) {
                        postDelayed(new Runnable() { // from class: net.hockeyapp.android.tasks.AttachmentDownloader.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                AttachmentDownloader.this.queue.add(retryCandidate);
                                AttachmentDownloader.this.downloadNext();
                            }
                        }, 3000L);
                    }
                    AttachmentDownloader.this.downloadRunning = false;
                    AttachmentDownloader.this.downloadNext();
                }
            });
            this.downloadRunning = true;
            AsyncTaskUtils.execute(downloadTask);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class DownloadJob {
        private final AttachmentView attachmentView;
        private final FeedbackAttachment feedbackAttachment;
        private int remainingRetries;
        private boolean success;

        private DownloadJob(FeedbackAttachment feedbackAttachment, AttachmentView attachmentView) {
            this.feedbackAttachment = feedbackAttachment;
            this.attachmentView = attachmentView;
            this.success = false;
            this.remainingRetries = 2;
        }

        public FeedbackAttachment getFeedbackAttachment() {
            return this.feedbackAttachment;
        }

        public AttachmentView getAttachmentView() {
            return this.attachmentView;
        }

        public boolean isSuccess() {
            return this.success;
        }

        public void setSuccess(boolean success) {
            this.success = success;
        }

        public boolean hasRetry() {
            return this.remainingRetries > 0;
        }

        public boolean consumeRetry() {
            int i = this.remainingRetries - 1;
            this.remainingRetries = i;
            return i >= 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class DownloadTask extends AsyncTask<Void, Integer, Boolean> {
        private final DownloadJob downloadJob;
        private final Handler handler;
        private File dropFolder = Constants.getHockeyAppStorageDir();
        private Bitmap bitmap = null;
        private int bitmapOrientation = 0;

        public DownloadTask(DownloadJob downloadJob, Handler handler) {
            this.downloadJob = downloadJob;
            this.handler = handler;
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Boolean doInBackground(Void... args) {
            FeedbackAttachment attachment = this.downloadJob.getFeedbackAttachment();
            if (attachment.isAvailableInCache()) {
                HockeyLog.error("Cached...");
                loadImageThumbnail();
                return true;
            }
            HockeyLog.error("Downloading...");
            boolean success = downloadAttachment(attachment.getUrl(), attachment.getCacheId());
            if (success) {
                loadImageThumbnail();
            }
            return Boolean.valueOf(success);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onProgressUpdate(Integer... values) {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Boolean success) {
            AttachmentView attachmentView = this.downloadJob.getAttachmentView();
            this.downloadJob.setSuccess(success.booleanValue());
            if (success.booleanValue()) {
                attachmentView.setImage(this.bitmap, this.bitmapOrientation);
            } else if (!this.downloadJob.hasRetry()) {
                attachmentView.signalImageLoadingError();
            }
            this.handler.sendEmptyMessage(0);
        }

        private void loadImageThumbnail() {
            try {
                String filename = this.downloadJob.getFeedbackAttachment().getCacheId();
                AttachmentView attachmentView = this.downloadJob.getAttachmentView();
                this.bitmapOrientation = ImageUtils.determineOrientation(new File(this.dropFolder, filename));
                int width = this.bitmapOrientation == 1 ? attachmentView.getWidthLandscape() : attachmentView.getWidthPortrait();
                int height = this.bitmapOrientation == 1 ? attachmentView.getMaxHeightLandscape() : attachmentView.getMaxHeightPortrait();
                this.bitmap = ImageUtils.decodeSampledBitmap(new File(this.dropFolder, filename), width, height);
            } catch (IOException e) {
                e.printStackTrace();
                this.bitmap = null;
            }
        }

        private boolean downloadAttachment(String urlString, String filename) {
            try {
                URL url = new URL(urlString);
                URLConnection connection = createConnection(url);
                connection.connect();
                int lengthOfFile = connection.getContentLength();
                String status = connection.getHeaderField("Status");
                if (status != null && !status.startsWith("200")) {
                    return false;
                }
                File file = new File(this.dropFolder, filename);
                InputStream input = new BufferedInputStream(connection.getInputStream());
                OutputStream output = new FileOutputStream(file);
                byte[] data = new byte[1024];
                long total = 0;
                while (true) {
                    int count = input.read(data);
                    if (count == -1) {
                        break;
                    }
                    total += count;
                    publishProgress(Integer.valueOf((int) ((100 * total) / lengthOfFile)));
                    output.write(data, 0, count);
                }
                output.flush();
                output.close();
                input.close();
                return total > 0;
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }

        private URLConnection createConnection(URL url) throws IOException {
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.addRequestProperty("User-Agent", Constants.SDK_USER_AGENT);
            connection.setInstanceFollowRedirects(true);
            if (Build.VERSION.SDK_INT <= 9) {
                connection.setRequestProperty("connection", "close");
            }
            return connection;
        }
    }
}
