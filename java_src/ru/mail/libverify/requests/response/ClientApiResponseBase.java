package ru.mail.libverify.requests.response;

import ru.mail.libverify.requests.e;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class ClientApiResponseBase implements Gsonable {
    private transient e a;
    private String description;
    private DetailStatus detail_status;
    private Status status;

    /* loaded from: classes.dex */
    public enum DetailStatus {
        UNKNOWN_LIBVERIFY,
        UNDEFINED_PHONE,
        NO_CHECKPARAMS,
        CONFIRM_NOT_ALLOWED,
        EMPTY_APPLICATION_ID,
        EMPTY_CODE,
        EMPTY_PHONE,
        EMPTY_SESSION,
        EMPTY_STATUS,
        EMPTY_STORED_CODE,
        EXPIRED_SESSION,
        INCORRECT_CODE,
        NOT_ENOUGH_DATA,
        NO_VERIFICATION_SMS,
        SMSACTION_NOT_AVAILABLE,
        TOO_SHORT_CODE,
        UNKNOWN_PHONE,
        UNKNOWN_PRODUCT,
        UNKNOWN_SERVICE,
        UNSUPPORTED_PHONE,
        UNKNOWN
    }

    /* loaded from: classes.dex */
    public enum Status {
        OK,
        ERROR,
        VERIFIED,
        UNSUPPORTED_NUMBER,
        INCORRECT_PHONE_NUMBER,
        PHONE_NUMBER_IN_BLACK_LIST,
        PHONE_NUMBER_TYPE_NOT_ALLOWED,
        RATELIMIT,
        ATTEMPTLIMIT,
        INCORRECT_SIGNATURE,
        NOT_ENOUGH_DATA,
        UNKNOWN
    }

    public String getDescription() {
        return this.description;
    }

    public DetailStatus getDetailStatus() {
        if (this.detail_status == null) {
            this.detail_status = DetailStatus.UNKNOWN;
        }
        return this.detail_status;
    }

    public e getOwner() {
        return this.a;
    }

    public Status getStatus() {
        if (this.status == null) {
            this.status = Status.UNKNOWN;
        }
        return this.status;
    }

    public void setOwner(e eVar) {
        this.a = eVar;
    }

    public String toString() {
        return "ClientApiResponseBase{status=" + this.status + ", description='" + this.description + "', detail_status='" + this.detail_status + "'}";
    }
}
