.class final Lcom/google/android/gms/internal/zzajw$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajy$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzajy;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic beV:Lcom/google/android/gms/internal/zzajy;

.field final synthetic beW:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajy;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajw$1;->beV:Lcom/google/android/gms/internal/zzajy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajw$1;->beW:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzf(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajw$1;->beV:Lcom/google/android/gms/internal/zzajy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajw$1;->beW:Ljava/util/Map;

    invoke-static {p2, v1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzajy;->zzh(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    return-void
.end method
