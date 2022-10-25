.class public Lcom/google/android/gms/internal/zzalq;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzals;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final bhC:Lcom/google/android/gms/internal/zzamf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzalq;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzalq;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzamf;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzalq;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 4

    sget-boolean v0, Lcom/google/android/gms/internal/zzalq;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalq;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzamg;->zzb(Lcom/google/android/gms/internal/zzamf;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "The index must match the filter"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-interface {v1, p4}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-interface {p3, p4}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v2

    invoke-interface {p3}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v3

    if-ne v2, v3, :cond_2

    :cond_1
    :goto_0
    return-object p1

    :cond_2
    if-eqz p6, :cond_3

    invoke-interface {p3}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0, p2}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-static {p2, v1}, Lcom/google/android/gms/internal/zzalf;->zzd(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v1

    invoke-virtual {p6, v1}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    :cond_3
    :goto_1
    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p3}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_4
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    goto :goto_0

    :cond_5
    sget-boolean v1, Lcom/google/android/gms/internal/zzalq;->$assertionsDisabled:Z

    if-nez v1, :cond_3

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "A child remove without an old child only makes sense on a leaf node"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_6
    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {p2, p3}, Lcom/google/android/gms/internal/zzalf;->zzc(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v1

    invoke-virtual {p6, v1}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    goto :goto_1

    :cond_7
    invoke-static {p2, p3, v1}, Lcom/google/android/gms/internal/zzalf;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v1

    invoke-virtual {p6, v1}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 4

    sget-boolean v0, Lcom/google/android/gms/internal/zzalq;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalq;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzamg;->zzb(Lcom/google/android/gms/internal/zzamf;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Can\'t use IndexedNode that doesn\'t have filter\'s index"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    if-eqz p3, :cond_5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzalf;->zzd(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v3, v0, v2}, Lcom/google/android/gms/internal/zzalf;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    goto :goto_1

    :cond_4
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzalf;->zzc(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    goto :goto_1

    :cond_5
    return-object p2
.end method

.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p1

    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/zzamg;->zzo(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    goto :goto_0
.end method

.method public zzcya()Lcom/google/android/gms/internal/zzamf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalq;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method public zzcyq()Lcom/google/android/gms/internal/zzals;
    .locals 0

    return-object p0
.end method

.method public zzcyr()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
