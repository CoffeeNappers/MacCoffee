package com.vkontakte.android.statistics;

import android.support.annotation.NonNull;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.utils.Serializer;
/* loaded from: classes3.dex */
public abstract class StatisticBase extends Serializer.SerializableAdapter {
    protected String key;
    protected volatile boolean sent = false;
    protected String type;

    public StatisticBase(String type, String key) {
        this.type = type;
        this.key = key;
    }

    public void sendSync(@NonNull StatisticSender sender) {
        if (isLoadedPreviousInfo()) {
            if (canBeSent() && sender.send(this)) {
                sent();
                return;
            }
            return;
        }
        APIController.runInBg(StatisticBase$$Lambda$1.lambdaFactory$(this, sender));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$sendSync$1(@NonNull StatisticSender sender) {
        SentTable.init();
        ViewUtils.post(StatisticBase$$Lambda$2.lambdaFactory$(this, sender));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(@NonNull StatisticSender sender) {
        if (canBeSent() && sender.send(this)) {
            sent();
        }
    }

    public void sendAsync(final StatisticSender sender, final int retryCount, final long retryTime) {
        if (!isLoadedPreviousInfo() || canBeSent()) {
            APIController.runInBg(new Runnable() { // from class: com.vkontakte.android.statistics.StatisticBase.1
                private int failCount = 0;

                @Override // java.lang.Runnable
                public void run() {
                    SentTable.init();
                    if (StatisticBase.this.canBeSent()) {
                        boolean sent = sender.send(StatisticBase.this);
                        if (!sent && this.failCount < retryCount) {
                            this.failCount++;
                            APIController.runInBgDelayed(this, retryTime);
                        } else if (sent) {
                            StatisticBase.this.sent();
                        }
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sent() {
        if (isUniqueType()) {
            this.sent = true;
            SentTable.addSent(this.key);
        }
    }

    private boolean isLoadedPreviousInfo() {
        return SentTable.keysSet != null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean canBeSent() {
        if (!this.sent) {
            boolean isSent = SentTable.isSent(this.key);
            this.sent = isSent;
            if (!isSent) {
                return true;
            }
        }
        return false;
    }

    private boolean isUniqueType() {
        String valueOf = String.valueOf(this.type);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1788078848:
                if (valueOf.equals(Statistic.TYPE_POST_SHARE)) {
                    c = '\f';
                    break;
                }
                break;
            case -654739665:
                if (valueOf.equals(Statistic.TYPE_VIDEO_FULLSCREEN_OFF)) {
                    c = 21;
                    break;
                }
                break;
            case -244104853:
                if (valueOf.equals(Statistic.TYPE_POST_OWNER_CLICK)) {
                    c = 14;
                    break;
                }
                break;
            case -163723192:
                if (valueOf.equals(Statistic.TYPE_POST_LIKE)) {
                    c = '\n';
                    break;
                }
                break;
            case -101549123:
                if (valueOf.equals(Statistic.TYPE_DEEP_LINK)) {
                    c = '\r';
                    break;
                }
                break;
            case -85004704:
                if (valueOf.equals(Statistic.TYPE_VIDEO_VOLUME_ON)) {
                    c = 18;
                    break;
                }
                break;
            case -37765007:
                if (valueOf.equals(Statistic.TYPE_VIDEO_RESUME)) {
                    c = 16;
                    break;
                }
                break;
            case 3327206:
                if (valueOf.equals("load")) {
                    c = 1;
                    break;
                }
                break;
            case 94750088:
                if (valueOf.equals("click")) {
                    c = '\t';
                    break;
                }
                break;
            case 120623625:
                if (valueOf.equals(Statistic.TYPE_IMPRESSION)) {
                    c = 0;
                    break;
                }
                break;
            case 282375594:
                if (valueOf.equals(Statistic.TYPE_VIDEO_100)) {
                    c = 17;
                    break;
                }
                break;
            case 671616031:
                if (valueOf.equals(Statistic.TYPE_VIDEO_FULLSCREEN_ON)) {
                    c = 20;
                    break;
                }
                break;
            case 712193090:
                if (valueOf.equals(Statistic.TYPE_IMPRESSION_PRETTY_CARD)) {
                    c = '\b';
                    break;
                }
                break;
            case 823306818:
                if (valueOf.equals(Statistic.TYPE_POST_LINK)) {
                    c = 11;
                    break;
                }
                break;
            case 1382290738:
                if (valueOf.equals(Statistic.TYPE_VIDEO_PAUSE)) {
                    c = 15;
                    break;
                }
                break;
            case 1385608094:
                if (valueOf.equals(Statistic.TYPE_VIDEO_PLAY)) {
                    c = 2;
                    break;
                }
                break;
            case 1533129578:
                if (valueOf.equals(Statistic.TYPE_VIDEO_25)) {
                    c = 4;
                    break;
                }
                break;
            case 1533129666:
                if (valueOf.equals(Statistic.TYPE_VIDEO_50)) {
                    c = 5;
                    break;
                }
                break;
            case 1533129671:
                if (valueOf.equals(Statistic.TYPE_VIDEO_3S)) {
                    c = 3;
                    break;
                }
                break;
            case 1533129733:
                if (valueOf.equals(Statistic.TYPE_VIDEO_75)) {
                    c = 6;
                    break;
                }
                break;
            case 1533129795:
                if (valueOf.equals(Statistic.TYPE_VIDEO_95)) {
                    c = 7;
                    break;
                }
                break;
            case 1659821326:
                if (valueOf.equals(Statistic.TYPE_VIDEO_VOLUME_OFF)) {
                    c = 19;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case '\b':
                return true;
            default:
                return false;
        }
    }
}
