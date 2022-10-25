.class Lcom/google/android/gms/tagmanager/zzcx$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzcx$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzcx;->zza(Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzcw;)Lcom/google/android/gms/tagmanager/zzce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aGX:Lcom/google/android/gms/tagmanager/zzcx;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzcx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcx$4;->aGX:Lcom/google/android/gms/tagmanager/zzcx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzafw$zze;Ljava/util/Set;Ljava/util/Set;Lcom/google/android/gms/tagmanager/zzcs;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzafw$zze;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzafw$zza;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzafw$zza;",
            ">;",
            "Lcom/google/android/gms/tagmanager/zzcs;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzafw$zze;->zzcjx()Ljava/util/List;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzafw$zze;->zzcjy()Ljava/util/List;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-interface {p4}, Lcom/google/android/gms/tagmanager/zzcs;->zzcfq()Lcom/google/android/gms/tagmanager/zzcq;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzafw$zze;->zzcjx()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzafw$zze;->zzclb()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzcq;->zzc(Ljava/util/List;Ljava/util/List;)V

    invoke-interface {p4}, Lcom/google/android/gms/tagmanager/zzcs;->zzcfr()Lcom/google/android/gms/tagmanager/zzcq;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzafw$zze;->zzcjy()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzafw$zze;->zzclc()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzcq;->zzc(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
