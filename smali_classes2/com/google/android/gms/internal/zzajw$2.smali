.class final Lcom/google/android/gms/internal/zzajw$2;
.super Lcom/google/android/gms/internal/zzama$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic beW:Ljava/util/Map;

.field final synthetic beX:Lcom/google/android/gms/internal/zzajx;


# direct methods
.method constructor <init>(Ljava/util/Map;Lcom/google/android/gms/internal/zzajx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajw$2;->beW:Ljava/util/Map;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajw$2;->beX:Lcom/google/android/gms/internal/zzajx;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzama$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajw$2;->beW:Ljava/util/Map;

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    if-eq v0, p2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajw$2;->beX:Lcom/google/android/gms/internal/zzajx;

    new-instance v2, Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzajx;->zzg(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    :cond_0
    return-void
.end method
