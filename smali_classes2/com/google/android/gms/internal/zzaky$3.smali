.class final Lcom/google/android/gms/internal/zzaky$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzala;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaky;
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
        "Lcom/google/android/gms/internal/zzakx;",
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
.method public synthetic zzbs(Ljava/lang/Object;)Z
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzakx;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaky$3;->zzc(Lcom/google/android/gms/internal/zzakx;)Z

    move-result v0

    return v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzakx;)Z
    .locals 1

    iget-boolean v0, p1, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
