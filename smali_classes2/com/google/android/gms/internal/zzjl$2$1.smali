.class Lcom/google/android/gms/internal/zzjl$2$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjl$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzlw$zzc",
        "<",
        "Lcom/google/android/gms/internal/zzgi;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzcnu:Lcom/google/android/gms/internal/zzdx;

.field final synthetic zzcnv:Lcom/google/android/gms/internal/zzjl$2;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjl$2;Lcom/google/android/gms/internal/zzdx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnu:Lcom/google/android/gms/internal/zzdx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzgi;)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzjl$2;->zzamm:Lcom/google/android/gms/internal/zzdz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnu:Lcom/google/android/gms/internal/zzdx;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "jsf"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdz;->zza(Lcom/google/android/gms/internal/zzdx;[Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzjl$2;->zzamm:Lcom/google/android/gms/internal/zzdz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdz;->zzma()V

    const-string/jumbo v0, "/invalidRequest"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjl$2;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjn;->zzcoc:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/loadAdURL"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjl$2;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjn;->zzcod:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/loadAd"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjl$2;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjn;->zzcoe:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    :try_start_0
    const-string/jumbo v0, "AFMA_getAd"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2$1;->zzcnv:Lcom/google/android/gms/internal/zzjl$2;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzjl$2;->zzcnt:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zzi(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Error requesting an ad url"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzjl$2$1;->zzb(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method
