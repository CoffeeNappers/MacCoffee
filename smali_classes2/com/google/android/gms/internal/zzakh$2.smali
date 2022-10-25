.class final Lcom/google/android/gms/internal/zzakh$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzala;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzakh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzala",
        "<",
        "Lcom/google/android/gms/internal/zzake;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzake;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzake;->isVisible()Z

    move-result v0

    return v0
.end method

.method public synthetic zzbs(Ljava/lang/Object;)Z
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzake;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzakh$2;->zza(Lcom/google/android/gms/internal/zzake;)Z

    move-result v0

    return v0
.end method
