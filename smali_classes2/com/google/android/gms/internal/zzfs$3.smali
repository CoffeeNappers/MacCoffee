.class Lcom/google/android/gms/internal/zzfs$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfs;->zza(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzall:Ljava/lang/String;

.field final synthetic zzbrg:Ljava/lang/String;

.field final synthetic zzbrk:Lcom/google/android/gms/internal/zzfs;

.field final synthetic zzbrl:Ljava/lang/String;

.field final synthetic zzbrm:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrk:Lcom/google/android/gms/internal/zzfs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$3;->zzall:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrg:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrl:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrm:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "event"

    const-string/jumbo v2, "precacheCanceled"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "src"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$3;->zzall:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrg:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "cachedSrc"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrg:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string/jumbo v1, "type"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrk:Lcom/google/android/gms/internal/zzfs;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrl:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "reason"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrl:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrm:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "message"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrm:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfs$3;->zzbrk:Lcom/google/android/gms/internal/zzfs;

    const-string/jumbo v2, "onPrecacheEvent"

    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
