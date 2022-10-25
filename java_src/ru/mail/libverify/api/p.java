package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import java.util.Arrays;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.response.PhoneInfoResponse;
/* loaded from: classes3.dex */
final class p implements VerificationApi.PhoneCheckResult {
    private static VerificationApi.PhoneCheckResult a;
    private static VerificationApi.PhoneCheckResult b;
    private static VerificationApi.PhoneCheckResult c;
    private static VerificationApi.PhoneCheckResult d;
    private final VerificationApi.FailReason e;
    private final VerificationApi.PhoneCheckResult.State f;
    private final boolean g;
    private final String[] h;
    private final a i;

    /* loaded from: classes3.dex */
    private static class a implements VerificationApi.PhoneCheckResult.ExtendedInfo {
        private final boolean a;
        private final boolean b;
        private final Integer[] c;
        private final boolean d;
        private final Integer e;
        private final String f;
        private final String g;

        private a(@NonNull PhoneInfoResponse.TypingCheck typingCheck) {
            this.a = typingCheck.isMobileNumber();
            this.b = typingCheck.isFixedLineNumber();
            this.c = a(typingCheck.getRemainingLengths());
            this.e = a(typingCheck.getRemainingLengths(), this.c, false);
            this.d = typingCheck.isShowWarning();
            this.f = typingCheck.getModifiedPhoneNumber();
            this.g = typingCheck.getModifiedPrefix();
        }

        private a(boolean z, boolean z2, boolean z3, Integer num, Integer[] numArr) {
            this.a = z;
            this.b = z2;
            this.e = num;
            this.c = numArr;
            this.d = z3;
            this.f = null;
            this.g = null;
        }

        private static Integer a(Integer[] numArr, Integer[] numArr2, boolean z) {
            if (numArr == null || numArr2 == null || numArr.length == 0 || numArr.length != numArr2.length) {
                return null;
            }
            int i = Integer.MAX_VALUE;
            int i2 = 0;
            Integer num = null;
            while (i2 < numArr.length) {
                numArr2[i2] = Integer.valueOf(z ? numArr[i2].intValue() - 1 : numArr[i2].intValue());
                int abs = Math.abs(numArr2[i2].intValue());
                if (abs < i) {
                    num = numArr2[i2];
                } else {
                    abs = i;
                }
                i2++;
                i = abs;
            }
            return num;
        }

        static /* synthetic */ VerificationApi.PhoneCheckResult.ExtendedInfo a(VerificationApi.PhoneCheckResult.ExtendedInfo extendedInfo) {
            boolean z = true;
            if (extendedInfo == null || !(extendedInfo instanceof a)) {
                return null;
            }
            a aVar = (a) extendedInfo;
            Integer[] a = a(aVar.c);
            Integer a2 = a(aVar.c, a, true);
            if ((a2 != null && a2.intValue() == 0) || !aVar.d) {
                z = false;
            }
            return new a(aVar.a, aVar.b, z, a2, a);
        }

        static /* synthetic */ VerificationApi.PhoneCheckResult.ExtendedInfo a(PhoneInfoResponse.TypingCheck typingCheck) {
            if (typingCheck == null) {
                return null;
            }
            return new a(typingCheck);
        }

        private static Integer[] a(Integer[] numArr) {
            if (numArr == null || numArr.length == 0) {
                return null;
            }
            return new Integer[numArr.length];
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult.ExtendedInfo
        public final String getModifiedPhoneNumber() {
            return this.f;
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult.ExtendedInfo
        public final String getModifiedPrefix() {
            return this.g;
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult.ExtendedInfo
        public final Integer getRemainingLength() {
            return this.e;
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult.ExtendedInfo
        public final boolean isFixedLine() {
            return this.b;
        }

        @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult.ExtendedInfo
        public final boolean isMobile() {
            return this.a;
        }

        public final String toString() {
            return "Info{isMobile=" + this.a + ", isFixedLine=" + this.b + ", remainingLengths=" + Arrays.toString(this.c) + ", isWarning=" + this.d + '}';
        }
    }

    private p(VerificationApi.FailReason failReason, String[] strArr, VerificationApi.PhoneCheckResult.ExtendedInfo extendedInfo, VerificationApi.PhoneCheckResult.State state, boolean z) {
        this.e = failReason;
        this.f = state;
        this.g = z;
        this.h = strArr;
        this.i = (a) extendedInfo;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VerificationApi.PhoneCheckResult a() {
        if (a == null) {
            a = a(m.a(), false);
        }
        return a;
    }

    private static VerificationApi.PhoneCheckResult a(VerificationApi.FailReason failReason, boolean z) {
        return new p(failReason, null, null, VerificationApi.PhoneCheckResult.State.INVALID, z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VerificationApi.PhoneCheckResult a(@NonNull VerificationApi.PhoneCheckResult phoneCheckResult) {
        VerificationApi.PhoneCheckResult.ExtendedInfo extendedInfo = phoneCheckResult.getExtendedInfo();
        if (phoneCheckResult.isValid()) {
            return new p(VerificationApi.FailReason.OK, null, extendedInfo, phoneCheckResult.getState(), true);
        }
        if (extendedInfo == null) {
            return null;
        }
        Integer remainingLength = a.a(extendedInfo).getRemainingLength();
        return new p(VerificationApi.FailReason.OK, null, a.a(extendedInfo), remainingLength != null && remainingLength.intValue() == 0 && (extendedInfo.isMobile() || extendedInfo.isFixedLine()) ? VerificationApi.PhoneCheckResult.State.VALID : phoneCheckResult.getState(), true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VerificationApi.PhoneCheckResult a(@NonNull PhoneInfoResponse phoneInfoResponse) {
        VerificationApi.PhoneCheckResult.State state;
        switch (phoneInfoResponse.getStatus()) {
            case OK:
                state = VerificationApi.PhoneCheckResult.State.VALID;
                break;
            case UNSUPPORTED_NUMBER:
            case INCORRECT_PHONE_NUMBER:
            case PHONE_NUMBER_IN_BLACK_LIST:
            case PHONE_NUMBER_TYPE_NOT_ALLOWED:
                state = VerificationApi.PhoneCheckResult.State.INVALID;
                break;
            case NOT_ENOUGH_DATA:
                state = VerificationApi.PhoneCheckResult.State.UNKNOWN;
                break;
            default:
                throw new IllegalArgumentException();
        }
        return new p(VerificationApi.FailReason.OK, phoneInfoResponse.getPrintable(), a.a(phoneInfoResponse.getTypingCheck()), state, false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VerificationApi.PhoneCheckResult b() {
        if (b == null) {
            b = a(m.a(), false);
        }
        return b;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VerificationApi.PhoneCheckResult c() {
        if (c == null) {
            c = a(m.c(), false);
        }
        return c;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VerificationApi.PhoneCheckResult d() {
        if (d == null) {
            d = a(VerificationApi.FailReason.INCORRECT_PHONE_NUMBER, true);
        }
        return d;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final VerificationApi.PhoneCheckResult.ExtendedInfo getExtendedInfo() {
        return this.i;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final String[] getPrintableText() {
        if (this.h == null || this.h.length == 0) {
            return null;
        }
        return this.h;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final VerificationApi.FailReason getReason() {
        return this.e;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final VerificationApi.PhoneCheckResult.State getState() {
        return this.f;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final boolean isApproximate() {
        return this.g;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final boolean isInvalid() {
        return this.f == VerificationApi.PhoneCheckResult.State.INVALID;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final boolean isUnknown() {
        return this.f == VerificationApi.PhoneCheckResult.State.UNKNOWN;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final boolean isValid() {
        return this.f == VerificationApi.PhoneCheckResult.State.VALID;
    }

    @Override // ru.mail.libverify.api.VerificationApi.PhoneCheckResult
    public final boolean isWarning() {
        return this.f == VerificationApi.PhoneCheckResult.State.INVALID && (this.i == null || this.i.d || this.e == VerificationApi.FailReason.INCORRECT_PHONE_NUMBER || this.e == VerificationApi.FailReason.UNSUPPORTED_NUMBER);
    }

    public final String toString() {
        return "PhoneCheckResult{isApproximate=" + this.g + ", state=" + this.f + ", reason=" + this.e + ", extendedInfo=" + this.i + '}';
    }
}
