package com.vkontakte.android.media;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.TrafficStats;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;
import android.provider.Settings;
import android.support.v4.internal.view.SupportMenu;
import android.telephony.CellIdentityGsm;
import android.telephony.CellIdentityLte;
import android.telephony.CellIdentityWcdma;
import android.telephony.CellInfo;
import android.telephony.CellInfoGsm;
import android.telephony.CellInfoLte;
import android.telephony.CellInfoWcdma;
import android.telephony.CellLocation;
import android.telephony.CellSignalStrengthGsm;
import android.telephony.CellSignalStrengthLte;
import android.telephony.CellSignalStrengthWcdma;
import android.telephony.PhoneStateListener;
import android.telephony.SignalStrength;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import android.util.Base64;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.lang.reflect.Field;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
/* loaded from: classes.dex */
public class Vigo extends PhoneStateListener {
    public static final String ANDROID_MEDIA_PLAYER = "AndroidMP";
    public static final byte API_CATEGORY_MESSAGE_IN_TEXT = 5;
    public static final byte API_CATEGORY_MESSAGE_IN_TEXT_HISTORY = 6;
    public static final byte API_CATEGORY_MESSAGE_OUT_TEXT = 7;
    public static final byte API_CATEGORY_NEWS_FEED_TEXT_IN = 1;
    public static final byte API_CATEGORY_PHOTO_IN = 3;
    public static final byte API_CATEGORY_PHOTO_OUT = 4;
    public static final byte API_CATEGORY_PREVIEW_PHOTO_IN = 2;
    private static final byte CELL_INFO_GSM = 1;
    private static final byte CELL_INFO_LTE = 3;
    private static final int CELL_INFO_MAX_TICK = 3;
    private static final int CELL_INFO_UPDATE_TIMER = 1000;
    private static final byte CELL_INFO_WCDMA = 2;
    private static final int MAC_ADDR_LEN = 12;
    private static final int MAX_WIFI_LEVEL = 5;
    private static final int MAX_WIFI_POINTS = 5;
    public static final byte MEDIA_TYPE_AUDIO = 2;
    public static final byte MEDIA_TYPE_VIDEO = 1;
    private static final int MIN_WIFI_LEVEL = 3;
    public static final byte PLAYBACK_EVENTYPE_BITRATECHANGE = 8;
    public static final byte PLAYBACK_EVENTYPE_BUF_START = 2;
    public static final byte PLAYBACK_EVENTYPE_BUF_STOP = 3;
    public static final byte PLAYBACK_EVENTYPE_ERROR = 10;
    public static final byte PLAYBACK_EVENTYPE_HEARTBEAT = 7;
    public static final byte PLAYBACK_EVENTYPE_PAUSE = 4;
    public static final byte PLAYBACK_EVENTYPE_PLAY = 1;
    public static final byte PLAYBACK_EVENTYPE_RESUME = 5;
    public static final byte PLAYBACK_EVENTYPE_SEEK = 6;
    public static final byte PLAYBACK_EVENTYPE_STOP = 9;
    private static final byte WIFI_SIGNAL_INFO = 1;
    private static final byte WIFI_SIGNAL_INFO_ACTIVE = 2;
    private List<VigoApiEvent> apiEvents;
    private VigoBinaryBuffer apiSessionInfo;
    private long apiSessionStartTime;
    private VigoBinaryBuffer clientInfo;
    private ConnectivityManager cm;
    private Context ctx;
    private VigoBinaryBuffer msignal;
    private Timer networkTimer;
    private List<VigoBinaryBuffer> pbEvents;
    private long playbackStartTime;
    private TelephonyManager tm;
    private final AtomicInteger cellInfoTicker = new AtomicInteger();
    private String contextLocation = "";

    public static String md5(String s) {
        try {
            MessageDigest digest = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
            digest.update(s.getBytes());
            byte[] messageDigest = digest.digest();
            StringBuffer hexString = new StringBuffer();
            for (byte b : messageDigest) {
                hexString.append(Integer.toHexString(b & 255));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            return "";
        }
    }

    public Vigo(Context context) {
        if (context != null) {
            this.ctx = context;
            this.tm = (TelephonyManager) this.ctx.getSystemService(SignupPhoneFragment.KEY_PHONE);
            this.cm = (ConnectivityManager) this.ctx.getSystemService("connectivity");
            if (this.tm != null) {
                this.tm.listen(this, 336);
            }
            try {
                this.clientInfo = VigoBinaryBuffer.getObject();
                this.clientInfo.setTag((short) 1);
                this.clientInfo = getClientInfo(this.clientInfo);
            } catch (Exception e) {
            }
            try {
                this.msignal = VigoBinaryBuffer.getObject();
                this.msignal.setTag((short) 0);
            } catch (Exception e2) {
            }
        }
    }

    private int getFieldValue(SignalStrength s, String name) throws Exception {
        Field field = s.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getInt(s);
    }

    @Override // android.telephony.PhoneStateListener
    public void onSignalStrengthsChanged(SignalStrength s) {
        byte b = -1;
        short s2 = Short.MAX_VALUE;
        try {
            this.msignal.reset();
            if (s.isGsm()) {
                int gsmS = -1;
                int bitE = -1;
                int lteS = -1;
                int lteR = 32767;
                int lteRq = 32767;
                int lteRssnr = 32767;
                int lteCqi = -1;
                try {
                    gsmS = getFieldValue(s, "mGsmSignalStrength");
                    bitE = getFieldValue(s, "mGsmBitErrorRate");
                } catch (Exception e) {
                }
                try {
                    lteS = getFieldValue(s, "mLteSignalStrength");
                    lteR = getFieldValue(s, "mLteRsrp");
                    lteRq = getFieldValue(s, "mLteRsrq");
                    lteRssnr = getFieldValue(s, "mLteRssnr");
                    lteCqi = getFieldValue(s, "mLteCqi");
                } catch (Exception e2) {
                }
                try {
                    VigoBinaryBuffer addShortToBuffer = this.msignal.addShortToBuffer((gsmS > 32767 || gsmS < -32768) ? (short) -1 : (short) gsmS).addShortToBuffer((bitE > 32767 || bitE < -32768) ? (short) -1 : (short) bitE).addShortToBuffer((lteS > 32767 || lteS < -32768) ? (short) -1 : (short) lteS).addShortToBuffer((lteR > 32767 || lteR < -32768) ? Short.MAX_VALUE : (short) lteR).addShortToBuffer((lteRq > 32767 || lteRq < -32768) ? Short.MAX_VALUE : (short) lteRq);
                    if (lteRssnr <= 32767 && lteRssnr >= -32768) {
                        s2 = (short) lteRssnr;
                    }
                    VigoBinaryBuffer addShortToBuffer2 = addShortToBuffer.addShortToBuffer(s2);
                    if (lteCqi <= 127 && lteCqi >= -128) {
                        b = (byte) lteCqi;
                    }
                    addShortToBuffer2.addByteToBuffer(b).updateLength();
                } catch (Exception e3) {
                    this.msignal.reset();
                }
            }
        } catch (Exception e4) {
        }
    }

    public Uri.Builder fillApiUrlParams(Uri.Builder bldr) {
        VigoBinaryBuffer events;
        try {
            Cipher aes = Cipher.getInstance("AES/CBC/PKCS5Padding");
            aes.init(1, new SecretKeySpec(new byte[]{39, 59, 109, 108, 126, 115, 68, 52, 73, 118, 62, 85, 49, 49, 70, 126}, "AES"), new IvParameterSpec(new byte[16]));
            VigoBinaryBuffer events2 = VigoBinaryBuffer.getObject();
            try {
                events2 = VigoBinaryBuffer.getObject();
                try {
                    events2.setTag((short) 5);
                    events2 = VigoBinaryBuffer.getObject();
                    try {
                        events2.setTag((short) 6);
                        events2.addBuffer(this.clientInfo);
                        events = updateNetworkInformation(events2, null);
                        events2.addBuffer(events);
                        if (this.apiSessionInfo != null && this.apiEvents != null) {
                            synchronized (this.apiSessionInfo) {
                                events2.addBuffer(this.apiSessionInfo);
                            }
                            if (!this.apiEvents.isEmpty()) {
                                events2 = resetApiEvents(events2, events);
                                events2.addBuffer(events2);
                            }
                        }
                        events2.returnObject();
                    } catch (Exception e) {
                        events2.reset();
                    } finally {
                    }
                    events.returnObject();
                } catch (Exception e2) {
                } finally {
                }
                bldr = bldr.appendQueryParameter("svcid", "5d18").appendQueryParameter("cid", VKAPIRequest.md5(String.valueOf(VKAccountManager.getCurrent().getUid()))).appendQueryParameter("api", Base64.encodeToString(aes.doFinal(events2.getBuffer()), 11));
            } catch (Exception e3) {
                if (this.apiEvents != null) {
                    synchronized (this.apiEvents) {
                        if (!this.apiEvents.isEmpty()) {
                            this.apiEvents.clear();
                        }
                    }
                }
                events2.returnObject();
            }
            return bldr;
        } catch (Exception e4) {
            return null;
        }
    }

    public Uri.Builder fillPlaybackUrlParams(Uri.Builder bldr, String svcid, VigoBinaryBuffer pb) {
        try {
            Cipher aes = Cipher.getInstance("AES/CBC/PKCS5Padding");
            aes.init(1, new SecretKeySpec(new byte[]{39, 59, 109, 108, 126, 115, 68, 52, 73, 118, 62, 85, 49, 49, 70, 126}, "AES"), new IvParameterSpec(new byte[16]));
            if (pb == null) {
                pb = VigoBinaryBuffer.getObject();
            }
            try {
                VigoBinaryBuffer networkInfo = VigoBinaryBuffer.getObject();
                try {
                    networkInfo.setTag((short) 5);
                    VigoBinaryBuffer events = VigoBinaryBuffer.getObject();
                    try {
                        events.setTag((short) 6);
                        pb.addBuffer(this.clientInfo);
                        networkInfo = updateNetworkInformation(networkInfo, null);
                        pb.addBuffer(networkInfo);
                        if (this.pbEvents != null && !this.pbEvents.isEmpty()) {
                            events = resetPlaybackEvents(events);
                            pb.addBuffer(events);
                        }
                        events.returnObject();
                    } catch (Exception e) {
                        pb.reset();
                        events.returnObject();
                    }
                } catch (Exception e2) {
                } finally {
                    networkInfo.returnObject();
                }
                bldr = bldr.appendQueryParameter("svcid", svcid).appendQueryParameter("cid", VKAPIRequest.md5(String.valueOf(VKAccountManager.getCurrent().getUid()))).appendQueryParameter("pb", Base64.encodeToString(aes.doFinal(pb.getBuffer()), 11));
                pb.returnObject();
            } catch (Exception e3) {
                if (this.pbEvents != null) {
                    synchronized (this.pbEvents) {
                        if (!this.pbEvents.isEmpty()) {
                            this.pbEvents.clear();
                        }
                    }
                }
                pb.returnObject();
            }
            return bldr;
        } catch (Exception e4) {
            return null;
        }
    }

    public void collectApiChangesON() {
        VigoBinaryBuffer networkInfo;
        try {
            this.apiSessionStartTime = SystemClock.elapsedRealtime();
            this.apiSessionInfo = VigoBinaryBuffer.getObject();
            try {
                this.apiSessionInfo.setTag((short) 7);
                this.apiSessionInfo.addStringToBuffer(UUID.randomUUID().toString()).addLongToBuffer(System.currentTimeMillis()).addShortToBuffer((short) (Calendar.getInstance().getTimeZone().getOffset(System.currentTimeMillis()) / 60000)).updateLength();
            } catch (Exception e) {
                this.apiSessionInfo.reset();
            }
            this.apiEvents = Collections.synchronizedList(new ArrayList());
            VigoBinaryBuffer networkInfo2 = VigoBinaryBuffer.getObject();
            try {
                networkInfo2.setTag((short) 5);
                networkInfo = updateNetworkInformation(networkInfo2, null);
                createApiEvent(networkInfo);
                networkInfo.returnObject();
            } catch (Exception e2) {
                networkInfo.returnObject();
            } catch (Throwable th) {
                networkInfo.returnObject();
                throw th;
            }
        } catch (Exception e3) {
        }
    }

    public void collectApiChangesOFF() {
        try {
            this.apiSessionStartTime = 0L;
            this.apiSessionInfo.returnObject();
            this.apiSessionInfo = null;
            for (VigoApiEvent event : this.apiEvents) {
                event.info.returnObject();
                event.returnObject();
            }
            this.apiEvents.clear();
            this.apiEvents = null;
        } catch (Exception e) {
        }
    }

    public void collectPlaybackChangesON(long startTime) {
        try {
            this.playbackStartTime = startTime;
            this.pbEvents = Collections.synchronizedList(new ArrayList());
        } catch (Exception e) {
        }
    }

    public void collectPlaybackChangesOFF() {
        try {
            this.playbackStartTime = 0L;
            for (VigoBinaryBuffer event : this.pbEvents) {
                event.returnObject();
            }
            this.pbEvents.clear();
            this.pbEvents = null;
        } catch (Exception e) {
        }
    }

    private VigoBinaryBuffer getCell(CellLocation location, VigoBinaryBuffer networkInfoParts) {
        try {
            if (location instanceof GsmCellLocation) {
                GsmCellLocation ci = (GsmCellLocation) location;
                networkInfoParts.addShortToBuffer((ci.getLac() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci.getLac()).addIntToBuffer(ci.getCid()).addShortToBuffer((ci.getPsc() > 32767 || ci.getPsc() < -32768) ? (short) -1 : (short) ci.getPsc());
            } else {
                networkInfoParts.addShortToBuffer((short) -1).addIntToBuffer(-1).addShortToBuffer((short) -1);
            }
            VigoBinaryBuffer cellInfo = VigoBinaryBuffer.getObject();
            try {
                cellInfo.setTag((short) 0);
                List<String> context = new ArrayList<>();
                try {
                    if (Build.VERSION.SDK_INT >= 17) {
                        List<CellInfo> cells = this.tm != null ? this.tm.getAllCellInfo() : null;
                        if (cells != null) {
                            for (CellInfo cell : cells) {
                                if (cell.isRegistered()) {
                                    if (cell instanceof CellInfoGsm) {
                                        CellIdentityGsm ci2 = ((CellInfoGsm) cell).getCellIdentity();
                                        CellSignalStrengthGsm cs = ((CellInfoGsm) cell).getCellSignalStrength();
                                        if (ci2.getMcc() != Integer.MAX_VALUE && ci2.getMnc() != Integer.MAX_VALUE && ci2.getLac() != Integer.MAX_VALUE) {
                                            String sf = String.format("%X%X%X%X%X", 1L, Long.valueOf(ci2.getMcc() & 4294967295L), Long.valueOf(ci2.getMnc() & 4294967295L), Long.valueOf(ci2.getLac() & 4294967295L), Long.valueOf(ci2.getCid() & 4294967295L));
                                            context.add(sf);
                                            cellInfo.addByteToBuffer((byte) 1).addShortToBuffer((ci2.getMcc() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci2.getMcc()).addShortToBuffer((ci2.getMnc() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci2.getMnc()).addShortToBuffer((ci2.getLac() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci2.getLac()).addIntToBuffer(ci2.getCid());
                                            int rss = -1;
                                            int ber = -1;
                                            try {
                                                Field field = cs.getClass().getDeclaredField("mSignalStrength");
                                                boolean isAccessible = field.isAccessible();
                                                field.setAccessible(true);
                                                rss = field.getInt(cs);
                                                field.setAccessible(isAccessible);
                                                Field field2 = cs.getClass().getDeclaredField("mBitErrorRate");
                                                boolean isAccessible2 = field2.isAccessible();
                                                field2.setAccessible(true);
                                                ber = field2.getInt(cs);
                                                field2.setAccessible(isAccessible2);
                                            } catch (Exception e) {
                                            }
                                            cellInfo.addShortToBuffer((rss > 32767 || rss < -32768) ? (short) -1 : (short) rss).addShortToBuffer((ber > 32767 || ber < -32768) ? (short) -1 : (short) ber);
                                        }
                                    } else if (Build.VERSION.SDK_INT > 17 && (cell instanceof CellInfoWcdma)) {
                                        CellIdentityWcdma ci3 = ((CellInfoWcdma) cell).getCellIdentity();
                                        CellSignalStrengthWcdma cs2 = ((CellInfoWcdma) cell).getCellSignalStrength();
                                        if (ci3.getMcc() != Integer.MAX_VALUE && ci3.getMnc() != Integer.MAX_VALUE && ci3.getLac() != Integer.MAX_VALUE) {
                                            String sf2 = String.format("%X%X%X%X%X", 2L, Long.valueOf(ci3.getMcc() & 4294967295L), Long.valueOf(ci3.getMnc() & 4294967295L), Long.valueOf(ci3.getLac() & 4294967295L), Long.valueOf(ci3.getCid() & 4294967295L));
                                            context.add(sf2);
                                            cellInfo.addByteToBuffer((byte) 2).addShortToBuffer((ci3.getMcc() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci3.getMcc()).addShortToBuffer((ci3.getMnc() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci3.getMnc()).addShortToBuffer((ci3.getLac() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci3.getLac()).addIntToBuffer(ci3.getCid()).addShortToBuffer((ci3.getPsc() > 32767 || ci3.getPsc() < -32768) ? (short) -1 : (short) ci3.getPsc());
                                            int rss2 = -1;
                                            int ber2 = -1;
                                            try {
                                                Field field3 = cs2.getClass().getDeclaredField("mSignalStrength");
                                                boolean isAccessible3 = field3.isAccessible();
                                                field3.setAccessible(true);
                                                rss2 = field3.getInt(cs2);
                                                field3.setAccessible(isAccessible3);
                                                Field field4 = cs2.getClass().getDeclaredField("mBitErrorRate");
                                                boolean isAccessible4 = field4.isAccessible();
                                                field4.setAccessible(true);
                                                ber2 = field4.getInt(cs2);
                                                field4.setAccessible(isAccessible4);
                                            } catch (Exception e2) {
                                            }
                                            cellInfo.addShortToBuffer((rss2 > 32767 || rss2 < -32768) ? (short) -1 : (short) rss2).addShortToBuffer((ber2 > 32767 || ber2 < -32768) ? (short) -1 : (short) ber2);
                                        }
                                    } else if (cell instanceof CellInfoLte) {
                                        CellIdentityLte ci4 = ((CellInfoLte) cell).getCellIdentity();
                                        CellSignalStrengthLte cs3 = ((CellInfoLte) cell).getCellSignalStrength();
                                        if (ci4.getMcc() != Integer.MAX_VALUE && ci4.getMnc() != Integer.MAX_VALUE && ci4.getTac() != Integer.MAX_VALUE) {
                                            String sf3 = String.format("%X%X%X%X%X", 3L, Long.valueOf(ci4.getMcc() & 4294967295L), Long.valueOf(ci4.getMnc() & 4294967295L), Long.valueOf(ci4.getTac() & 4294967295L), Long.valueOf(ci4.getCi() & 4294967295L));
                                            context.add(sf3);
                                            cellInfo.addByteToBuffer((byte) 3).addShortToBuffer((ci4.getMcc() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci4.getMcc()).addShortToBuffer((ci4.getMnc() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci4.getMnc()).addShortToBuffer((ci4.getTac() & SupportMenu.CATEGORY_MASK) != 0 ? (short) -1 : (short) ci4.getTac()).addIntToBuffer(ci4.getCi()).addShortToBuffer((ci4.getPci() > 32767 || ci4.getPci() < -32768) ? (short) -1 : (short) ci4.getPci());
                                            int rss3 = -1;
                                            int rsrp = 32767;
                                            int rsrq = 32767;
                                            int rssnr = 32767;
                                            int cqi = -1;
                                            int timingAdvance = -1;
                                            try {
                                                Field field5 = cs3.getClass().getDeclaredField("mSignalStrength");
                                                boolean isAccessible5 = field5.isAccessible();
                                                field5.setAccessible(true);
                                                rss3 = field5.getInt(cs3);
                                                field5.setAccessible(isAccessible5);
                                                Field field6 = cs3.getClass().getDeclaredField("mRsrp");
                                                boolean isAccessible6 = field6.isAccessible();
                                                field6.setAccessible(true);
                                                rsrp = field6.getInt(cs3);
                                                field6.setAccessible(isAccessible6);
                                                Field field7 = cs3.getClass().getDeclaredField("mRsrq");
                                                boolean isAccessible7 = field7.isAccessible();
                                                field7.setAccessible(true);
                                                rsrq = field7.getInt(cs3);
                                                field7.setAccessible(isAccessible7);
                                                Field field8 = cs3.getClass().getDeclaredField("mRssnr");
                                                boolean isAccessible8 = field8.isAccessible();
                                                field8.setAccessible(true);
                                                rssnr = field8.getInt(cs3);
                                                field8.setAccessible(isAccessible8);
                                                Field field9 = cs3.getClass().getDeclaredField("mCqi");
                                                boolean isAccessible9 = field9.isAccessible();
                                                field9.setAccessible(true);
                                                cqi = field9.getInt(cs3);
                                                field9.setAccessible(isAccessible9);
                                                Field field10 = cs3.getClass().getDeclaredField("mTimingAdvance");
                                                boolean isAccessible10 = field10.isAccessible();
                                                field10.setAccessible(true);
                                                timingAdvance = field10.getInt(cs3);
                                                field10.setAccessible(isAccessible10);
                                            } catch (Exception e3) {
                                            }
                                            VigoBinaryBuffer addByteToBuffer = cellInfo.addShortToBuffer((rss3 > 32767 || rss3 < -32768) ? (short) -1 : (short) rss3).addShortToBuffer((rsrp > 32767 || rsrp < -32768) ? Short.MAX_VALUE : (short) rsrp).addShortToBuffer((rsrq > 32767 || rsrq < -32768) ? Short.MAX_VALUE : (short) rsrq).addShortToBuffer((rssnr > 32767 || rssnr < -32768) ? Short.MAX_VALUE : (short) rssnr).addByteToBuffer((cqi > 127 || cqi < -128) ? (byte) -1 : (byte) cqi);
                                            if (timingAdvance == Integer.MAX_VALUE) {
                                                timingAdvance = -1;
                                            }
                                            addByteToBuffer.addIntToBuffer(timingAdvance);
                                        }
                                    }
                                }
                            }
                        }
                        try {
                            this.contextLocation = "";
                            Collections.sort(context);
                            for (String i : context) {
                                this.contextLocation += i;
                            }
                        } catch (Exception e4) {
                            this.contextLocation = "";
                        }
                    }
                    cellInfo.updateLength();
                } catch (Exception e5) {
                    cellInfo.reset();
                }
                networkInfoParts.addBuffer(cellInfo);
                cellInfo.returnObject();
            } catch (Exception e6) {
                cellInfo.returnObject();
            }
        } catch (Exception e7) {
            networkInfoParts.reset();
        }
        return networkInfoParts;
    }

    @Override // android.telephony.PhoneStateListener
    public void onCellLocationChanged(CellLocation location) {
        VigoBinaryBuffer networkInformation;
        if (this.pbEvents != null || this.apiEvents != null) {
            try {
                VigoBinaryBuffer networkInformation2 = VigoBinaryBuffer.getObject();
                try {
                    networkInformation2.setTag((short) 5);
                    networkInformation = updateNetworkInformation(networkInformation2, location);
                    if (this.networkTimer != null) {
                        this.networkTimer.cancel();
                        this.networkTimer = null;
                    }
                    this.networkTimer = new Timer();
                    this.cellInfoTicker.set(3);
                    this.networkTimer.schedule(new TimerTask() { // from class: com.vkontakte.android.media.Vigo.1
                        @Override // java.util.TimerTask, java.lang.Runnable
                        public void run() {
                            Vigo.this.cellInfoUpdate();
                        }
                    }, 1000L, 1000L);
                    createApiEvent(networkInformation);
                    createPlaybackEvent(networkInformation);
                    networkInformation.returnObject();
                } catch (Exception e) {
                    networkInformation.returnObject();
                } catch (Throwable th) {
                    networkInformation.returnObject();
                    throw th;
                }
            } catch (Exception e2) {
            }
        }
    }

    @Override // android.telephony.PhoneStateListener
    public void onDataConnectionStateChanged(int state, int networkType) {
        VigoBinaryBuffer networkInformation;
        if (this.pbEvents != null || this.apiEvents != null) {
            if (state == 0 || state == 2) {
                try {
                    VigoBinaryBuffer networkInformation2 = VigoBinaryBuffer.getObject();
                    try {
                        networkInformation2.setTag((short) 5);
                        networkInformation = updateNetworkInformation(networkInformation2, null);
                        createApiEvent(networkInformation);
                        createPlaybackEvent(networkInformation);
                        networkInformation.returnObject();
                    } catch (Exception e) {
                        networkInformation.returnObject();
                    } catch (Throwable th) {
                        networkInformation.returnObject();
                        throw th;
                    }
                } catch (Exception e2) {
                }
            }
        }
    }

    public void addSuccessApiMeasurement(byte category, int requestRtt, int requestPt, long contentLenght) {
        VigoApiMeasurement measurement;
        if (this.apiEvents != null) {
            try {
                synchronized (this.apiEvents) {
                    if (!this.apiEvents.isEmpty()) {
                        VigoApiEvent event = this.apiEvents.get(this.apiEvents.size() - 1);
                        if (event.apiMeasurements.containsKey(Byte.valueOf(category))) {
                            measurement = event.apiMeasurements.get(Byte.valueOf(category));
                        } else {
                            measurement = VigoApiMeasurement.getObject();
                            event.apiMeasurements.put(Byte.valueOf(category), measurement);
                        }
                        measurement.avgSuccessMeasurementCount++;
                        measurement.avgSuccessApiRequestRtt = ((measurement.avgSuccessApiRequestRtt * (measurement.avgSuccessMeasurementCount - 1)) + requestRtt) / measurement.avgSuccessMeasurementCount;
                        measurement.avgSuccessApiRequestPt = ((measurement.avgSuccessApiRequestPt * (measurement.avgSuccessMeasurementCount - 1)) + requestPt) / measurement.avgSuccessMeasurementCount;
                        measurement.avgSuccessApiContentLength = ((measurement.avgSuccessApiContentLength * (measurement.avgSuccessMeasurementCount - 1)) + contentLenght) / measurement.avgSuccessMeasurementCount;
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    public void addErrorApiMeasurement(byte category, int requestRtt, int requestPt) {
        VigoApiMeasurement measurement;
        if (this.apiEvents != null) {
            try {
                synchronized (this.apiEvents) {
                    if (!this.apiEvents.isEmpty()) {
                        VigoApiEvent event = this.apiEvents.get(this.apiEvents.size() - 1);
                        if (event.apiMeasurements.containsKey(Byte.valueOf(category))) {
                            measurement = event.apiMeasurements.get(Byte.valueOf(category));
                        } else {
                            measurement = VigoApiMeasurement.getObject();
                            event.apiMeasurements.put(Byte.valueOf(category), measurement);
                        }
                        measurement.avgErrorMeasurementCount++;
                        measurement.avgErrorApiRequestRtt = ((measurement.avgErrorApiRequestRtt * (measurement.avgErrorMeasurementCount - 1)) + requestRtt) / measurement.avgErrorMeasurementCount;
                        measurement.avgErrorApiRequestPt = ((measurement.avgErrorApiRequestPt * (measurement.avgErrorMeasurementCount - 1)) + requestPt) / measurement.avgErrorMeasurementCount;
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    public void countFailedApiMeasurement(byte category) {
        VigoApiMeasurement measurement;
        if (this.apiEvents != null) {
            try {
                synchronized (this.apiEvents) {
                    if (!this.apiEvents.isEmpty()) {
                        VigoApiEvent event = this.apiEvents.get(this.apiEvents.size() - 1);
                        if (event.apiMeasurements.containsKey(Byte.valueOf(category))) {
                            measurement = event.apiMeasurements.get(Byte.valueOf(category));
                        } else {
                            measurement = VigoApiMeasurement.getObject();
                            event.apiMeasurements.put(Byte.valueOf(category), measurement);
                        }
                        measurement.failedApiMeasurementCounter++;
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    private void createApiEvent(VigoBinaryBuffer networkInfo) {
        if (this.apiEvents != null) {
            try {
                synchronized (this.apiEvents) {
                    int timeOffset = (int) (SystemClock.elapsedRealtime() - this.apiSessionStartTime);
                    if (!this.apiEvents.isEmpty()) {
                        VigoApiEvent apiEvent = this.apiEvents.get(this.apiEvents.size() - 1);
                        if (!apiEvent.apiMeasurements.isEmpty()) {
                            apiEvent.info.addIntToBuffer(timeOffset);
                            this.apiEvents.set(this.apiEvents.size() - 1, apiEvent);
                        } else {
                            VigoApiEvent event = this.apiEvents.remove(this.apiEvents.size() - 1);
                            event.info.returnObject();
                            event.returnObject();
                        }
                    }
                    VigoApiEvent newApiEvent = VigoApiEvent.getObject();
                    newApiEvent.info = VigoBinaryBuffer.getObject();
                    newApiEvent.info.addBuffer(networkInfo);
                    newApiEvent.info.addIntToBuffer(timeOffset);
                    this.apiEvents.add(newApiEvent);
                }
            } catch (Exception e) {
            }
        }
    }

    private void createPlaybackEvent(VigoBinaryBuffer networkInfo) {
        if (this.pbEvents != null) {
            try {
                synchronized (this.pbEvents) {
                    int timeOffset = (int) (SystemClock.elapsedRealtime() - this.playbackStartTime);
                    VigoBinaryBuffer newPlaybackEvent = VigoBinaryBuffer.getObject();
                    newPlaybackEvent.addBuffer(networkInfo);
                    newPlaybackEvent.addIntToBuffer(timeOffset);
                    newPlaybackEvent.addLongToBuffer(TrafficStats.getTotalRxBytes());
                    this.pbEvents.add(newPlaybackEvent);
                }
            } catch (Exception e) {
            }
        }
    }

    private VigoBinaryBuffer resetApiEvents(VigoBinaryBuffer events, VigoBinaryBuffer networkInfo) {
        if (this.apiEvents != null) {
            synchronized (this.apiEvents) {
                try {
                    int timeOffset = (int) (SystemClock.elapsedRealtime() - this.apiSessionStartTime);
                    if (!this.apiEvents.isEmpty()) {
                        VigoApiEvent apiEvent = this.apiEvents.get(this.apiEvents.size() - 1);
                        if (apiEvent.apiMeasurements.size() > 0) {
                            apiEvent.info.addIntToBuffer(timeOffset);
                            this.apiEvents.set(this.apiEvents.size() - 1, apiEvent);
                        } else {
                            VigoApiEvent event = this.apiEvents.remove(this.apiEvents.size() - 1);
                            event.info.returnObject();
                            event.returnObject();
                        }
                    }
                    for (VigoApiEvent event2 : this.apiEvents) {
                        VigoBinaryBuffer measures = VigoBinaryBuffer.getObject();
                        try {
                            measures.setTag((short) 0);
                            events.addBuffer(event2.info);
                            for (Map.Entry<Byte, VigoApiMeasurement> entry : event2.apiMeasurements.entrySet()) {
                                VigoApiMeasurement measurement = entry.getValue();
                                measures.addByteToBuffer(entry.getKey().byteValue());
                                measures.addIntToBuffer(measurement.avgSuccessMeasurementCount);
                                measures.addIntToBuffer(measurement.avgErrorMeasurementCount);
                                measures.addIntToBuffer(measurement.failedApiMeasurementCounter);
                                measures.addIntToBuffer(measurement.avgSuccessApiRequestRtt);
                                measures.addIntToBuffer(measurement.avgSuccessApiRequestPt);
                                measures.addLongToBuffer(measurement.avgSuccessApiContentLength);
                                measures.addIntToBuffer(measurement.avgErrorApiRequestRtt);
                                measures.addIntToBuffer(measurement.avgErrorApiRequestPt);
                            }
                            measures.updateLength();
                            events.addBuffer(measures);
                            measures.returnObject();
                            event2.info.returnObject();
                            event2.returnObject();
                        } catch (Exception e) {
                            measures.returnObject();
                            event2.info.returnObject();
                            event2.returnObject();
                        } catch (Throwable th) {
                            measures.returnObject();
                            event2.info.returnObject();
                            event2.returnObject();
                            throw th;
                        }
                    }
                    this.apiEvents.clear();
                    VigoApiEvent newApiEvent = VigoApiEvent.getObject();
                    newApiEvent.info = VigoBinaryBuffer.getObject();
                    newApiEvent.info.addBuffer(networkInfo);
                    newApiEvent.info.addIntToBuffer(timeOffset);
                    this.apiEvents.add(newApiEvent);
                    events.updateLength();
                } catch (Exception e2) {
                    if (!this.apiEvents.isEmpty()) {
                        this.apiEvents.clear();
                    }
                    events.reset();
                }
            }
        }
        return events;
    }

    private VigoBinaryBuffer resetPlaybackEvents(VigoBinaryBuffer events) {
        if (this.pbEvents != null) {
            synchronized (this.pbEvents) {
                try {
                    for (VigoBinaryBuffer event : this.pbEvents) {
                        try {
                            events.addBuffer(event);
                            event.returnObject();
                        } catch (Exception e) {
                            event.returnObject();
                        } catch (Throwable th) {
                            event.returnObject();
                            throw th;
                        }
                    }
                    this.pbEvents.clear();
                    events.updateLength();
                } catch (Exception e2) {
                    if (!this.pbEvents.isEmpty()) {
                        this.pbEvents.clear();
                    }
                    events.reset();
                }
            }
        }
        return events;
    }

    private VigoBinaryBuffer updateNetworkInformation(VigoBinaryBuffer networkInformation, CellLocation cellL) {
        byte b = -1;
        try {
            if (this.cm != null) {
                NetworkInfo ni = this.cm.getActiveNetworkInfo();
                if (ni != null) {
                    networkInformation.addShortToBuffer((ni.getType() > 32767 || ni.getType() < -32768) ? (short) -1 : (short) ni.getType()).addShortToBuffer((ni.getSubtype() > 32767 || ni.getSubtype() < -32768) ? (short) -1 : (short) ni.getSubtype());
                } else {
                    networkInformation.addShortToBuffer((short) -1).addShortToBuffer((short) -1);
                }
            } else {
                networkInformation.addShortToBuffer((short) -1).addShortToBuffer((short) -1);
            }
            if (this.tm != null) {
                VigoBinaryBuffer addBooleanToBuffer = networkInformation.addShortToBuffer((this.tm.getNetworkType() > 32767 || this.tm.getNetworkType() < -32768) ? (short) -1 : (short) this.tm.getNetworkType()).addStringToBuffer(this.tm.getNetworkOperator()).addBooleanToBuffer(this.tm.isNetworkRoaming());
                if (this.tm.getDataState() <= 127 && this.tm.getNetworkType() >= -128) {
                    b = (byte) this.tm.getDataState();
                }
                addBooleanToBuffer.addByteToBuffer(b).addStringToBuffer(this.tm.getSimOperator());
            } else {
                networkInformation.addShortToBuffer((short) -1).addStringToBuffer("").addByteToBuffer((byte) -1).addByteToBuffer((byte) -1).addStringToBuffer("");
            }
            VigoBinaryBuffer simInfo = VigoBinaryBuffer.getObject();
            try {
                simInfo.setTag((short) 0);
                if (Build.VERSION.SDK_INT > 21) {
                    try {
                        SubscriptionManager sbm = SubscriptionManager.from(this.ctx);
                        for (SubscriptionInfo info : sbm.getActiveSubscriptionInfoList()) {
                            simInfo.addShortToBuffer((short) info.getMcc());
                            simInfo.addShortToBuffer((short) info.getMnc());
                        }
                        simInfo.updateLength();
                    } catch (Exception e) {
                        simInfo.reset();
                    }
                }
                networkInformation.addBuffer(simInfo);
                simInfo.returnObject();
            } catch (Exception e2) {
                simInfo.returnObject();
            }
            if (cellL == null) {
                cellL = this.tm != null ? this.tm.getCellLocation() : null;
            }
            networkInformation = getCell(cellL, networkInformation);
            synchronized (this.msignal) {
                networkInformation.addBuffer(this.msignal);
            }
            VigoBinaryBuffer wsignal = VigoBinaryBuffer.getObject();
            try {
                wsignal.setTag((short) 0);
                networkInformation.addBuffer(wsignal).updateLength();
                wsignal.returnObject();
            } catch (Exception e3) {
                wsignal.returnObject();
            } catch (Throwable th) {
                wsignal.returnObject();
                throw th;
            }
        } catch (Exception e4) {
            networkInformation.reset();
        }
        return networkInformation;
    }

    private VigoBinaryBuffer getClientInfo(VigoBinaryBuffer clientInfoParts) {
        String versionName;
        int versionCode = -1;
        try {
            PackageInfo pInfo = this.ctx.getPackageManager().getPackageInfo(this.ctx.getPackageName(), 0);
            versionName = pInfo.versionName;
            versionCode = pInfo.versionCode;
        } catch (Exception e) {
            versionName = "";
        }
        try {
            clientInfoParts.addStringToBuffer("Android").addStringToBuffer(Integer.toString(Build.VERSION.SDK_INT)).addByteToBuffer((byte) 0).addStringToBuffer(Build.MANUFACTURER + CameraUtilsEffects.FILE_DELIM + Build.MODEL).addStringToBuffer(Build.DISPLAY).addStringToBuffer(this.ctx != null ? VKAPIRequest.md5(Settings.Secure.getString(this.ctx.getContentResolver(), "android_id")) : "").addStringToBuffer(this.ctx != null ? Integer.toString(this.ctx.getResources().getConfiguration().screenLayout & 15) : "").addStringToBuffer(versionName + CameraUtilsEffects.FILE_DELIM + versionCode).updateLength();
        } catch (Exception e2) {
            clientInfoParts.reset();
        }
        return clientInfoParts;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cellInfoUpdate() {
        VigoBinaryBuffer networkInformation;
        if (this.pbEvents != null || this.apiEvents != null) {
            try {
                if (this.cellInfoTicker.decrementAndGet() <= 0 && this.networkTimer != null) {
                    this.networkTimer.cancel();
                    this.networkTimer = null;
                }
                String tmp = this.contextLocation;
                VigoBinaryBuffer networkInformation2 = VigoBinaryBuffer.getObject();
                try {
                    networkInformation2.setTag((short) 5);
                    networkInformation = updateNetworkInformation(networkInformation2, null);
                    if (!this.contextLocation.equals(tmp)) {
                        createApiEvent(networkInformation);
                        createPlaybackEvent(networkInformation);
                    }
                    networkInformation.returnObject();
                } catch (Exception e) {
                    networkInformation.returnObject();
                } catch (Throwable th) {
                    networkInformation.returnObject();
                    throw th;
                }
            } catch (Exception e2) {
            }
        }
    }
}
