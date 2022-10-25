.class public final Lcom/google/android/gms/internal/zzmx;
.super Lcom/google/android/gms/analytics/zzg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/analytics/zzg",
        "<",
        "Lcom/google/android/gms/internal/zzmx;",
        ">;"
    }
.end annotation


# instance fields
.field private bZ:Ljava/lang/String;

.field public ca:I

.field public cb:I

.field public cc:I

.field public zzbzd:I

.field public zzbze:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/zzg;-><init>()V

    return-void
.end method


# virtual methods
.method public getLanguage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzmx;->bZ:Ljava/lang/String;

    return-object v0
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzmx;->bZ:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "language"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzmx;->bZ:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "screenColors"

    iget v2, p0, Lcom/google/android/gms/internal/zzmx;->ca:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "screenWidth"

    iget v2, p0, Lcom/google/android/gms/internal/zzmx;->zzbzd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "screenHeight"

    iget v2, p0, Lcom/google/android/gms/internal/zzmx;->zzbze:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "viewportWidth"

    iget v2, p0, Lcom/google/android/gms/internal/zzmx;->cb:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "viewportHeight"

    iget v2, p0, Lcom/google/android/gms/internal/zzmx;->cc:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzmx;->zzj(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzmx;)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->ca:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->ca:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzmx;->zzby(I)V

    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->zzbzd:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->zzbzd:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzmx;->zzbz(I)V

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->zzbze:I

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->zzbze:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzmx;->zzca(I)V

    :cond_2
    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->cb:I

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->cb:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzmx;->zzcb(I)V

    :cond_3
    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->cc:I

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->cc:I

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzmx;->zzcc(I)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzmx;->bZ:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzmx;->bZ:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzmx;->setLanguage(Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method public zzaaq()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->ca:I

    return v0
.end method

.method public zzaar()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->zzbzd:I

    return v0
.end method

.method public zzaas()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->zzbze:I

    return v0
.end method

.method public zzaat()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->cb:I

    return v0
.end method

.method public zzaau()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzmx;->cc:I

    return v0
.end method

.method public synthetic zzb(Lcom/google/android/gms/analytics/zzg;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzmx;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzmx;->zza(Lcom/google/android/gms/internal/zzmx;)V

    return-void
.end method

.method public zzby(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzmx;->ca:I

    return-void
.end method

.method public zzbz(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzmx;->zzbzd:I

    return-void
.end method

.method public zzca(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzmx;->zzbze:I

    return-void
.end method

.method public zzcb(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzmx;->cb:I

    return-void
.end method

.method public zzcc(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzmx;->cc:I

    return-void
.end method
