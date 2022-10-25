.class Lcom/google/android/gms/internal/zzakw$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzakz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzakw;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzakz$zza;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzakz$zza",
        "<",
        "Ljava/lang/Boolean;",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic bgJ:Lcom/google/android/gms/internal/zzakz$zza;

.field final synthetic bgK:Lcom/google/android/gms/internal/zzakw;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzakw;Lcom/google/android/gms/internal/zzakz$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakw$3;->bgK:Lcom/google/android/gms/internal/zzakw;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakw$3;->bgJ:Lcom/google/android/gms/internal/zzakz$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Boolean;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/lang/Boolean;",
            "TT;)TT;"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakw$3;->bgJ:Lcom/google/android/gms/internal/zzakz$zza;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1, p3}, Lcom/google/android/gms/internal/zzakz$zza;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    :cond_0
    return-object p3
.end method

.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzakw$3;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Boolean;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
