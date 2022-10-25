.class Lcom/google/firebase/database/connection/idl/zzc$1;
.super Lcom/google/firebase/database/connection/idl/zzg$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/connection/idl/zzc;->zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaix;Ljava/lang/Long;Lcom/google/android/gms/internal/zzajb;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bcr:Lcom/google/android/gms/internal/zzaix;

.field final synthetic bcs:Lcom/google/firebase/database/connection/idl/zzc;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/connection/idl/zzc;Lcom/google/android/gms/internal/zzaix;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/connection/idl/zzc$1;->bcs:Lcom/google/firebase/database/connection/idl/zzc;

    iput-object p2, p0, Lcom/google/firebase/database/connection/idl/zzc$1;->bcr:Lcom/google/android/gms/internal/zzaix;

    invoke-direct {p0}, Lcom/google/firebase/database/connection/idl/zzg$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zzcsm()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc$1;->bcr:Lcom/google/android/gms/internal/zzaix;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaix;->zzcsm()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzcsn()Z
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc$1;->bcr:Lcom/google/android/gms/internal/zzaix;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaix;->zzcsn()Z

    move-result v0

    return v0
.end method

.method public zzctw()Lcom/google/firebase/database/connection/idl/CompoundHashParcelable;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc$1;->bcr:Lcom/google/android/gms/internal/zzaix;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaix;->zzcso()Lcom/google/android/gms/internal/zzair;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/database/connection/idl/CompoundHashParcelable;->zza(Lcom/google/android/gms/internal/zzair;)Lcom/google/firebase/database/connection/idl/CompoundHashParcelable;

    move-result-object v0

    return-object v0
.end method
