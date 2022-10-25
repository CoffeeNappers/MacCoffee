.class Lcom/google/android/gms/internal/zzajy$1;
.super Lcom/google/android/gms/internal/zzama$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajy;->zzr(Lcom/google/android/gms/internal/zzajq;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdc:Lcom/google/android/gms/internal/zzajq;

.field final synthetic bfb:Lcom/google/android/gms/internal/zzajy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajy;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajy$1;->bfb:Lcom/google/android/gms/internal/zzajy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajy$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzama$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajy$1;->bfb:Lcom/google/android/gms/internal/zzajy;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajy$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/google/android/gms/internal/zzajy;->zzh(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    return-void
.end method
