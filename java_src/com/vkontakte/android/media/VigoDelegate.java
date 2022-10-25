package com.vkontakte.android.media;

import android.net.TrafficStats;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.statistics.StatisticUrl;
import java.util.Calendar;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public class VigoDelegate {
    public static final int AUTO_QUALITY = 100;
    private static final int HEARTBEAT_TIMEOUT = 30;
    private int bufNum;
    private long bufStartTime;
    private Integer bufferPct;
    private String host;
    private int instantBitrate;
    private volatile boolean isError;
    private boolean isPaused;
    private boolean isPrepared;
    private boolean isQualityAdviserSupported;
    private long playbackStartTime;
    private long playbackStartTs;
    private int quality;
    private String svcid;
    private int timeZone;
    private String url;
    private String watchId;
    private final AtomicInteger heartbeatTicker = new AtomicInteger();
    private final AtomicInteger seqNum = new AtomicInteger();
    boolean odd = false;

    public static String getSVCid(boolean autoplay) {
        return autoplay ? "5d19" : "5d18";
    }

    public void setDataSourceAndPrepare(String url, int quality, String svcid) {
        if (quality != 100) {
            this.url = url;
        }
        this.quality = quality;
        this.svcid = svcid;
    }

    public void setHost(Uri uri) {
        try {
            this.host = uri.getHost();
        } catch (Exception e) {
        }
    }

    public void pause(boolean isPlaying, long duration, long position) {
        if (this.isQualityAdviserSupported && this.isPrepared && isPlaying) {
            this.isPaused = true;
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        playbackEvents.addByteToBuffer((byte) 4).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
        }
    }

    public void play(long duration, long position) {
        if (this.isQualityAdviserSupported && this.isPaused) {
            this.isPaused = false;
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        playbackEvents.addByteToBuffer((byte) 5).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
        }
    }

    public void bitrateChange(int newBitrate, long duration, long position) {
        if (this.isQualityAdviserSupported && this.instantBitrate != newBitrate) {
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            this.instantBitrate = newBitrate;
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        playbackEvents.addByteToBuffer((byte) 7).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
        }
    }

    public void seek(float offset, boolean isPlaying, long duration, long position) {
        if (this.isQualityAdviserSupported && isPlaying && this.isPrepared) {
            if (!this.isPaused) {
                this.heartbeatTicker.set(30);
                long playbackTime = SystemClock.elapsedRealtime();
                long bytes = TrafficStats.getTotalRxBytes();
                try {
                    VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                    try {
                        contentInfoParts.setTag((short) 2);
                        try {
                            contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                        } catch (Exception e) {
                            contentInfoParts.reset();
                        }
                        playbackInfoParts.setTag((short) 3);
                        try {
                            playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                        } catch (Exception e2) {
                            playbackInfoParts.reset();
                        }
                        playbackEvents.setTag((short) 4);
                        try {
                            playbackEvents.addByteToBuffer((byte) 7).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(bytes).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0);
                            this.bufferPct = null;
                            playbackEvents.addByteToBuffer((byte) 6).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) offset : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(bytes).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                        } catch (Exception e3) {
                            playbackEvents.reset();
                        }
                        VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                        sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    } catch (Exception e4) {
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    }
                } catch (Exception e5) {
                } finally {
                    this.bufferPct = null;
                }
            }
        }
    }

    public void beforeSetDataSource() {
        this.isQualityAdviserSupported = this.quality != -1;
        this.isPrepared = false;
        this.isPaused = false;
        this.isError = false;
        this.heartbeatTicker.set(0);
        this.watchId = UUID.randomUUID().toString();
        this.playbackStartTime = SystemClock.elapsedRealtime();
        this.seqNum.set(0);
        this.bufNum = 0;
        this.bufStartTime = 0L;
        this.bufferPct = null;
        this.playbackStartTs = System.currentTimeMillis();
        this.timeZone = Calendar.getInstance().getTimeZone().getOffset(this.playbackStartTs) / 60000;
        this.instantBitrate = 0;
        try {
            this.host = Uri.parse(this.url).getHost();
        } catch (Exception e) {
        }
    }

    public void release(long duration, long position) {
        if (this.isQualityAdviserSupported) {
            this.heartbeatTicker.set(0);
            long playbackTime = SystemClock.elapsedRealtime();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    try {
                        contentInfoParts.setTag((short) 2);
                        try {
                            contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                        } catch (Exception e) {
                            contentInfoParts.reset();
                        }
                        playbackInfoParts.setTag((short) 3);
                        try {
                            playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                        } catch (Exception e2) {
                            playbackInfoParts.reset();
                        }
                        playbackEvents.setTag((short) 4);
                        try {
                            playbackEvents.addByteToBuffer((byte) 9).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                        } catch (Exception e3) {
                            playbackEvents.reset();
                        }
                        VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                        sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    } finally {
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    }
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            } finally {
                Vigo vigo = VKApplication.getVigo(VKApplication.context);
                vigo.collectPlaybackChangesOFF();
            }
        }
    }

    public void onBufferingUpdate(int percent, long duration, long position) {
        if (this.isQualityAdviserSupported) {
            if ((this.bufferPct == null && this.seqNum.get() > 0) || (percent >= 100 && (this.bufferPct == null || this.bufferPct.intValue() < 100))) {
                this.heartbeatTicker.set(30);
                long playbackTime = SystemClock.elapsedRealtime();
                try {
                    VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                    try {
                        contentInfoParts.setTag((short) 2);
                        try {
                            contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                        } catch (Exception e) {
                            contentInfoParts.reset();
                        }
                        playbackInfoParts.setTag((short) 3);
                        try {
                            playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                        } catch (Exception e2) {
                            playbackInfoParts.reset();
                        }
                        playbackEvents.setTag((short) 4);
                        try {
                            playbackEvents.addByteToBuffer((byte) 7).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                        } catch (Exception e3) {
                            playbackEvents.reset();
                        }
                        VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                        sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    } catch (Exception e4) {
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    }
                } catch (Exception e5) {
                }
            }
            this.bufferPct = Integer.valueOf(percent);
        }
    }

    public void onBufferingEnd(long duration, long position) {
        if (this.isQualityAdviserSupported && !this.isPaused && this.bufStartTime != 0) {
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        playbackEvents.addByteToBuffer((byte) 3).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer((byte) 0).addIntToBuffer(this.bufNum).addIntToBuffer((int) (playbackTime - this.bufStartTime)).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
            this.bufStartTime = 0L;
        }
    }

    public void onBufferingStart(long duration, long position) {
        if (this.isQualityAdviserSupported && !this.isPaused) {
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            this.bufStartTime = playbackTime;
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        VigoBinaryBuffer addByteToBuffer = playbackEvents.addByteToBuffer((byte) 2).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0);
                        int i = this.bufNum + 1;
                        this.bufNum = i;
                        addByteToBuffer.addIntToBuffer(i).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
        }
    }

    public void onError(int what, int extra) {
        if (!this.isError) {
            this.isError = true;
            if (this.isQualityAdviserSupported) {
                this.heartbeatTicker.set(0);
                long playbackTime = SystemClock.elapsedRealtime();
                try {
                    VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                    try {
                        contentInfoParts.setTag((short) 2);
                        try {
                            contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                        } catch (Exception e) {
                            contentInfoParts.reset();
                        }
                        playbackInfoParts.setTag((short) 3);
                        try {
                            playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                        } catch (Exception e2) {
                            playbackInfoParts.reset();
                        }
                        playbackEvents.setTag((short) 4);
                        try {
                            playbackEvents.addByteToBuffer((byte) 10).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(-1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).addStringToBuffer(what + ":" + extra).updateLength();
                        } catch (Exception e3) {
                            playbackEvents.reset();
                        }
                        VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                        sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    } catch (Exception e4) {
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    }
                } catch (Exception e5) {
                }
            }
        }
    }

    public void onPlaybackComplete(long duration, long position) {
        if (this.isQualityAdviserSupported) {
            this.isPaused = true;
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        playbackEvents.addByteToBuffer((byte) 4).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
        }
    }

    public void vigoOnPrepared(long duration, long position) {
        this.isPrepared = true;
        if (this.isQualityAdviserSupported && !this.isPaused && this.bufStartTime != 0) {
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    contentInfoParts.setTag((short) 2);
                    try {
                        contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer((int) duration).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                    } catch (Exception e) {
                        contentInfoParts.reset();
                    }
                    playbackInfoParts.setTag((short) 3);
                    try {
                        playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                    } catch (Exception e2) {
                        playbackInfoParts.reset();
                    }
                    playbackEvents.setTag((short) 4);
                    try {
                        playbackEvents.addByteToBuffer((byte) 3).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer((int) position).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer((byte) 0).addIntToBuffer(this.bufNum).addIntToBuffer((int) (playbackTime - this.bufStartTime)).updateLength();
                    } catch (Exception e3) {
                        playbackEvents.reset();
                    }
                    VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                    sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                } catch (Exception e4) {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            }
            this.bufStartTime = 0L;
        }
    }

    public void onUpdatePlaybackPosition(long duration, long position) {
        boolean expired;
        int v;
        if (this.isQualityAdviserSupported && this.odd) {
            do {
                expired = false;
                v = this.heartbeatTicker.get();
                if (v <= 0) {
                    break;
                } else if (v == 1) {
                    expired = true;
                }
            } while (!this.heartbeatTicker.compareAndSet(v, v - 1));
            if (expired) {
                long playbackTime = SystemClock.elapsedRealtime();
                try {
                    VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                    VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                    try {
                        contentInfoParts.setTag((short) 2);
                        try {
                            contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(this.isPrepared ? (int) duration : 0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                        } catch (Exception e) {
                            contentInfoParts.reset();
                        }
                        playbackInfoParts.setTag((short) 3);
                        try {
                            playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                        } catch (Exception e2) {
                            playbackInfoParts.reset();
                        }
                        playbackEvents.setTag((short) 4);
                        try {
                            playbackEvents.addByteToBuffer((byte) 7).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(this.isPrepared ? (int) position : -1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(TrafficStats.getTotalRxBytes()).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                        } catch (Exception e3) {
                            playbackEvents.reset();
                        }
                        VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                        sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    } catch (Exception e4) {
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    }
                } catch (Exception e5) {
                }
                this.heartbeatTicker.set(30);
            }
        }
        this.odd = !this.odd;
    }

    public void afterSetDataSource() {
        if (this.isQualityAdviserSupported) {
            Vigo vigo = VKApplication.getVigo(VKApplication.context);
            vigo.collectPlaybackChangesON(this.playbackStartTime);
            this.heartbeatTicker.set(30);
            long playbackTime = SystemClock.elapsedRealtime();
            long bytes = TrafficStats.getTotalRxBytes();
            try {
                VigoBinaryBuffer contentInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackInfoParts = VigoBinaryBuffer.getObject();
                VigoBinaryBuffer playbackEvents = VigoBinaryBuffer.getObject();
                try {
                    try {
                        contentInfoParts.setTag((short) 2);
                        try {
                            contentInfoParts.addByteToBuffer((byte) 1).addByteToBuffer((byte) this.quality).addIntToBuffer(0).addIntToBuffer(0).addStringToBuffer(this.host != null ? this.host : "").updateLength();
                        } catch (Exception e) {
                            contentInfoParts.reset();
                        }
                        playbackInfoParts.setTag((short) 3);
                        try {
                            playbackInfoParts.addStringToBuffer(this.watchId).addLongToBuffer(this.playbackStartTs).addShortToBuffer((short) this.timeZone).addStringToBuffer(Vigo.ANDROID_MEDIA_PLAYER).updateLength();
                        } catch (Exception e2) {
                            playbackInfoParts.reset();
                        }
                        playbackEvents.setTag((short) 4);
                        try {
                            playbackEvents.addByteToBuffer((byte) 1).addIntToBuffer(this.seqNum.incrementAndGet()).addIntToBuffer((int) (playbackTime - this.playbackStartTime)).addIntToBuffer(-1).addIntToBuffer(this.bufferPct != null ? this.bufferPct.intValue() * 1000000 : -1).addLongToBuffer(bytes).addIntToBuffer(this.instantBitrate).addByteToBuffer(this.bufStartTime != 0 ? (byte) 1 : (byte) 0).updateLength();
                        } catch (Exception e3) {
                            playbackEvents.reset();
                        }
                        VigoBinaryBuffer pb = VigoBinaryBuffer.getObject();
                        sendVigoEvent(pb.addBuffer(contentInfoParts).addBuffer(playbackInfoParts).addBuffer(playbackEvents));
                    } catch (Exception e4) {
                        contentInfoParts.returnObject();
                        playbackInfoParts.returnObject();
                        playbackEvents.returnObject();
                    }
                } finally {
                    contentInfoParts.returnObject();
                    playbackInfoParts.returnObject();
                    playbackEvents.returnObject();
                }
            } catch (Exception e5) {
            } finally {
                this.bufStartTime = playbackTime;
            }
        }
    }

    private void sendVigoEvent(VigoBinaryBuffer pb) {
        try {
            Vigo vigo = VKApplication.getVigo(VKApplication.context);
            Uri reqUri = vigo.fillPlaybackUrlParams(Uri.parse("http://api.vigo.ru/uxzoom/2/notify").buildUpon(), this.svcid, pb).build();
            Analytics.trackExternal(new StatisticUrl(reqUri.toString()));
            if (pb != null) {
                pb.returnObject();
            }
        } catch (Exception x) {
            Log.w("vk", "Error sending vigo event", x);
        }
    }
}
