.class Lcom/google/android/gms/internal/zzfs$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfs;->zza(Ljava/lang/String;Ljava/lang/String;IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzall:Ljava/lang/String;

.field final synthetic zzbrg:Ljava/lang/String;

.field final synthetic zzbrh:I

.field final synthetic zzbri:I

.field final synthetic zzbrj:Z

.field final synthetic zzbrk:Lcom/google/android/gms/internal/zzfs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfs;Ljava/lang/String;Ljava/lang/String;IIZ)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrk:Lcom/google/android/gms/internal/zzfs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzall:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrg:Ljava/lang/String;

    iput p4, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrh:I

    iput p5, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbri:I

    iput-boolean p6, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrj:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v0, "event"

    const-string/jumbo v2, "precacheProgress"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "src"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzall:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "cachedSrc"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrg:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "bytesLoaded"

    iget v2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrh:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "totalBytes"

    iget v2, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbri:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v2, "cacheReady"

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrj:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "1"

    :goto_0
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfs$1;->zzbrk:Lcom/google/android/gms/internal/zzfs;

    const-string/jumbo v2, "onPrecacheEvent"

    invoke-static {v0, v2, v1}, Lcom/google/android/gms/internal/zzfs;->zza(Lcom/google/android/gms/internal/zzfs;Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_0
    const-string/jumbo v0, "0"

    goto :goto_0
.end method
