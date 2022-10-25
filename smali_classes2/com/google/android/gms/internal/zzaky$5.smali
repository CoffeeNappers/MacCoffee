.class Lcom/google/android/gms/internal/zzaky$5;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzakz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaky;->zzaa(Lcom/google/android/gms/internal/zzajq;)V
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
        "Ljava/util/Map",
        "<",
        "Lcom/google/android/gms/internal/zzalk;",
        "Lcom/google/android/gms/internal/zzakx;",
        ">;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic bgW:Lcom/google/android/gms/internal/zzaky;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaky;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaky$5;->bgW:Lcom/google/android/gms/internal/zzaky;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p2, Ljava/util/Map;

    check-cast p3, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaky$5;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Ljava/lang/Void;)Ljava/lang/Void;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzalk;",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;",
            "Ljava/lang/Void;",
            ")",
            "Ljava/lang/Void;"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

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

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-boolean v2, v0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaky$5;->bgW:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakx;->zzcxa()Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzaky;Lcom/google/android/gms/internal/zzakx;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
