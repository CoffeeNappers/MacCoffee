package com.vkontakte.android.data;

import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vk.imageloader.OkHttpNetworkFetcher;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.api.messages.MessagesGetHistory;
import com.vkontakte.android.api.messages.MessagesSend;
import com.vkontakte.android.api.newsfeed.NewsfeedGet;
import com.vkontakte.android.api.stats.StatsBenchmark;
import com.vkontakte.android.api.stats.StatsTrackDownloadServerState;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.configs.ProfilerConfig;
import com.vkontakte.android.media.Vigo;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.upload.PhotoUploadTask;
import com.vkontakte.android.utils.L;
import io.sentry.DefaultSentryClientFactory;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BenchmarkTracker implements OkHttpNetworkFetcher.HttpImageBenchmarkReporter {
    private static boolean isResumed;
    private ArrayList<Integer> apiConsecutiveFailuresCount;
    private int audioLoadFailures;
    private final SequenceTracker audioLoadTimeTracker;
    private int currentConsecutiveFailures;
    private List<ProfilerConfig.DownloadPattern> downloadPatterns;
    private HashMap<String, Integer> imageLoadFailures;
    private final SequenceTracker imageLoadTimeTracker;
    private boolean profilerEnabled;
    private final Random random;
    private final SequenceTracker responseTimeTracker;
    private final SequenceTracker videoSpeedTracker;
    private static final Vigo vigo = VKApplication.vigo;
    private static final Runnable vigoInit = new VigoInitRunnable();
    private static final VigoDataSender vigoSender = new VigoDataSender();
    private static final MFRunnable mfRunnable = new MFRunnable();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Holder {
        private static final BenchmarkTracker INSTANCE = new BenchmarkTracker();

        private Holder() {
        }
    }

    public static BenchmarkTracker getInstance() {
        return Holder.INSTANCE;
    }

    private BenchmarkTracker() {
        this.random = new Random();
        this.videoSpeedTracker = new SequenceTracker();
        this.responseTimeTracker = new SequenceTracker();
        this.imageLoadTimeTracker = new SequenceTracker();
        this.audioLoadTimeTracker = new SequenceTracker();
        this.imageLoadFailures = new HashMap<>();
        this.apiConsecutiveFailuresCount = new ArrayList<>();
        this.downloadPatterns = Collections.emptyList();
        updateProfileConfig(VKAccountManager.getCurrent());
        OkHttpNetworkFetcher.setBenchmarkReporter(this);
        AppStateTracker.addCallback(new ApplicationStateTracker());
    }

    private void reset() {
        this.responseTimeTracker.reset();
        this.apiConsecutiveFailuresCount.clear();
        this.currentConsecutiveFailures = 0;
        this.imageLoadTimeTracker.reset();
        this.imageLoadFailures.clear();
        this.audioLoadTimeTracker.reset();
        this.audioLoadFailures = 0;
        this.videoSpeedTracker.reset();
    }

    public void updateProfileConfig(VKAccount account) {
        List<ProfilerConfig.DownloadPattern> downloadPatterns;
        ProfilerConfig profilerConfig = account.getProfilerConfig();
        this.profilerEnabled = profilerConfig != null && profilerConfig.isApiRequests();
        if (profilerConfig == null) {
            downloadPatterns = Collections.emptyList();
        } else {
            downloadPatterns = profilerConfig.getDownloadPatterns();
        }
        this.downloadPatterns = downloadPatterns;
    }

    public synchronized void reportApiResponseSucceeded(int responseTimeMiliseconds) {
        this.responseTimeTracker.reportObserviation(responseTimeMiliseconds);
        if (this.currentConsecutiveFailures > 0) {
            this.apiConsecutiveFailuresCount.add(Integer.valueOf(this.currentConsecutiveFailures));
            this.currentConsecutiveFailures = 0;
        }
    }

    public synchronized void reportApiResponseFailed() {
        if (checkIsConnectedNow()) {
            this.currentConsecutiveFailures++;
        }
    }

    @Override // com.vk.imageloader.OkHttpNetworkFetcher.HttpImageBenchmarkReporter
    public synchronized void reportImageLoadSucceeded(String uri, int loadTimeMilliseconds, int fetchTimeMilliseconds, int byteSize, boolean originalSize) {
        this.imageLoadTimeTracker.reportObserviation(loadTimeMilliseconds);
        trackContentDownload(uri, byteSize, loadTimeMilliseconds, 0, null);
        if (this.profilerEnabled) {
            vigo.addSuccessApiMeasurement(originalSize ? (byte) 3 : (byte) 2, fetchTimeMilliseconds, 0, byteSize);
        }
    }

    @Override // com.vk.imageloader.OkHttpNetworkFetcher.HttpImageBenchmarkReporter
    public synchronized void reportImageLoadFailure(String uri, int responseCode, Exception e, boolean apiError, boolean originalSize) {
        String serverName;
        if (checkIsConnectedNow() && (serverName = fetchServerName(uri)) != null && !serverName.isEmpty()) {
            if (!this.imageLoadFailures.containsKey(serverName)) {
                this.imageLoadFailures.put(serverName, 1);
            } else {
                this.imageLoadFailures.put(serverName, Integer.valueOf(this.imageLoadFailures.get(serverName).intValue() + 1));
            }
            if (apiError) {
                trackContentDownload(uri, 0L, 0L, responseCode, e);
            }
            if (this.profilerEnabled) {
                byte category = originalSize ? (byte) 3 : (byte) 2;
                if (apiError) {
                    vigo.addErrorApiMeasurement(category, 0, 0);
                } else {
                    vigo.countFailedApiMeasurement(category);
                }
            }
        }
    }

    public synchronized void reportAudioLoadSucceeded(int loadTimeMilliseconds) {
        this.audioLoadTimeTracker.reportObserviation(loadTimeMilliseconds);
    }

    public synchronized void reportAudioLoadFailure() {
        this.audioLoadFailures++;
    }

    public synchronized void reportVideoSpeed(int videoSpeedBytesPerSecond) {
        this.videoSpeedTracker.reportObserviation(videoSpeedBytesPerSecond);
    }

    public synchronized void sendBenchmarkData() {
        StatsBenchmark benchmarkRequest = new StatsBenchmark(this.responseTimeTracker.getAverage(), this.apiConsecutiveFailuresCount, this.imageLoadTimeTracker.getAverage(), this.imageLoadFailures, this.audioLoadTimeTracker.getAverage(), this.audioLoadFailures, this.videoSpeedTracker.getAverage());
        reset();
        if (benchmarkRequest.getHaveDataToSend()) {
            benchmarkRequest.exec();
        }
    }

    private String fetchServerName(String uri) {
        if (uri == null) {
            return "";
        }
        String[] splitStrings = uri.split(CameraUtilsEffects.FILE_DELIM);
        if (splitStrings.length > 3) {
            if (splitStrings[2].equals("pp.vk.me")) {
                return splitStrings[3];
            }
            String[] hostNameSplit = splitStrings[2].split("\\.");
            if (hostNameSplit.length > 0) {
                return hostNameSplit[0];
            }
        }
        return "";
    }

    private boolean checkIsConnectedNow() {
        try {
            return NetworkStateReceiver.isConnected();
        } catch (Exception e) {
            return false;
        }
    }

    public void trackContentDownload(@NonNull String uri, long byteSize, long loadTimeMilliseconds, int responseCode, @Nullable Exception exception) {
        try {
            for (ProfilerConfig.DownloadPattern pattern : this.downloadPatterns) {
                if (pattern.getPattern().matcher(uri).matches()) {
                    float probability = exception == null ? pattern.getProbability() : pattern.getErrorProbability();
                    if (this.random.nextFloat() <= probability) {
                        ResultlessAPIRequest apiRequest = new StatsTrackDownloadServerState(pattern.getType(), uri, byteSize, loadTimeMilliseconds, responseCode, exception);
                        apiRequest.persistWithToken();
                        apiRequest.background = true;
                        apiRequest.exec();
                        return;
                    }
                    return;
                }
            }
        } catch (Exception e) {
            com.vk.analytics.Analytics.logException(e);
            L.e("BenchmarkTracker", e);
        }
    }

    public void addSuccessApiMeasurement(String method, int requestRtt, int requestPt, long contentLength) {
        byte cat = convertToCategory(method);
        if (cat > 0) {
            vigo.addSuccessApiMeasurement(cat, requestRtt, requestPt, contentLength);
        }
    }

    public void addErrorApiMeasurement(String method, int requestRtt, int requestPt) {
        byte cat = convertToCategory(method);
        if (cat > 0) {
            vigo.addErrorApiMeasurement(cat, requestRtt, requestPt);
        }
    }

    public void countFailedApiMeasurement(String method) {
        byte cat = convertToCategory(method);
        if (cat > 0) {
            vigo.countFailedApiMeasurement(cat);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startVigoTracking() {
        if (this.profilerEnabled) {
            APIController.runInBg(vigoInit);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopVigoTracking() {
        if (this.profilerEnabled) {
            APIController.removeBgCallbacks(vigoSender);
            sentVigoData();
            vigo.collectApiChangesOFF();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void sentVigoData() {
        L.d("Benchmark", "Vigo data send");
        Uri uri = vigo.fillApiUrlParams(Uri.parse("http://api.vigo.ru/uxzoom/2/notify").buildUpon()).build();
        Analytics.trackExternal(new StatisticUrl(uri.toString()));
    }

    /* loaded from: classes2.dex */
    private static class VigoInitRunnable implements Runnable {
        private VigoInitRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            L.d("Benchmark", "Vigo init");
            Uri uri = BenchmarkTracker.vigo.fillApiUrlParams(Uri.parse("http://api.vigo.ru/uxzoom/2/network_status").buildUpon()).build();
            byte[] result = Analytics.sendRequest(uri.toString());
            if (result == null) {
                BenchmarkTracker.vigo.collectApiChangesON();
                APIController.runInBgDelayed(BenchmarkTracker.vigoSender, BenchmarkTracker.vigoSender.timeout);
                return;
            }
            try {
                JSONObject response = new JSONObject(new String(result));
                boolean supported = response.getBoolean("supported");
                long timeout = response.optInt(DefaultSentryClientFactory.TIMEOUT_OPTION, 60) * 1000;
                if (supported) {
                    BenchmarkTracker.vigo.collectApiChangesON();
                    BenchmarkTracker.vigoSender.setTimeout(timeout);
                    APIController.runInBgDelayed(BenchmarkTracker.vigoSender, BenchmarkTracker.vigoSender.timeout);
                } else {
                    BenchmarkTracker.vigo.collectApiChangesOFF();
                }
            } catch (JSONException e) {
                L.e("Vigo", "Parsing error " + e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class VigoDataSender implements Runnable {
        static final long MIN_TIMEOUT = 60000;
        long timeout;

        private VigoDataSender() {
            this.timeout = 60000L;
        }

        void setTimeout(long timeout) {
            this.timeout = Math.max(60000L, timeout);
        }

        @Override // java.lang.Runnable
        public void run() {
            if (BenchmarkTracker.isResumed) {
                BenchmarkTracker.sentVigoData();
                APIController.runInBgDelayed(this, this.timeout);
            }
        }
    }

    private static byte convertToCategory(String method) {
        String valueOf = String.valueOf(method);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1909929562:
                if (valueOf.equals(Messages.METHOD_NAME)) {
                    c = 2;
                    break;
                }
                break;
            case -705562902:
                if (valueOf.equals(MessagesSend.METHOD_NAME)) {
                    c = 4;
                    break;
                }
                break;
            case 326067963:
                if (valueOf.equals(NewsfeedGet.METHOD_NAME)) {
                    c = 0;
                    break;
                }
                break;
            case 1333819709:
                if (valueOf.equals(PhotoUploadTask.METHOD_NAME)) {
                    c = 1;
                    break;
                }
                break;
            case 1626519104:
                if (valueOf.equals(MessagesGetHistory.METHOD_NAME)) {
                    c = 3;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return (byte) 1;
            case 1:
                return (byte) 4;
            case 2:
                return (byte) 5;
            case 3:
                return (byte) 6;
            case 4:
                return (byte) 7;
            default:
                return (byte) 0;
        }
    }

    public void startMFTracking(String endPointUrl, long timeInterval) {
        mfRunnable.setEndPointUrl(endPointUrl);
        mfRunnable.setTimeInterval(timeInterval);
        startMFTracking();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startMFTracking() {
        if (!mfRunnable.isRunning()) {
            APIController.runInBg(mfRunnable);
        }
    }

    public void stopAndResetMFTracking() {
        mfRunnable.setEndPointUrl(null);
        stopMFTracking();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopMFTracking() {
        APIController.removeBgCallbacks(mfRunnable);
        mfRunnable.setRunning(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class MFRunnable implements Runnable {
        static final long MIN_TIMEOUT = 30000;
        private String endPointUrl;
        private boolean isRunning;
        private long timeInterval;

        private MFRunnable() {
        }

        public boolean isRunning() {
            return this.isRunning;
        }

        public void setRunning(boolean running) {
            this.isRunning = running;
        }

        public void setEndPointUrl(String endPointUrl) {
            this.endPointUrl = endPointUrl;
        }

        public void setTimeInterval(long timeInterval) {
            this.timeInterval = timeInterval;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (TextUtils.isEmpty(this.endPointUrl)) {
                this.isRunning = false;
                return;
            }
            this.isRunning = true;
            Analytics.trackExternal(new StatisticUrl(this.endPointUrl));
            APIController.runInBgDelayed(BenchmarkTracker.mfRunnable, Math.max(30000L, this.timeInterval));
        }
    }

    /* loaded from: classes2.dex */
    private class ApplicationStateTracker implements AppStateTracker.Callback {
        private ApplicationStateTracker() {
        }

        @Override // com.vkontakte.android.AppStateTracker.Callback
        public void onAppResumed() {
            if (!BenchmarkTracker.isResumed) {
                boolean unused = BenchmarkTracker.isResumed = true;
                BenchmarkTracker.this.startVigoTracking();
                BenchmarkTracker.this.startMFTracking();
            }
        }

        @Override // com.vkontakte.android.AppStateTracker.Callback
        public void onAppPaused() {
            if (BenchmarkTracker.isResumed) {
                boolean unused = BenchmarkTracker.isResumed = false;
                BenchmarkTracker.this.stopVigoTracking();
                BenchmarkTracker.this.stopMFTracking();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class SequenceTracker {
        private float average;
        private int observationsCount;

        public int getAverage() {
            return Math.round(this.average);
        }

        public void reportObserviation(int observationValue) {
            this.observationsCount++;
            this.average += (observationValue - this.average) / this.observationsCount;
        }

        public void reset() {
            this.observationsCount = 0;
            this.average = 0.0f;
        }
    }
}
