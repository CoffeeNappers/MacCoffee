.class public Lcom/google/android/gms/internal/zzme;
.super Landroid/webkit/WebViewClient;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzme$zzd;,
        Lcom/google/android/gms/internal/zzme$zze;,
        Lcom/google/android/gms/internal/zzme$zzc;,
        Lcom/google/android/gms/internal/zzme$zzb;,
        Lcom/google/android/gms/internal/zzme$zza;
    }
.end annotation


# static fields
.field private static final zzcza:[Ljava/lang/String;

.field private static final zzczb:[Ljava/lang/String;


# instance fields
.field private final zzako:Ljava/lang/Object;

.field private zzasy:Z

.field private zzayj:Lcom/google/android/gms/ads/internal/client/zza;

.field protected zzbnz:Lcom/google/android/gms/internal/zzmd;

.field private zzbpi:Lcom/google/android/gms/internal/zzfa;

.field private zzbqr:Lcom/google/android/gms/internal/zzfi;

.field private zzbqt:Lcom/google/android/gms/ads/internal/zze;

.field private zzbqu:Lcom/google/android/gms/internal/zzhq;

.field private zzbqw:Lcom/google/android/gms/internal/zzfg;

.field private zzbym:Lcom/google/android/gms/internal/zzhw;

.field private zzcgo:Lcom/google/android/gms/internal/zzme$zza;

.field private final zzczc:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzfe;",
            ">;>;"
        }
    .end annotation
.end field

.field private zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

.field private zzcze:Lcom/google/android/gms/internal/zzme$zzb;

.field private zzczf:Lcom/google/android/gms/internal/zzme$zzc;

.field private zzczg:Z

.field private zzczh:Z

.field private zzczi:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private zzczj:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

.field private zzczk:Z

.field private zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

.field private final zzczm:Lcom/google/android/gms/internal/zzhu;

.field private zzczn:Lcom/google/android/gms/internal/zzme$zze;

.field protected zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private zzczp:Z

.field private zzczq:Z

.field private zzczr:Z

.field private zzczs:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "UNKNOWN"

    aput-object v1, v0, v3

    const-string/jumbo v1, "HOST_LOOKUP"

    aput-object v1, v0, v4

    const-string/jumbo v1, "UNSUPPORTED_AUTH_SCHEME"

    aput-object v1, v0, v5

    const-string/jumbo v1, "AUTHENTICATION"

    aput-object v1, v0, v6

    const-string/jumbo v1, "PROXY_AUTHENTICATION"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "CONNECT"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "IO"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "TIMEOUT"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "REDIRECT_LOOP"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "UNSUPPORTED_SCHEME"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "FAILED_SSL_HANDSHAKE"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "BAD_URL"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "FILE"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "FILE_NOT_FOUND"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "TOO_MANY_REQUESTS"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/internal/zzme;->zzcza:[Ljava/lang/String;

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "NOT_YET_VALID"

    aput-object v1, v0, v3

    const-string/jumbo v1, "EXPIRED"

    aput-object v1, v0, v4

    const-string/jumbo v1, "ID_MISMATCH"

    aput-object v1, v0, v5

    const-string/jumbo v1, "UNTRUSTED"

    aput-object v1, v0, v6

    const-string/jumbo v1, "DATE_INVALID"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "INVALID"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/gms/internal/zzme;->zzczb:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzmd;Z)V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzhu;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzmd;->zzwz()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzdj;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzmd;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzdj;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/google/android/gms/internal/zzhu;-><init>(Lcom/google/android/gms/internal/zzmd;Landroid/content/Context;Lcom/google/android/gms/internal/zzdj;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/gms/internal/zzme;-><init>(Lcom/google/android/gms/internal/zzmd;ZLcom/google/android/gms/internal/zzhu;Lcom/google/android/gms/internal/zzhq;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzmd;ZLcom/google/android/gms/internal/zzhu;Lcom/google/android/gms/internal/zzhq;)V
    .locals 1

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczc:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczg:Z

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzme;->zzasy:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzme;->zzczm:Lcom/google/android/gms/internal/zzhu;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzme;)Lcom/google/android/gms/internal/zzme$zzc;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczf:Lcom/google/android/gms/internal/zzme$zzc;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzme;Lcom/google/android/gms/internal/zzme$zzc;)Lcom/google/android/gms/internal/zzme$zzc;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzczf:Lcom/google/android/gms/internal/zzme$zzc;

    return-object p1
.end method

.method private zzb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbgy:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v0, "err"

    invoke-virtual {v4, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "code"

    invoke-virtual {v4, v0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "host"

    invoke-direct {p0, p4}, Lcom/google/android/gms/internal/zzme;->zzdl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzxf()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v1

    iget-object v2, v1, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzda:Ljava/lang/String;

    const-string/jumbo v3, "gmob-apps"

    const/4 v5, 0x1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzlb;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V

    goto :goto_0
.end method

.method private zzdl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static zzi(Landroid/net/Uri;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzye()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcze:Lcom/google/android/gms/internal/zzme$zzb;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcze:Lcom/google/android/gms/internal/zzme$zzb;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzme$zzb;->zzk(Lcom/google/android/gms/internal/zzmd;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcze:Lcom/google/android/gms/internal/zzme$zzb;

    :cond_0
    return-void
.end method


# virtual methods
.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3

    const-string/jumbo v1, "Loading resource: "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string/jumbo v1, "gmsg"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "mobileads.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zzj(Landroid/net/Uri;)V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczp:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Blank page loaded, 1..."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxh()V

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczq:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzme;->zzye()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzme;->zzyf()V

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    if-gez p2, :cond_0

    neg-int v0, p2

    add-int/lit8 v0, v0, -0x1

    sget-object v1, Lcom/google/android/gms/internal/zzme;->zzcza:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzme;->zzcza:[Ljava/lang/String;

    neg-int v1, p2

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "http_err"

    invoke-direct {p0, v1, v2, v0, p4}, Lcom/google/android/gms/internal/zzme;->zzb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 4

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/net/http/SslError;->getPrimaryError()I

    move-result v0

    if-ltz v0, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/zzme;->zzczb:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/google/android/gms/internal/zzme;->zzczb:[Ljava/lang/String;

    aget-object v0, v1, v0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "ssl_err"

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgo()Lcom/google/android/gms/internal/zzlc;

    move-result-object v3

    invoke-virtual {v3, p3}, Lcom/google/android/gms/internal/zzlc;->zza(Landroid/net/http/SslError;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v2, v0, v3}, Lcom/google/android/gms/internal/zzme;->zzb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    return-void

    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final reset()V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/safebrowsing/zzc;->zzuf()V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczc:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcgo:Lcom/google/android/gms/internal/zzme$zza;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcze:Lcom/google/android/gms/internal/zzme$zzb;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbpi:Lcom/google/android/gms/internal/zzfa;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczg:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzasy:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczh:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczk:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqw:Lcom/google/android/gms/internal/zzfg;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczf:Lcom/google/android/gms/internal/zzme$zzc;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzhq;->zzt(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    :cond_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p2}, Lcom/google/android/gms/ads/internal/cache/CacheOffering;->zzak(Ljava/lang/String;)Lcom/google/android/gms/ads/internal/cache/CacheOffering;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgr()Lcom/google/android/gms/ads/internal/cache/zza;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/google/android/gms/ads/internal/cache/zza;->zza(Lcom/google/android/gms/ads/internal/cache/CacheOffering;)Lcom/google/android/gms/ads/internal/cache/CacheEntryParcel;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/cache/CacheEntryParcel;->zzju()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Landroid/webkit/WebResourceResponse;

    const-string/jumbo v3, ""

    const-string/jumbo v4, ""

    invoke-virtual {v2}, Lcom/google/android/gms/ads/internal/cache/CacheEntryParcel;->zzjv()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v3, v4, v2}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x4f -> :sswitch_0
        0x55 -> :sswitch_0
        0x56 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
        0x59 -> :sswitch_0
        0x5a -> :sswitch_0
        0x5b -> :sswitch_0
        0x7e -> :sswitch_0
        0x7f -> :sswitch_0
        0x80 -> :sswitch_0
        0x81 -> :sswitch_0
        0x82 -> :sswitch_0
        0xde -> :sswitch_0
    .end sparse-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 8

    const/4 v3, 0x0

    const-string/jumbo v1, "AdWebView shouldOverrideUrlLoading: "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string/jumbo v1, "gmsg"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "mobileads.google.com"

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zzj(Landroid/net/Uri;)V

    :goto_1
    const/4 v0, 0x1

    :goto_2
    return v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzme;->zzczg:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    if-ne p1, v1, :cond_4

    invoke-static {v0}, Lcom/google/android/gms/internal/zzme;->zzi(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbfo:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/client/zza;->onAdClicked()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    invoke-interface {v0, p2}, Lcom/google/android/gms/ads/internal/safebrowsing/zzc;->zzcu(Ljava/lang/String;)V

    :cond_2
    iput-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    :cond_3
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->willNotDraw()Z

    move-result v1

    if-nez v1, :cond_9

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzxe()Lcom/google/android/gms/internal/zzav;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzav;->zzc(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzmd;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v4}, Lcom/google/android/gms/internal/zzmd;->getView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v1, v0, v2, v4}, Lcom/google/android/gms/internal/zzav;->zza(Landroid/net/Uri;Landroid/content/Context;Landroid/view/View;)Landroid/net/Uri;
    :try_end_0
    .catch Lcom/google/android/gms/internal/zzaw; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_5
    move-object v2, v0

    :goto_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqt:Lcom/google/android/gms/ads/internal/zze;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqt:Lcom/google/android/gms/ads/internal/zze;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zze;->zzfe()Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_6
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;)V

    goto/16 :goto_1

    :catch_0
    move-exception v1

    const-string/jumbo v2, "Unable to append parameter to URL: "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_7

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_4
    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    move-object v2, v0

    goto :goto_3

    :cond_7
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqt:Lcom/google/android/gms/ads/internal/zze;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/ads/internal/zze;->zzy(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_9
    const-string/jumbo v1, "AdWebView unable to handle URL: "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_5
    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_a
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_5
.end method

.method public zza(IIZ)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczm:Lcom/google/android/gms/internal/zzhu;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzhu;->zze(II)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzhq;->zza(IIZ)V

    :cond_0
    return-void
.end method

.method public final zza(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczh:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxp()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzczi:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzme;->zzczj:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zza(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzfa;Lcom/google/android/gms/ads/internal/overlay/zzp;ZLcom/google/android/gms/internal/zzfg;Lcom/google/android/gms/internal/zzfi;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzhw;Lcom/google/android/gms/ads/internal/safebrowsing/zzc;)V
    .locals 3
    .param p7    # Lcom/google/android/gms/internal/zzfi;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Lcom/google/android/gms/ads/internal/safebrowsing/zzc;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p8, :cond_0

    new-instance p8, Lcom/google/android/gms/ads/internal/zze;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p8, v0}, Lcom/google/android/gms/ads/internal/zze;-><init>(Landroid/content/Context;)V

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzhq;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-direct {v0, v1, p9}, Lcom/google/android/gms/internal/zzhq;-><init>(Lcom/google/android/gms/internal/zzmd;Lcom/google/android/gms/internal/zzhw;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    iput-object p10, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    const-string/jumbo v0, "/appEvent"

    new-instance v1, Lcom/google/android/gms/internal/zzez;

    invoke-direct {v1, p3}, Lcom/google/android/gms/internal/zzez;-><init>(Lcom/google/android/gms/internal/zzfa;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/backButton"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpu:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/refresh"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpv:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/canOpenURLs"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpk:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/canOpenIntents"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpl:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/click"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpm:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/close"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpn:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/customClose"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpp:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/instrument"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpz:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/delayPageLoaded"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbqb:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/delayPageClosed"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbqc:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/getLocationInfo"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbqd:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/httpTrack"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpq:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/log"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpr:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/mraid"

    new-instance v1, Lcom/google/android/gms/internal/zzfk;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    invoke-direct {v1, p8, v2}, Lcom/google/android/gms/internal/zzfk;-><init>(Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzhq;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/mraidLoaded"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzczm:Lcom/google/android/gms/internal/zzhu;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/open"

    new-instance v1, Lcom/google/android/gms/internal/zzfl;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    invoke-direct {v1, p6, p8, v2}, Lcom/google/android/gms/internal/zzfl;-><init>(Lcom/google/android/gms/internal/zzfg;Lcom/google/android/gms/ads/internal/zze;Lcom/google/android/gms/internal/zzhq;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/precache"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpy:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/touch"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpt:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/video"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpw:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/videoMeta"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpx:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/appStreaming"

    sget-object v1, Lcom/google/android/gms/internal/zzfd;->zzbpo:Lcom/google/android/gms/internal/zzfe;

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    if-eqz p7, :cond_1

    const-string/jumbo v0, "/setInterstitialProperties"

    new-instance v1, Lcom/google/android/gms/internal/zzfh;

    invoke-direct {v1, p7}, Lcom/google/android/gms/internal/zzfh;-><init>(Lcom/google/android/gms/internal/zzfi;)V

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzme;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    :cond_1
    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzme;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzme;->zzbpi:Lcom/google/android/gms/internal/zzfa;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzme;->zzbqw:Lcom/google/android/gms/internal/zzfg;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzme;->zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

    iput-object p8, p0, Lcom/google/android/gms/internal/zzme;->zzbqt:Lcom/google/android/gms/ads/internal/zze;

    iput-object p9, p0, Lcom/google/android/gms/internal/zzme;->zzbym:Lcom/google/android/gms/internal/zzhw;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzme;->zzbqr:Lcom/google/android/gms/internal/zzfi;

    invoke-virtual {p0, p5}, Lcom/google/android/gms/internal/zzme;->zzao(Z)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;)V
    .locals 6

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxg()Z

    move-result v1

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzmd;->zzeg()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v2

    iget-boolean v2, v2, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-nez v2, :cond_0

    move-object v2, v3

    :goto_0
    if-eqz v1, :cond_1

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzxf()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v5

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/ads/internal/overlay/zzp;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhq;->zzou()Z

    move-result v0

    :goto_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgk()Lcom/google/android/gms/ads/internal/overlay/zze;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzmd;->getContext()Landroid/content/Context;

    move-result-object v3

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-virtual {v2, v3, p1, v1}, Lcom/google/android/gms/ads/internal/overlay/zze;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->url:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzcbj:Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;

    if-eqz v1, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzcbj:Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/overlay/AdLauncherIntentInfoParcel;->url:Ljava/lang/String;

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    invoke-interface {v1, v0}, Lcom/google/android/gms/ads/internal/safebrowsing/zzc;->zzcu(Ljava/lang/String;)V

    :cond_2
    return-void

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzme$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzcgo:Lcom/google/android/gms/internal/zzme$zza;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzme$zzb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzcze:Lcom/google/android/gms/internal/zzme$zzb;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzme$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzczf:Lcom/google/android/gms/internal/zzme$zzc;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzme$zze;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzczn:Lcom/google/android/gms/internal/zzme$zze;

    return-void
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczc:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzczc:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final zza(ZI)V
    .locals 8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxg()Z

    move-result v1

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzeg()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v5}, Lcom/google/android/gms/internal/zzmd;->zzxf()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v7

    move v5, p1

    move v6, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/ads/internal/overlay/zzp;Lcom/google/android/gms/internal/zzmd;ZILcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_0
.end method

.method public final zza(ZILjava/lang/String;)V
    .locals 11

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxg()Z

    move-result v3

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzeg()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-nez v1, :cond_0

    move-object v1, v2

    :goto_0
    if-eqz v3, :cond_1

    :goto_1
    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzbpi:Lcom/google/android/gms/internal/zzfa;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzmd;->zzxf()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v9

    iget-object v10, p0, Lcom/google/android/gms/internal/zzme;->zzbqw:Lcom/google/android/gms/internal/zzfg;

    move v6, p1

    move v7, p2

    move-object v8, p3

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzfa;Lcom/google/android/gms/ads/internal/overlay/zzp;Lcom/google/android/gms/internal/zzmd;ZILjava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzfg;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_0

    :cond_1
    new-instance v2, Lcom/google/android/gms/internal/zzme$zzd;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/internal/zzme$zzd;-><init>(Lcom/google/android/gms/internal/zzmd;Lcom/google/android/gms/ads/internal/overlay/zzg;)V

    goto :goto_1
.end method

.method public final zza(ZILjava/lang/String;Ljava/lang/String;)V
    .locals 12

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxg()Z

    move-result v2

    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->zzeg()Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-result-object v1

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    if-eqz v2, :cond_1

    const/4 v2, 0x0

    :goto_1
    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzbpi:Lcom/google/android/gms/internal/zzfa;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzczl:Lcom/google/android/gms/ads/internal/overlay/zzp;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iget-object v6, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzmd;->zzxf()Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-result-object v10

    iget-object v11, p0, Lcom/google/android/gms/internal/zzme;->zzbqw:Lcom/google/android/gms/internal/zzfg;

    move v6, p1

    move v7, p2

    move-object v8, p3

    move-object/from16 v9, p4

    invoke-direct/range {v0 .. v11}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/client/zza;Lcom/google/android/gms/ads/internal/overlay/zzg;Lcom/google/android/gms/internal/zzfa;Lcom/google/android/gms/ads/internal/overlay/zzp;Lcom/google/android/gms/internal/zzmd;ZILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzfg;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzme;->zza(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzayj:Lcom/google/android/gms/ads/internal/client/zza;

    goto :goto_0

    :cond_1
    new-instance v2, Lcom/google/android/gms/internal/zzme$zzd;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzme;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-direct {v2, v3, v4}, Lcom/google/android/gms/internal/zzme$zzd;-><init>(Lcom/google/android/gms/internal/zzmd;Lcom/google/android/gms/ads/internal/overlay/zzg;)V

    goto :goto_1
.end method

.method public zzao(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzme;->zzczg:Z

    return-void
.end method

.method public zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczc:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzd(II)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqu:Lcom/google/android/gms/internal/zzhq;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzhq;->zzd(II)V

    :cond_0
    return-void
.end method

.method public zzic()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzasy:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzj(Landroid/net/Uri;)V
    .locals 8

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczc:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/zzlb;->zzg(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object v3

    const/4 v2, 0x2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzkx;->zzbi(I)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "Received GMSG: "

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x4

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v5, ": "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzfe;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzfe;->zza(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V

    goto :goto_2

    :cond_2
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x20

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "No GMSG handler found for GMSG: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public zzo(Lcom/google/android/gms/internal/zzmd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    return-void
.end method

.method public final zzpo()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczg:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzasy:Z

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzme$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzme$2;-><init>(Lcom/google/android/gms/internal/zzme;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzlb;->runOnUiThread(Ljava/lang/Runnable;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzxu()Lcom/google/android/gms/ads/internal/zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbqt:Lcom/google/android/gms/ads/internal/zze;

    return-object v0
.end method

.method public zzxv()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczh:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzxw()Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczi:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzxx()Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczj:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzxy()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczk:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzxz()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    const-string/jumbo v0, "Loading blank page in WebView, 2..."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczp:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    const-string/jumbo v2, "about:blank"

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzmd;->zzdj(Ljava/lang/String;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzya()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzlb;->zzcvl:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/internal/zzme$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzme$1;-><init>(Lcom/google/android/gms/internal/zzme;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public zzyb()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczk:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget v0, p0, Lcom/google/android/gms/internal/zzme;->zzczs:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzme;->zzczs:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzme;->zzyf()V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public zzyc()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzme;->zzczs:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzme;->zzczs:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzme;->zzyf()V

    return-void
.end method

.method public zzyd()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczr:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzme;->zzyf()V

    return-void
.end method

.method public final zzyf()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcgo:Lcom/google/android/gms/internal/zzme$zza;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczq:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/zzme;->zzczs:I

    if-lez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczr:Z

    if-eqz v0, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzme;->zzcgo:Lcom/google/android/gms/internal/zzme$zza;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzme;->zzczr:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/internal/zzme$zza;->zza(Lcom/google/android/gms/internal/zzmd;Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzcgo:Lcom/google/android/gms/internal/zzme$zza;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzxq()V

    return-void

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzyg()Lcom/google/android/gms/internal/zzme$zze;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme;->zzczn:Lcom/google/android/gms/internal/zzme$zze;

    return-object v0
.end method
