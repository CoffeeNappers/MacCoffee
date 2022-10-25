.class Lcom/google/android/gms/internal/zzaka$zzb;
.super Lcom/google/android/gms/internal/zzajl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaka;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field private bcY:Lcom/google/android/gms/internal/zzall;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzall;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajl;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$zzb;->bcY:Lcom/google/android/gms/internal/zzall;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/android/gms/internal/zzaka$zzb;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzaka$zzb;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzaka$zzb;->bcY:Lcom/google/android/gms/internal/zzall;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$zzb;->bcY:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzall;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzb;->bcY:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->hashCode()I

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzajl;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzaka$zzb;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzaka$zzb;-><init>(Lcom/google/android/gms/internal/zzall;)V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalg;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalg;)V
    .locals 0

    return-void
.end method

.method public zza(Lcom/google/firebase/database/DatabaseError;)V
    .locals 0

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzalh$zza;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajl;)Z
    .locals 1

    instance-of v0, p1, Lcom/google/android/gms/internal/zzaka$zzb;

    return v0
.end method

.method public zzcud()Lcom/google/android/gms/internal/zzall;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$zzb;->bcY:Lcom/google/android/gms/internal/zzall;

    return-object v0
.end method
