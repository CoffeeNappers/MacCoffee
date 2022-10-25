.class Lcom/google/android/gms/internal/zzgw$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgw;->zza(Lcom/google/android/gms/internal/zzlt;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbxa:Lcom/google/android/gms/internal/zzgw;

.field final synthetic zzbxb:Lcom/google/android/gms/internal/zzlt;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgw;Lcom/google/android/gms/internal/zzlt;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgw$2;->zzbxa:Lcom/google/android/gms/internal/zzgw;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgw$2;->zzbxb:Lcom/google/android/gms/internal/zzlt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgw$2;->zzbxa:Lcom/google/android/gms/internal/zzgw;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgw;->zze(Lcom/google/android/gms/internal/zzgw;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzlt;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgw$2;->zzbxb:Lcom/google/android/gms/internal/zzlt;

    if-eq v0, v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgw$2;->zzbxa:Lcom/google/android/gms/internal/zzgw;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzgw;->zze(Lcom/google/android/gms/internal/zzgw;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgt;->cancel()V

    goto :goto_0

    :cond_1
    return-void
.end method
