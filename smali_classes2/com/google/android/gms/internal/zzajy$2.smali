.class Lcom/google/android/gms/internal/zzajy$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajy$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajy;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajy$zzb;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bfb:Lcom/google/android/gms/internal/zzajy;

.field final synthetic bfc:Lcom/google/android/gms/internal/zzajq;

.field final synthetic bfd:Lcom/google/android/gms/internal/zzajy$zzb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajy;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajy$zzb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajy$2;->bfb:Lcom/google/android/gms/internal/zzajy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajy$2;->bfc:Lcom/google/android/gms/internal/zzajq;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajy$2;->bfd:Lcom/google/android/gms/internal/zzajy$zzb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzajy;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajy$2;->bfc:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajy$2;->bfd:Lcom/google/android/gms/internal/zzajy$zzb;

    invoke-virtual {p2, v0, v1}, Lcom/google/android/gms/internal/zzajy;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajy$zzb;)V

    return-void
.end method
