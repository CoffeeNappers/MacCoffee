.class public final Lru/mail/libverify/api/VerificationFactory;
.super Ljava/lang/Object;


# static fields
.field public static final LIBVERIFY_RESOURCE_APPLICATION_KEY:Ljava/lang/String; = "libverify_application_key"

.field public static final LIBVERIFY_RESOURCE_APPLICATION_NAME:Ljava/lang/String; = "libverify_application_name"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deliverGcmMessageIntent(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lru/mail/libverify/storage/m;->N()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lru/mail/libverify/gcm/GcmMessageDeliverService;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method public static getGcmServerId()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {}, Lru/mail/libverify/storage/m;->N()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lru/mail/libverify/utils/LogReceiver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lru/mail/libverify/api/UncaughtExceptionListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {p0, p1, p2, p3, p4}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/utils/LogReceiver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/UncaughtExceptionListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {p0, p1, p2}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;Lru/mail/libverify/utils/LogReceiver;Lru/mail/libverify/api/UncaughtExceptionListener;)Lru/mail/libverify/api/VerificationApi;

    move-result-object v0

    return-object v0
.end method

.method public static getRequiredPermissions()[Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {}, Lru/mail/libverify/api/ad;->h()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hasInstallation(Landroid/content/Context;)Z
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/storage/m;->a(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static onAppCreated(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lru/mail/libverify/api/VerificationFactory$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/VerificationFactory$1;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public static refreshGcmToken(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public static release()V
    .locals 0

    invoke-static {}, Lru/mail/libverify/api/k;->a()V

    return-void
.end method

.method public static setApiEndpoints(Landroid/content/Context;Ljava/util/Map;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/api/ad;->setApiEndpoints(Ljava/util/Map;)V

    goto :goto_0
.end method

.method public static setCustomLocale(Landroid/content/Context;Ljava/util/Locale;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/Locale;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/api/ad;->setCustomLocale(Ljava/util/Locale;)V

    goto :goto_0
.end method

.method public static setLocationUsage(Landroid/content/Context;Z)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/api/ad;->setLocationUsage(Z)V

    goto :goto_0
.end method

.method public static signOut(Landroid/content/Context;Z)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    invoke-virtual {v0, p1}, Lru/mail/libverify/api/ad;->signOut(Z)V

    goto :goto_0
.end method

.method public static softSignOut(Landroid/content/Context;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->i(Landroid/content/Context;)Lru/mail/libverify/api/ad;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/api/ad;->softSignOut()V

    goto :goto_0
.end method
