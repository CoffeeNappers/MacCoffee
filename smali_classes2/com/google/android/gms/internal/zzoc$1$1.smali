.class Lcom/google/android/gms/internal/zzoc$1$1;
.super Lcom/google/android/gms/internal/zznx;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzoc$1;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzoa;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic jd:Lcom/google/android/gms/internal/zzoc$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzoc$1;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoc$1$1;->jd:Lcom/google/android/gms/internal/zzoc$1;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zznx;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/auth/api/proxy/ProxyResponse;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzoc$1$1;->jd:Lcom/google/android/gms/internal/zzoc$1;

    new-instance v1, Lcom/google/android/gms/internal/zzod;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzod;-><init>(Lcom/google/android/gms/auth/api/proxy/ProxyResponse;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzoc$1;->zzc(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
