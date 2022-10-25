.class final Lcom/google/android/gms/internal/zzaml$1;
.super Lcom/google/android/gms/internal/zzama;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzama;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaml$1;->zzh(Lcom/google/android/gms/internal/zzaml;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "<Max Node>"

    return-object v0
.end method

.method public zzczf()Lcom/google/android/gms/internal/zzaml;
    .locals 0

    return-object p0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzaml;)I
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public zzk(Lcom/google/android/gms/internal/zzalz;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaml$1;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    goto :goto_0
.end method
