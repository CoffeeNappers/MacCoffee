.class public Lcom/google/android/gms/internal/zzlc$zzh;
.super Lcom/google/android/gms/internal/zzlc$zzg;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzlc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zzh"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlc$zzg;-><init>()V

    return-void
.end method


# virtual methods
.method public zzal(Landroid/content/Context;)Landroid/webkit/CookieManager;
    .locals 1

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzmd;Z)Lcom/google/android/gms/internal/zzme;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzmp;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzmp;-><init>(Lcom/google/android/gms/internal/zzmd;Z)V

    return-object v0
.end method
