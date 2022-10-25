package com.vkontakte.android.auth.libverify;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.utils.L;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import ru.mail.libverify.api.UncaughtExceptionListener;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.controls.VerificationController;
import ru.mail.libverify.utils.LogReceiver;
/* loaded from: classes2.dex */
public class VerificationControllerImpl extends VerificationController {
    private static final long DEFAULT_IVR_CALL_TIMEOUT = TimeUnit.SECONDS.toMillis(60);
    private static final boolean VERIFICATION_CODE_DEFAULT_IS_NUMERIC = true;
    private static final int VERIFICATION_CODE_DEFAULT_LENGTH = 4;
    private SharedPreferences sharedPreferences;
    private final String verificationService;

    public static VerificationControllerImpl registration(Context ctx) {
        return new VerificationControllerImpl(ctx, "vk_registration");
    }

    public static VerificationControllerImpl restore(Context ctx) {
        return new VerificationControllerImpl(ctx, "vk_fast_restore");
    }

    public static VerificationControllerImpl auth(Context ctx) {
        return new VerificationControllerImpl(ctx, "vk_otp_auth");
    }

    private VerificationControllerImpl(@NonNull Context ctx, String verificationService) {
        super(ctx);
        this.verificationService = verificationService;
        VerificationFactory.setLocationUsage(ctx, PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getBoolean("mytrackerLocationCrapEnabled", true));
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    @Nullable
    public LogReceiver getLogReceiver() {
        return new LogReceiver() { // from class: com.vkontakte.android.auth.libverify.VerificationControllerImpl.1
            @Override // ru.mail.libverify.utils.LogReceiver
            public void v(String s, String s1) {
                L.v(s, s1);
            }

            @Override // ru.mail.libverify.utils.LogReceiver
            public void v(String s, String s1, Throwable throwable) {
                L.v(throwable, s, s1);
            }

            @Override // ru.mail.libverify.utils.LogReceiver
            public void e(String s, String s1) {
                L.e(s, s1);
            }

            @Override // ru.mail.libverify.utils.LogReceiver
            public void e(String s, String s1, Throwable throwable) {
                L.e(throwable, s, s1);
            }

            @Override // ru.mail.libverify.utils.LogReceiver
            public void d(String s, String s1) {
                L.d(s, s1);
            }

            @Override // ru.mail.libverify.utils.LogReceiver
            public void d(String s, String s1, Throwable throwable) {
                L.d(throwable, s, s1);
            }
        };
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    public UncaughtExceptionListener getExceptionListener() {
        return new UncaughtExceptionListener() { // from class: com.vkontakte.android.auth.libverify.VerificationControllerImpl.2
            @Override // ru.mail.libverify.api.UncaughtExceptionListener
            public void uncaughtException(@Nullable Thread thread, @NonNull Throwable throwable) {
                Object[] objArr = new Object[2];
                objArr[0] = thread == null ? "" : thread.getName();
                objArr[1] = throwable.toString();
                L.e(throwable, objArr);
            }
        };
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    @NonNull
    public SharedPreferences getPreferences() {
        if (this.sharedPreferences == null) {
            this.sharedPreferences = this.context.getSharedPreferences("libverify", 0);
        }
        return this.sharedPreferences;
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    public int getSmsCodeLengthDefault() {
        return 4;
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    public long getIvrTimeoutDefault() {
        return DEFAULT_IVR_CALL_TIMEOUT;
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    public boolean isSmsCodeNumericDefault() {
        return true;
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    @NonNull
    public String getVerificationService() {
        return this.verificationService;
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    @Nullable
    public String getAlreadyExistingProfileDataJson() {
        return null;
    }

    @Override // ru.mail.libverify.controls.VerificationSupportProvider
    @Nullable
    public Map<String, String> getSmsCodeTemplatesDefault() {
        return null;
    }
}
