.class public interface abstract Lru/mail/libverify/controls/VerificationSupportProvider;
.super Ljava/lang/Object;


# virtual methods
.method public abstract getAlreadyExistingProfileDataJson()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getExceptionListener()Lru/mail/libverify/api/UncaughtExceptionListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getIvrTimeoutDefault()J
.end method

.method public abstract getLogReceiver()Lru/mail/libverify/utils/LogReceiver;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getPreferences()Landroid/content/SharedPreferences;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getSmsCodeLengthDefault()I
.end method

.method public abstract getSmsCodeTemplatesDefault()Ljava/util/Map;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getVerificationService()Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract isSmsCodeNumericDefault()Z
.end method
