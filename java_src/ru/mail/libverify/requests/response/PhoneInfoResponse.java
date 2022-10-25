package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.Arrays;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public final class PhoneInfoResponse extends ClientApiResponseBase {
    private Info info;
    private String[] printable;
    private TypingCheck typing_check;

    /* loaded from: classes3.dex */
    public static class Info implements Gsonable {
    }

    /* loaded from: classes3.dex */
    public static class TypingCheck implements Gsonable {
        private String modified_phone_number;
        private String modified_prefix;
        private String[] prefix_state;
        private Integer[] remaining_lengths;
        private int show_warning;

        public String getModifiedPhoneNumber() {
            return this.modified_phone_number;
        }

        public String getModifiedPrefix() {
            return this.modified_prefix;
        }

        @Nullable
        public Integer[] getRemainingLengths() {
            if (this.remaining_lengths == null || this.remaining_lengths.length == 0) {
                return null;
            }
            return this.remaining_lengths;
        }

        public boolean isFixedLineNumber() {
            String[] strArr;
            if (this.prefix_state == null) {
                return false;
            }
            for (String str : this.prefix_state) {
                if (!TextUtils.isEmpty(str) && str.equalsIgnoreCase("fixed-line")) {
                    return true;
                }
            }
            return false;
        }

        public boolean isMobileNumber() {
            String[] strArr;
            if (this.prefix_state == null) {
                return false;
            }
            for (String str : this.prefix_state) {
                if (!TextUtils.isEmpty(str) && str.equalsIgnoreCase("mobile")) {
                    return true;
                }
            }
            return false;
        }

        public boolean isShowWarning() {
            return this.show_warning == 1;
        }
    }

    @Nullable
    public final String[] getPrintable() {
        return this.printable;
    }

    @Nullable
    public final TypingCheck getTypingCheck() {
        return this.typing_check;
    }

    @Override // ru.mail.libverify.requests.response.ClientApiResponseBase
    public final String toString() {
        return "PhoneInfoResponse{info=" + this.info + ", printable=" + Arrays.toString(this.printable) + ", typing_check=" + this.typing_check + '}';
    }
}
