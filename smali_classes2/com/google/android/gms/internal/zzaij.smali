.class public Lcom/google/android/gms/internal/zzaij;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzaij$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final baj:Lcom/google/android/gms/internal/zzaih;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaih",
            "<TT;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzaih;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaih",
            "<TT;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzaih$zza;->zzcrm()Lcom/google/android/gms/internal/zzaih$zza$zza;

    move-result-object v1

    invoke-static {p1, v0, v1, p2}, Lcom/google/android/gms/internal/zzaih$zza;->zzb(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaih$zza$zza;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzaij$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzaij$zza;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public zzbl(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaij;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/google/android/gms/internal/zzaij",
            "<TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->zzbg(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    if-ne v0, v1, :cond_0

    :goto_0
    return-object p0

    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/zzaij;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaij;-><init>(Lcom/google/android/gms/internal/zzaih;)V

    goto :goto_0
.end method

.method public zzbm(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaij;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/google/android/gms/internal/zzaij",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzaij;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/google/android/gms/internal/zzaih;->zzj(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzaij;-><init>(Lcom/google/android/gms/internal/zzaih;)V

    return-object v0
.end method

.method public zzbn(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->zzbh(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zzcrl()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzaij$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaih;->zzcrl()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzaij$zza;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public zzcrn()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->zzcrj()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zzcro()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaij;->baj:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->zzcrk()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
