package com.vkontakte.android.media;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.support.v4.util.Pair;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.auth.configs.VideoConfig;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.media.AbsVideoPlayer;
import com.vkontakte.android.utils.L;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public class VideoPools {
    static final boolean DEBUG = false;
    static final String TAG = "VideoPools";
    static final Context context;
    static final PoolPlayerFactory exoPool;
    public static final Handler handler;
    private static final HandlerThread handlerThread = new HandlerThread("VideoPoolsThread");
    static final PoolPlayerFactory mp4CompatPool;
    private static boolean overlayDialogVisible;
    static final Executor serialExecutor;

    /* loaded from: classes.dex */
    public interface PlayerContext extends AbsVideoPlayer.PlayerStateListener {
        void onPause(Activity activity);

        void onPlayerAttached(AbsVideoPlayer absVideoPlayer);

        void onPlayerDetached(AbsVideoPlayer absVideoPlayer);

        void onResume(Activity activity);
    }

    /* loaded from: classes3.dex */
    interface PlayerFactory {
        boolean attachContext(Pair<VideoFile, Integer> pair, PlayerContext playerContext);

        boolean detachContext(Pair<VideoFile, Integer> pair);

        @NonNull
        AbsVideoPlayer getPlayer(Pair<VideoFile, Integer> pair, String str, int i, boolean z, boolean z2, String str2);

        boolean releasePlayer(Pair<VideoFile, Integer> pair);
    }

    static {
        handlerThread.start();
        handler = new Handler(handlerThread.getLooper());
        serialExecutor = new SerialExecutor();
        context = VKApplication.context;
        exoPool = new PoolPlayerFactory(context) { // from class: com.vkontakte.android.media.VideoPools.1
            @Override // com.vkontakte.android.media.VideoPools.PoolPlayerFactory
            @NonNull
            public AbsVideoPlayer createPlayer(Context context2, VideoFile file, String referrer) {
                return new ExoVideoPlayer(context2, file, referrer);
            }
        };
        mp4CompatPool = new PoolPlayerFactory(context) { // from class: com.vkontakte.android.media.VideoPools.2
            @Override // com.vkontakte.android.media.VideoPools.PoolPlayerFactory
            @NonNull
            public AbsVideoPlayer createPlayer(Context context2, VideoFile file, String referrer) {
                return new NativeVideoPlayer(context2, file, referrer);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class SerialExecutor implements Executor {
        Runnable mActive;
        final ArrayDeque<Runnable> mTasks;

        private SerialExecutor() {
            this.mTasks = new ArrayDeque<>();
        }

        @Override // java.util.concurrent.Executor
        public synchronized void execute(@NonNull final Runnable r) {
            this.mTasks.offer(new Runnable() { // from class: com.vkontakte.android.media.VideoPools.SerialExecutor.1
                {
                    SerialExecutor.this = this;
                }

                @Override // java.lang.Runnable
                public void run() {
                    try {
                        VideoPools.handler.post(r);
                    } finally {
                        SerialExecutor.this.scheduleNext();
                    }
                }
            });
            if (this.mActive == null) {
                scheduleNext();
            }
        }

        protected synchronized void scheduleNext() {
            Runnable poll = this.mTasks.poll();
            this.mActive = poll;
            if (poll != null) {
                AsyncTask.sPool.execute(this.mActive);
            }
        }
    }

    public static void setOverlayDialogVisible(boolean overlayDialogVisible2) {
        overlayDialogVisible = overlayDialogVisible2;
    }

    public static void obtainAndAttachPlayer(VideoFile file, int index, String url, int quality, boolean useVigo, boolean autoplay, String referrer, PlayerContext playerContext) {
        serialExecutor.execute(VideoPools$$Lambda$1.lambdaFactory$(file, index, url, quality, useVigo, autoplay, referrer, playerContext));
    }

    public static /* synthetic */ void lambda$obtainAndAttachPlayer$1(VideoFile file, int index, String url, int quality, boolean useVigo, boolean autoplay, String referrer, PlayerContext playerContext) {
        L.d(TAG, "obtainAndAttachPlayer " + file.toString());
        Pair<VideoFile, Integer> pair = new Pair<>(file, Integer.valueOf(index));
        if (!obtainPlayer(pair, url, quality, useVigo, autoplay, referrer)) {
            ViewUtils.post(VideoPools$$Lambda$3.lambdaFactory$(playerContext));
        }
        attachContext(pair, playerContext);
    }

    public static void detachAndReleasePlayer(VideoFile file, int index) {
        serialExecutor.execute(VideoPools$$Lambda$2.lambdaFactory$(file, index));
    }

    public static /* synthetic */ void lambda$detachAndReleasePlayer$2(VideoFile file, int index) {
        L.d(TAG, "detachAndReleasePlayer " + file.toString());
        Pair<VideoFile, Integer> pair = new Pair<>(file, Integer.valueOf(index));
        detachContext(pair);
        releasePlayer(pair);
    }

    private static boolean obtainPlayer(Pair<VideoFile, Integer> file, String url, int quality, boolean useVigo, boolean autoplay, String referrer) {
        if (Build.VERSION.SDK_INT < 16) {
            return mp4CompatPool.getPlayer(file, url, quality, useVigo, autoplay, referrer) != null;
        }
        int type = VideoConfig.getInstance().getPlayerType();
        if (type != 0) {
            switch (type) {
                case 1:
                    return mp4CompatPool.getPlayer(file, url, quality, useVigo, autoplay, referrer) != null;
            }
        }
        return exoPool.getPlayer(file, url, quality, useVigo, autoplay, referrer) != null;
    }

    private static boolean attachContext(Pair<VideoFile, Integer> file, PlayerContext playerContext) {
        return exoPool.attachContext(file, playerContext) || mp4CompatPool.attachContext(file, playerContext);
    }

    private static boolean detachContext(Pair<VideoFile, Integer> file) {
        return exoPool.detachContext(file) || mp4CompatPool.detachContext(file);
    }

    private static boolean releasePlayer(Pair<VideoFile, Integer> file) {
        return exoPool.releasePlayer(file) || mp4CompatPool.releasePlayer(file);
    }

    public static void onPause(Activity activity) {
        onPause(activity, exoPool);
        onPause(activity, mp4CompatPool);
    }

    public static void onResume(Activity activity) {
        if (!overlayDialogVisible) {
            onResume(activity, exoPool);
            onResume(activity, mp4CompatPool);
        }
    }

    private static void onPause(Activity activity, PoolPlayerFactory factory) {
        Map<Pair<VideoFile, Integer>, PlayerHolder> pool = new HashMap<>(factory.pool);
        for (PlayerHolder holder : pool.values()) {
            Set<PlayerContext> contexts = new HashSet<>(holder.playerContexts);
            for (PlayerContext context2 : contexts) {
                if (context2 != null) {
                    context2.onPause(activity);
                }
            }
        }
    }

    private static void onResume(Activity activity, PoolPlayerFactory factory) {
        Map<Pair<VideoFile, Integer>, PlayerHolder> pool = new HashMap<>(factory.pool);
        for (PlayerHolder holder : pool.values()) {
            Set<PlayerContext> contexts = new HashSet<>(holder.playerContexts);
            for (PlayerContext context2 : contexts) {
                if (context2 != null) {
                    context2.onResume(activity);
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    public static class PlayerHolder {
        String lastURL;
        final AbsVideoPlayer player;
        final Stack<PlayerContext> playerContexts;
        final AtomicInteger refCounter;

        private PlayerHolder(AbsVideoPlayer player) {
            this.refCounter = new AtomicInteger(0);
            this.playerContexts = new Stack<>();
            this.player = player;
        }

        public void detachCallbacks() {
            PlayerContext playerContext = this.playerContexts.pop();
            if (playerContext != null) {
                playerContext.onPlayerDetached(this.player);
            }
            if (this.playerContexts.isEmpty()) {
                this.player.setPlayerStateListener(null);
                return;
            }
            PlayerContext playerContext2 = this.playerContexts.peek();
            playerContext2.onPlayerAttached(this.player);
            this.player.setPlayerStateListener(playerContext2);
        }

        public void attachCallbacks(PlayerContext playerContext) {
            PlayerContext prev;
            if (!this.playerContexts.isEmpty() && (prev = this.playerContexts.peek()) != null) {
                prev.onPlayerDetached(this.player);
            }
            this.playerContexts.add(playerContext);
            playerContext.onPlayerAttached(this.player);
            this.player.setPlayerStateListener(playerContext);
        }
    }

    /* loaded from: classes3.dex */
    public static abstract class PoolPlayerFactory implements PlayerFactory {
        final Context context;
        final Map<Pair<VideoFile, Integer>, PlayerHolder> pool = new ConcurrentHashMap();

        @NonNull
        protected abstract AbsVideoPlayer createPlayer(Context context, VideoFile videoFile, String str);

        protected PoolPlayerFactory(Context context) {
            this.context = context;
        }

        @Override // com.vkontakte.android.media.VideoPools.PlayerFactory
        @NonNull
        public synchronized AbsVideoPlayer getPlayer(Pair<VideoFile, Integer> file, String url, int quality, boolean useVigo, boolean autoplay, String referrer) {
            PlayerHolder holder;
            L.d("AUTOPLAY", "getPlayer " + this.pool.size());
            holder = this.pool.get(file);
            if (holder == null) {
                holder = new PlayerHolder(createPlayer(this.context, file.first, referrer));
                this.pool.put(file, holder);
            }
            if (holder.lastURL == null || !holder.lastURL.equals(url)) {
                holder.lastURL = url;
                holder.player.setDataSourceAndPrepare(url, quality, useVigo, autoplay);
            }
            holder.refCounter.incrementAndGet();
            return holder.player;
        }

        @Override // com.vkontakte.android.media.VideoPools.PlayerFactory
        public synchronized boolean attachContext(Pair<VideoFile, Integer> file, PlayerContext playerContext) {
            boolean z;
            PlayerHolder holder = this.pool.get(file);
            if (holder != null) {
                holder.attachCallbacks(playerContext);
                z = true;
            } else {
                z = false;
            }
            return z;
        }

        @Override // com.vkontakte.android.media.VideoPools.PlayerFactory
        public synchronized boolean detachContext(Pair<VideoFile, Integer> file) {
            boolean z;
            PlayerHolder holder = this.pool.get(file);
            if (holder != null) {
                holder.detachCallbacks();
                z = true;
            } else {
                z = false;
            }
            return z;
        }

        @Override // com.vkontakte.android.media.VideoPools.PlayerFactory
        public synchronized boolean releasePlayer(Pair<VideoFile, Integer> file) {
            boolean z = true;
            synchronized (this) {
                PlayerHolder holder = this.pool.get(file);
                if (holder == null) {
                    z = false;
                } else if (holder.refCounter.decrementAndGet() == 0) {
                    L.d("AUTOPLAY", "releasePlayer " + this.pool.size());
                    holder.player.stopAndRelease();
                    holder.player.sendViewedRanges();
                    this.pool.remove(file);
                }
            }
            return z;
        }
    }
}
