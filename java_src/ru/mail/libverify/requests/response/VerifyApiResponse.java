package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import ru.mail.libverify.requests.p;
/* loaded from: classes3.dex */
public class VerifyApiResponse extends ClientApiResponseBase {
    private Map<String, String> app_endpoints;
    private String[] call_fragment_template;
    private String[] call_template;
    private Set<p.a> checks;
    private int code_length;
    private CodeType code_type;
    private FetcherInfo fetcher_info;
    private String ivr_timeout_sec;
    private String modified_phone_number;
    private String session_id;
    private String sms_template;
    private Set<String> supported_ivr_languages;
    private String token;
    private int token_expiration_time;
    private String verification_url;
    private String verify_code;

    /* loaded from: classes.dex */
    public enum CodeType {
        NUMERIC,
        ALPHANUMERIC
    }

    public Map<String, String> getAppEndpoints() {
        return this.app_endpoints;
    }

    @Nullable
    public String[] getCallFragmentTemplate() {
        return this.call_fragment_template;
    }

    @Nullable
    public String[] getCallTemplates() {
        return this.call_template;
    }

    public int getCodeLength() {
        return this.code_length;
    }

    public CodeType getCodeType() {
        return this.code_type;
    }

    @Nullable
    public FetcherInfo getFetcherInfo() {
        return this.fetcher_info;
    }

    public String getIvrTimeoutSec() {
        return this.ivr_timeout_sec;
    }

    public String getModifiedPhoneNumber() {
        return this.modified_phone_number;
    }

    public String getSmsTemplate() {
        return this.sms_template;
    }

    @Nullable
    public Set<String> getSupportedIvrLanguages() {
        return this.supported_ivr_languages;
    }

    public String getToken() {
        return this.token;
    }

    public int getTokenExpirationTime() {
        return this.token_expiration_time;
    }

    public String getVerificationUrl() {
        return this.verification_url;
    }

    public void setAppEndpoints(Map<String, String> map) {
        this.app_endpoints = map;
    }

    public void setToken(String str) {
        this.token = str;
    }

    public void setTokenExpirationTime(int i) {
        this.token_expiration_time = i;
    }

    @Override // ru.mail.libverify.requests.response.ClientApiResponseBase
    public String toString() {
        return "VerifyApiResponse{base='" + super.toString() + "'verification_url='" + this.verification_url + "', call_template=" + Arrays.toString(this.call_template) + ", call_number_fragment_template=" + Arrays.toString(this.call_fragment_template) + ", ivr_timeout_sec='" + this.ivr_timeout_sec + "', modified_phone_number='" + this.modified_phone_number + "', session_id='" + this.session_id + "', sms_template='" + this.sms_template + "', supported_ivr_languages=" + this.supported_ivr_languages + ", verify_code='" + this.verify_code + "', token_expiration_time='" + this.token_expiration_time + "', code_length=" + this.code_length + ", code_type=" + this.code_type + ", token='" + this.token + "', fetcher_info=" + this.fetcher_info + ", checks='" + (this.checks == null ? "null" : Arrays.toString(this.checks.toArray())) + "', app_endpoints='" + this.app_endpoints + "'}";
    }
}
