.class Lcom/google/android/gms/measurement/internal/zzy$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzy;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)[B
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<[B>;"
    }
.end annotation


# instance fields
.field final synthetic alm:Ljava/lang/String;

.field final synthetic auH:Lcom/google/android/gms/measurement/internal/zzy;

.field final synthetic auI:Lcom/google/android/gms/measurement/internal/EventParcel;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzy;Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->alm:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzy$4;->zzbyl()[B

    move-result-object v0

    return-object v0
.end method

.method public zzbyl()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzy;->zza(Lcom/google/android/gms/measurement/internal/zzy;)Lcom/google/android/gms/measurement/internal/zzx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyj()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzy;->zza(Lcom/google/android/gms/measurement/internal/zzy;)Lcom/google/android/gms/measurement/internal/zzx;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzy$4;->alm:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzx;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method
