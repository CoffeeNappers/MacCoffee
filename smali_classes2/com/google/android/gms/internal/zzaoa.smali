.class public Lcom/google/android/gms/internal/zzaoa;
.super Ljava/lang/Object;


# instance fields
.field private blA:J

.field private blB:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzanv;",
            ">;"
        }
    .end annotation
.end field

.field private blp:Z

.field private blx:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, -0x1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaoa;-><init>(J)V

    return-void
.end method

.method public constructor <init>(IJLjava/util/Map;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzanv;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/zzaoa;->blx:I

    iput-wide p2, p0, Lcom/google/android/gms/internal/zzaoa;->blA:J

    if-eqz p4, :cond_0

    :goto_0
    iput-object p4, p0, Lcom/google/android/gms/internal/zzaoa;->blB:Ljava/util/Map;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzaoa;->blp:Z

    return-void

    :cond_0
    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    goto :goto_0
.end method

.method public constructor <init>(J)V
    .locals 7

    const/4 v1, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-wide v2, p1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaoa;-><init>(IJLjava/util/Map;Z)V

    return-void
.end method


# virtual methods
.method public Y()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzanv;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaoa;->blB:Ljava/util/Map;

    return-object v0
.end method

.method public Z()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzaoa;->blA:J

    return-wide v0
.end method

.method public getLastFetchStatus()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzaoa;->blx:I

    return v0
.end method

.method public isDeveloperModeEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaoa;->blp:Z

    return v0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzanv;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaoa;->blB:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public zzagf(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzaoa;->blx:I

    return-void
.end method

.method public zzch(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzanv;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    :goto_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzaoa;->blB:Ljava/util/Map;

    return-void

    :cond_0
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    goto :goto_0
.end method

.method public zzcq(J)V
    .locals 1

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzaoa;->blA:J

    return-void
.end method

.method public zzdd(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaoa;->blp:Z

    return-void
.end method

.method public zzud(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaoa;->blB:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaoa;->blB:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
