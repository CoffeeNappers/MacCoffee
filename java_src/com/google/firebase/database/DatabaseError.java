package com.google.firebase.database;

import io.sentry.event.EventBuilder;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class DatabaseError {
    public static final int DATA_STALE = -1;
    public static final int DISCONNECTED = -4;
    public static final int EXPIRED_TOKEN = -6;
    public static final int INVALID_TOKEN = -7;
    public static final int MAX_RETRIES = -8;
    public static final int NETWORK_ERROR = -24;
    public static final int OPERATION_FAILED = -2;
    public static final int OVERRIDDEN_BY_SET = -9;
    public static final int PERMISSION_DENIED = -3;
    public static final int UNAVAILABLE = -10;
    public static final int UNKNOWN_ERROR = -999;
    public static final int USER_CODE_EXCEPTION = -11;
    public static final int WRITE_CANCELED = -25;
    private static final Map<Integer, String> aYS = new HashMap();
    private static final Map<String, Integer> aYT;
    private final int aYU;
    private final String aYV;
    private final String message;

    static {
        aYS.put(-1, "The transaction needs to be run again with current data");
        aYS.put(-2, "The server indicated that this operation failed");
        aYS.put(-3, "This client does not have permission to perform this operation");
        aYS.put(-4, "The operation had to be aborted due to a network disconnect");
        aYS.put(-6, "The supplied auth token has expired");
        aYS.put(-7, "The supplied auth token was invalid");
        aYS.put(-8, "The transaction had too many retries");
        aYS.put(-9, "The transaction was overridden by a subsequent set");
        aYS.put(-10, "The service is unavailable");
        aYS.put(-11, "User code called from the Firebase Database runloop threw an exception:\n");
        aYS.put(-24, "The operation could not be performed due to a network error");
        aYS.put(-25, "The write was canceled by the user.");
        aYS.put(Integer.valueOf((int) UNKNOWN_ERROR), "An unknown error occurred");
        aYT = new HashMap();
        aYT.put("datastale", -1);
        aYT.put("failure", -2);
        aYT.put("permission_denied", -3);
        aYT.put("disconnected", -4);
        aYT.put("expired_token", -6);
        aYT.put("invalid_token", -7);
        aYT.put("maxretries", -8);
        aYT.put("overriddenbyset", -9);
        aYT.put(EventBuilder.DEFAULT_HOSTNAME, -10);
        aYT.put("network_error", -24);
        aYT.put("write_canceled", -25);
    }

    private DatabaseError(int i, String str) {
        this(i, str, null);
    }

    private DatabaseError(int i, String str, String str2) {
        this.aYU = i;
        this.message = str;
        this.aYV = str2 == null ? "" : str2;
    }

    public static DatabaseError fromException(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        th.printStackTrace(new PrintWriter(stringWriter));
        String valueOf = String.valueOf(aYS.get(-11));
        String valueOf2 = String.valueOf(stringWriter.toString());
        return new DatabaseError(-11, valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf));
    }

    public static DatabaseError zzafs(int i) {
        if (!aYS.containsKey(Integer.valueOf(i))) {
            throw new IllegalArgumentException(new StringBuilder(49).append("Invalid Firebase Database error code: ").append(i).toString());
        }
        return new DatabaseError(i, aYS.get(Integer.valueOf(i)), null);
    }

    public static DatabaseError zzbl(String str, String str2) {
        return zzo(str, str2, null);
    }

    public static DatabaseError zzo(String str, String str2, String str3) {
        Integer num = aYT.get(str.toLowerCase());
        Integer valueOf = num == null ? Integer.valueOf((int) UNKNOWN_ERROR) : num;
        return new DatabaseError(valueOf.intValue(), str2 == null ? aYS.get(valueOf) : str2, str3);
    }

    public static DatabaseError zzsa(String str) {
        return zzbl(str, null);
    }

    public int getCode() {
        return this.aYU;
    }

    public String getDetails() {
        return this.aYV;
    }

    public String getMessage() {
        return this.message;
    }

    public DatabaseException toException() {
        String valueOf = String.valueOf(this.message);
        return new DatabaseException(valueOf.length() != 0 ? "Firebase Database error: ".concat(valueOf) : new String("Firebase Database error: "));
    }

    public String toString() {
        String valueOf = String.valueOf(this.message);
        return valueOf.length() != 0 ? "DatabaseError: ".concat(valueOf) : new String("DatabaseError: ");
    }
}
