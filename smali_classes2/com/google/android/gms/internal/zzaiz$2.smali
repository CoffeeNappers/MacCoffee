.class Lcom/google/android/gms/internal/zzaiz$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaiz$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bbv:Lcom/google/android/gms/internal/zzaiz;

.field final synthetic bby:Lcom/google/android/gms/internal/zzajb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzajb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz$2;->bbv:Lcom/google/android/gms/internal/zzaiz;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz$2;->bby:Lcom/google/android/gms/internal/zzajb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbz(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x0

    const-string/jumbo v0, "s"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v2, "ok"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v1, "d"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$2;->bby:Lcom/google/android/gms/internal/zzajb;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz$2;->bby:Lcom/google/android/gms/internal/zzajb;

    invoke-interface {v2, v0, v1}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method
