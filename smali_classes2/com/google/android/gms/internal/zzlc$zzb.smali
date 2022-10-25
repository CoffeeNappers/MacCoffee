.class public Lcom/google/android/gms/internal/zzlc$zzb;
.super Lcom/google/android/gms/internal/zzlc$zza;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzlc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zzb"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlc$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Landroid/app/DownloadManager$Request;)Z
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    invoke-virtual {p1, v0}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    return v0
.end method

.method public zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/internal/zzlc$zza;->zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z

    new-instance v0, Lcom/google/android/gms/internal/zzlc$zzb$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzlc$zzb$1;-><init>(Lcom/google/android/gms/internal/zzlc$zzb;Landroid/content/Context;Landroid/webkit/WebSettings;)V

    invoke-static {v0}, Lcom/google/android/gms/internal/zzlo;->zzb(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public zza(Landroid/view/Window;)Z
    .locals 1

    const/high16 v0, 0x1000000

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    const/4 v0, 0x1

    return v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzmd;Z)Lcom/google/android/gms/internal/zzme;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzml;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzml;-><init>(Lcom/google/android/gms/internal/zzmd;Z)V

    return-object v0
.end method

.method public zzh(Landroid/net/Uri;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public zzn(Lcom/google/android/gms/internal/zzmd;)Landroid/webkit/WebChromeClient;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzmk;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzmk;-><init>(Lcom/google/android/gms/internal/zzmd;)V

    return-object v0
.end method

.method public zzu(Landroid/view/View;)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    const/4 v0, 0x1

    return v0
.end method

.method public zzv(Landroid/view/View;)Z
    .locals 2

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return v1
.end method
