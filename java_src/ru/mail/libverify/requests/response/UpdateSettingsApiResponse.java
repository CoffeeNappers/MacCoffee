package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import ru.mail.libverify.storage.n;
/* loaded from: classes3.dex */
public class UpdateSettingsApiResponse extends ClientApiResponseBase {
    private transient boolean a = false;
    private String app_check_id;
    private Integer background_verify;
    private Integer broadcast_on_demand;
    private FetcherInfo fetcher_info;
    private Integer run_single_fetcher;
    private Integer send_call_stats;
    private Integer sms_check;
    private Integer sms_find;
    private SmsInfo sms_info;
    private Integer track_update;
    private Integer update_alarms;
    private int update_settings_timeout;
    private Integer use_safety_net;

    public String getAppCheckId() {
        return this.app_check_id;
    }

    public n getFeatures() {
        return new n() { // from class: ru.mail.libverify.requests.response.UpdateSettingsApiResponse.1
            @Override // ru.mail.libverify.storage.n
            public Boolean accountCheckWithSms() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.sms_find == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.sms_find.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean backgroundVerify() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.background_verify == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.background_verify.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean broadcastOnDemand() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.broadcast_on_demand == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.broadcast_on_demand.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean interceptAlienSms() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.sms_check == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.sms_check.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean sendCallStats() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.send_call_stats == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.send_call_stats.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean singleFetcher() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.run_single_fetcher == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.run_single_fetcher.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean trackPackageUpdate() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.track_update == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.track_update.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean updateAlarms() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.update_alarms == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.update_alarms.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }

            @Override // ru.mail.libverify.storage.n
            public Boolean useSafetyNet() {
                boolean z = true;
                if (UpdateSettingsApiResponse.this.use_safety_net == null) {
                    return null;
                }
                if (UpdateSettingsApiResponse.this.use_safety_net.intValue() != 1) {
                    z = false;
                }
                return Boolean.valueOf(z);
            }
        };
    }

    @Nullable
    public FetcherInfo getFetcherInfo() {
        return this.fetcher_info;
    }

    @Nullable
    public SmsInfo getSmsInfo() {
        return this.sms_info;
    }

    public int getUpdateSettingsTimeout() {
        return this.update_settings_timeout;
    }

    public boolean hasSmsInfo() {
        return this.a;
    }

    public void setHasSmsInfo(boolean z) {
        this.a = z;
    }

    @Override // ru.mail.libverify.requests.response.ClientApiResponseBase
    public String toString() {
        return "UpdateSettingsApiResponse{sms_info=" + this.sms_info + ", hasSmsInfo=" + this.a + ", app_check_id=" + this.app_check_id + ", fetcher_info=" + this.fetcher_info + '}';
    }
}
