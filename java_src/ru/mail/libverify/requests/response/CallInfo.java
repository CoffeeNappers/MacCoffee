package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import java.util.Arrays;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public class CallInfo implements Gsonable {
    private String[] call_fragment_template;
    private String session_id;

    @Nullable
    public String[] getCallFragmentTemplate() {
        return this.call_fragment_template;
    }

    @Nullable
    public String getHashedSessionId() {
        return this.session_id;
    }

    public String toString() {
        return "CallInfo{call_fragment_template=" + Arrays.toString(this.call_fragment_template) + ", session_id=" + this.session_id + '}';
    }
}
